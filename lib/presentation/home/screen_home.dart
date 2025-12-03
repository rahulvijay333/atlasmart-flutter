import 'package:flutter/material.dart';

import '../../domain/constants/strings.dart';
import 'widgets/search_bar_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.amber.withValues(alpha: 0.1),
          actions: [Icon(Icons.notifications, size: 28), SizedBox(width: 10)],
          title: Row(
            spacing: 5,
            children: [
              Image.asset('assets/logo_icon.png', height: 28, width: 30),
              Text(
                AppStrings.appTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: SearchBarWidget(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 80,
            margin: EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      color: Colors.red.shade100,
                    ),
                  ),
                ),
                itemCount: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
