import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Title"),
      subtitle: Text("Subtitle"),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 12,
      ),
    );
  }
}
