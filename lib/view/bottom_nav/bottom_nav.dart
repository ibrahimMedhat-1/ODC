import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:odc_project/view_model/bloc/bottom_nav/nav_cubit.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavCubit(),
      child: BlocConsumer<NavCubit, NavState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          NavCubit n = NavCubit.get(context);
          return Scaffold(
            bottomNavigationBar: GNav(
              // selectedItemColor: Colors.deepOrange,
              // currentIndex: n.item,
              // onTap: (index) {
              //   n.indexChange(index);
              // },
              selectedIndex: n.item,
              onTabChange: (index) {
                n.indexChange(index);
              },
              activeColor: Colors.deepOrange,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.archive,
                  text: 'News',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
            ),
            body: n.open(n.item),
          );
        },
      ),
    );
  }
}
