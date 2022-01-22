import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_info/providers/user_provider.dart';
import 'package:user_info/screens/user_details.dart';
import 'package:user_info/utils/enums.dart';
import 'package:user_info/widgets/user_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read<UserProvider>().getUserList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text("User Info"),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                //
              },
              icon: Icon(
                Icons.search_rounded,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<UserProvider>(builder: (context, provider, child) {
            if (provider.userFetchStatus == Status.LOADING) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: provider.userList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return UserTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetails(
                            user: provider.userList[index],
                          ),
                        ),
                      );
                    },
                    image: provider.userList[index].profileImage,
                    title: provider.userList[index].name,
                    subtitle: provider.userList[index].company!.name,
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
