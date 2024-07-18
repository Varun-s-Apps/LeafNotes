import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leaf_notes/router/page_const.dart';
import 'package:leaf_notes/ui/widgets/common/d_gap.dart';
import 'package:leaf_notes/utils/constants/colors.dart';
import 'package:leaf_notes/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushNamed(context, PageConstants.profilePage);
            },
            icon: const Icon(Icons.circle_rounded)),
        // backgroundColor:theme.of,
        title: const Text("Leaf Notes"),
        actions: const [
          Icon(Icons.refresh),
          DGap(isHorizontal: true),
          Icon(Icons.logout),
          DGap(isHorizontal: true),
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
