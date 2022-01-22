import 'package:flutter/material.dart';

class UserDataTile extends StatelessWidget {
  final String? title;
  final String? content;
  const UserDataTile({Key? key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            Container(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "$title",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text("$content",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey
                      ),),
                  ],
                ),
              ),
            ),
            Divider()
          ],
        ));
  }
}
