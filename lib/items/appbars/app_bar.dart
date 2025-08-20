import 'package:flutter/material.dart';

class coustom_Appbar extends StatelessWidget
    implements PreferredSizeWidget {
  // final Size coustomAppbar;
  const coustom_Appbar({super.key});
  // : coustomAppbar = const Size.fromHeight(kToolbarHeight),
  //   super(key: key);
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'The ',
              style: TextStyle(
                fontFamily:
                    'Manufacturing_Consent',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'News',
              style: TextStyle(
                fontFamily:
                    'Manufacturing_Consent',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      shadowColor: Colors.black,
      elevation: 3,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white70,
    );
  }
}
