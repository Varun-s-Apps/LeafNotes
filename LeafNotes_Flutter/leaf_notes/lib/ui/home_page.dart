import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:leaf_notes/cubit/auth/auth_cubit.dart';
import 'package:leaf_notes/router/page_const.dart';
import 'package:leaf_notes/ui/widgets/common/d_gap.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  final String uid;
  const HomePage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    print(uid);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, PageConstants.addNotePage);
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, PageConstants.profilePage, arguments: uid);
          },
          icon: const Icon(Icons.circle_rounded),
          iconSize: 40,
        ),
        // backgroundColor:theme.of,
        title: Text("Leaf Notes"),
        centerTitle: true,
        actions: [
          Icon(Icons.refresh),
          SizedBox(width: dPadding * 2),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthCubit>().loggedOut();
            },
          ),
          SizedBox(width: dPadding * 2),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(dPadding),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return BuildNotesContainer(
              onTap: () {
                Navigator.pushNamed(context, PageConstants.updateNotePage);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const DGap();
          },
        ),
      ),
    );
  }
}

class BuildNotesContainer extends StatelessWidget {
  final VoidCallback onTap;

  const BuildNotesContainer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(dPadding),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dBorderRadius),
              border: Border.all(width: dBorderWidth / 2),
              color: dWhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //DETAILS
              Column(
                //properties
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,

                //children
                children: [
                  const Text("TITLE"),
                  const Text("description"),
                  Text(
                      DateFormat("dd MMMM yyy hh:mm a").format(DateTime.now())),
                ],
              ),

              const IconButton(onPressed: null, icon: Icon(Icons.more_vert))
            ],
          )),
    );
  }
}
