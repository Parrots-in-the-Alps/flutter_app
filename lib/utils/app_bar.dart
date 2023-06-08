import 'package:flutter/material.dart';

class VulcanAppBar extends StatefulWidget {
  const VulcanAppBar({super.key, required this.title});

  final String title; // <-- Add this

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
