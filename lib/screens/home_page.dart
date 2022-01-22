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

  bool isSearching = false;

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
            child: isSearching
                ? Container(
                    height: 30,
                    width: 230,
                    child: TextFormField(
                      onChanged: (val) {
                        if (val == "") {
                          setState(() {
                            isSearching = false;
                          });
                        }
                        context.read<UserProvider>().searchUser(val);
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSearching = false;
                            });
                          },
                          icon: Icon(
                            Icons.close,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
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
              return isSearching
                  ? ListView.builder(
                      itemCount: provider.searchList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return UserTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetails(
                                  user: provider.searchList[index],
                                ),
                              ),
                            );
                          },
                          image: provider.searchList[index].profileImage,
                          title: provider.searchList[index].name,
                          subtitle: provider.searchList[index].company!.name,
                        );
                      },
                    )
                  : ListView.builder(
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
