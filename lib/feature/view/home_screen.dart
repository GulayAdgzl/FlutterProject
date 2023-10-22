import 'package:case_questions/feature/view/deatil_popup.dart';
import 'package:case_questions/feature/viewModel/loading_viewModel.dart';
import 'package:case_questions/product/model/user_model.dart';
import 'package:case_questions/product/service/photo_service.dart';
import 'package:case_questions/product/service/users_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FocusNode _focusNode;
  late final LoadingViewModel _loadingViewModel;
  bool isSearch = false;
  TextEditingController searchController = TextEditingController();
  List<UsersModel> users = [];
  List<UsersModel> searchList = [];

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _loadingViewModel = LoadingViewModel();
    fetchUsers().then((userList) {
      setState(() {
        users = userList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loadingViewModel,
      builder: (context, child) {
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
                    controller: searchController,
                    focusNode: _focusNode,
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
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                searchController.clear(); // Yazıyı temizle
                                _focusNode.unfocus();
                                isSearch = false;
                                searchList.clear();
                                setState(() {});
                              },
                            )
                          : null,
                    ),
                    onSubmitted: (value) {
                      searchFunc(value);
                    },
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
      },
    );
  }

  void searchFunc(String value) {
    searchList.clear();
    bool resultsFound = false; // Varsayılan olarak sonuç bulunmadı kabul edelim
    for (var people in users) {
      if (people.username!
          .toLowerCase()
          .trim()
          .contains(value.toLowerCase().trim())) {
        searchList.add(people);
        resultsFound =
            true; // Eşleşen bir sonuç bulunduğunda bu değişkeni true yapalım
      }
    }
    setState(() {});

    if (!resultsFound) {
      // Sonuç bulunmadıysa bir uyarı mesajı görüntüleyelim
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(StringText.error),
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
}
