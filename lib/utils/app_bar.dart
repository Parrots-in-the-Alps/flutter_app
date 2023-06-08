import 'package:flutter/material.dart';

class VulcanAppBar extends StatefulWidget implements PreferredSizeWidget {
  const VulcanAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String title;

  @override
  State<VulcanAppBar> createState() => _VulcanAppBarState();
}

class _VulcanAppBarState extends State<VulcanAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
              right: 12.0), // set the horizontal padding to 16.0
          child: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
