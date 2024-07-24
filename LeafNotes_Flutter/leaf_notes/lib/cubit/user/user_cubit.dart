import 'package:bloc/bloc.dart';
import 'package:leaf_notes/models/user_model.dart';
import 'package:leaf_notes/repository/network_repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  final networkRepository = NetworkRepository();
  UserCubit() : super(UserInitial());


  //FUNCTION TO FETCH PROFILE
  Future<void> getProfile(UserModel user) async {
    try {
      final userData = await networkRepository.myProfile(user);
      emit(UserLoaded(userData));
      
    } catch (_) {

      emit(UserFailure());
      
    }

  }

  //FUNCTION TO UPDATE PROFILE
  Future<void> updateProfile(UserModel user) async {
    try {
      await networkRepository.updateProfile(user);
      
    } catch (_) {

      emit(UserFailure());
      
    }

  }
}
