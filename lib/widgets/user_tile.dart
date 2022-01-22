import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;

  const UserTile({Key? key, this.image, this.title, this.subtitle, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap!();
      },
      title: Text("$title"),
      subtitle: Text("$subtitle"),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
            image: DecorationImage(image: NetworkImage(image ?? 'https://i.ibb.co/nD12BKf/userprofile.png'))),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 12,
      ),
    );
  }
}
