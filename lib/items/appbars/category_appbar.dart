import 'package:flutter/material.dart';

class CategoryAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  // final Size coustomAppbar;
  final String? card_text;

  const CategoryAppbar({
    super.key,
    required this.card_text,
  });
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ), // 👈 غير الأيقونة
        onPressed: () =>
            Navigator.of(context).pop(),
      ),
      title: Text(
        card_text ?? 'Error',
        style: TextStyle(
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
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
      backgroundColor: Colors.black,
    );
  }
}
