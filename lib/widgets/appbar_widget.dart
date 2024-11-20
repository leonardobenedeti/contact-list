import 'package:contact_list/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Text('CG', style: TextStyle(color: Colors.black)),
          ),
          const Spacer(),
          const Stack(
            children: [
              Icon(Icons.notifications_none, size: 28),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: CustomColors.bluePrimary,
                  child: Text(
                    '02',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
