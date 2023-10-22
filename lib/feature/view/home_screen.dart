import 'package:case_questions/feature/view/deatil_popup.dart';
import 'package:case_questions/product/model/user_model.dart';
import 'package:case_questions/product/service/photo_service.dart';
import 'package:case_questions/product/service/users_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UsersModel> users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers().then((userList) {
      setState(() {
        users = userList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iWallet Project"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15,
                    ),
                    hintText: "Kullanıcı Ara",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {});
                      },
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(child: _cardDetail()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _cardDetail() {
  return ListView.builder(
    itemCount: searchList.isNotEmpty ? searchList.length : users.length,
    itemBuilder: (BuildContext context, int index) {
      var currentPerson =
          searchList.isNotEmpty ? searchList[index] : users[index];
      return Card(
        child: ListTile(
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [detail_icon(currentPerson: currentPerson)],
          ),
          title: Text(currentPerson.name!),
          subtitle: Text(currentPerson.username!),
          leading: FutureBuilder(
            future: fetchUserImage(currentPerson.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Icon(Icons.error);
              } else {
                return CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data!),
                );
              }
            },
          ),
        ),
      );
    },
  );
}
