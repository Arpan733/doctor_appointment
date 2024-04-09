import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.appTitle, this.route, this.icon, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String? appTitle;
  final String? route;
  final FaIcon? icon;
  final List<Widget>? actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        widget.appTitle!,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      leading: widget.icon != null
          ? Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(left: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Config.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  if (widget.route != null) {
                    Navigator.pushNamed(context, widget.route!);
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: widget.icon!,
                iconSize: 16,
                color: Colors.white,
              ),
            )
          : null,
      actions: widget.actions ?? [],
    );
  }
}
