import 'package:case_questions/product/model/user_model.dart';
import 'package:case_questions/product/service/photo_service.dart';
import 'package:flutter/material.dart';

class detail_icon extends StatelessWidget {
  const detail_icon({
    Key? key,
    required this.currentPerson,
  }) : super(key: key);

  final UsersModel currentPerson;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        String imageUrl;
        fetchUserImage(currentPerson.id!).then((url) {
          imageUrl = url;
          _showUserDetails(context, imageUrl);
        });
      },
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  Future<dynamic> _showUserDetails(BuildContext context, String imageUrl) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              Center(
                child: Text(
                  ' ${currentPerson.name} ' + '${currentPerson.username}',
                ),
              ),
              Text('E-mail: ${currentPerson.email}'),
              Text('Telefon:${currentPerson.phone}'),
              Padding(
                padding: EdgeInsets.only(right: 16.0), // Sağa boşluk ekleyin
                child: Text('Adres:${currentPerson.address?.street}' +
                    '${currentPerson.address?.suite}' +
                    '${currentPerson.address?.city}' +
                    '${currentPerson.address?.zipcode}'),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0), // Sağa boşluk ekleyin
                child: Text(' Şehir: ${currentPerson.company?.name}' +
                    '${currentPerson.company?.catchPhrase}' +
                    '${currentPerson.company?.bs}'),
              ),
              Text('Konum:${currentPerson.address!.geo!.lat}' +
                  '/' +
                  '${currentPerson.address!.geo!.lng}'),
            ],
          ),
        );
      },
    );
  }
}
