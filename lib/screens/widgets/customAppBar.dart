import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/menu.svg')),
            const CircleAvatar(
                backgroundImage: AssetImage('assets/images/jrlogo.png'))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
