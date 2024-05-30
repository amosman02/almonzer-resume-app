import 'package:flutter/material.dart';
import 'package:portfolio/widgets/kf_drawer.dart';

class Notifications extends KFDrawerContent {
  Notifications({super.key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                  child: Material(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: widget.onMenuPressed,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Notifications'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
