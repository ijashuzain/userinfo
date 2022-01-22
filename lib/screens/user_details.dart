import 'package:flutter/material.dart';
import 'package:user_info/models/user.dart';
import 'package:user_info/widgets/user_data_tile.dart';

class UserDetails extends StatelessWidget {
  final User? user;
  const UserDetails({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text("${user!.name}"),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width / 1.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: NetworkImage(user!.profileImage ??
                              'https://i.ibb.co/nD12BKf/userprofile.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 10),
                Text("${user!.username}"),
                SizedBox(height: 30),
                UserDataTile(
                  title: "Email",
                  content: user!.email,
                ),
                UserDataTile(
                  title: "Phone",
                  content: user!.phone,
                ),
                UserDataTile(
                  title: "Website",
                  content: user!.website,
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                "Address",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${user!.address!.city}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "${user!.address!.street}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "${user!.address!.zipcode}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                "Company",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${user!.company!.name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "${user!.company!.catchPhrase}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "${user!.company!.bs}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
