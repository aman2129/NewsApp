import 'package:flutter/material.dart';

class BackButtonUi extends StatelessWidget {
  const BackButtonUi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: CircleAvatar(
        radius: 60.0,
        backgroundColor: Colors.black45,
        child: IconButton(
          splashColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
