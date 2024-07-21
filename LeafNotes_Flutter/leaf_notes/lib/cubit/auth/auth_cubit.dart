
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:leaf_notes/utils/shared_pref.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final sharedPref = SharedPref();

  Future<void> appStarted() async{
    print("App started");
    try {
      final uid = await sharedPref.getUid();

      if(uid != null){
        //User was logged in already
        emit(Authenticated(uid));
      }else{
        //USER NOT AUTHENTICATED
        emit(UnAuthenticated());
      }

    } catch (e) {
      print("Error");
      emit(UnAuthenticated());
    }
  }
    

    Future<void> loggedIn(String uid) async{

      sharedPref.setUid(uid);
      emit(Authenticated(uid));
    }

    Future<void> loggedOut() async{

      sharedPref.setUid("");
      emit(UnAuthenticated());
    }


  }



