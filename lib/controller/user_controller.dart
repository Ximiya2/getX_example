import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/models/postModel.dart';
import 'package:get_x_example/models/usersModel.dart';
import 'package:get_x_example/service/post_service.dart';
import '../service/users_service.dart';
import '../service/utils_service.dart';

class UsersController extends GetxController {
  var isLoading = false.obs;
  var users = [].obs;

  TextEditingController nameCtr = TextEditingController();

  void apiUserList() async {
    isLoading.value = true;
    var res = await GetUsersService.getUsers();
    if(res != null){
      users.value = res;
    }
    isLoading.value = false;
  }

  void deleteUser(BuildContext context, UsersModel user) async {
    isLoading.value = true;
    bool result = await GetUsersService.deleteUsers(user.id);
    if (result) {
      Utils.snackBarSucces('Deleted successfully', context);
    } else {
      Utils.snackBarError('Something is wrong', context);
    }
    isLoading.value = false;
  }

  void editUser(
      BuildContext context,
      TextEditingController nameCtr,
      UsersModel user,
      int index
      ) {
    nameCtr.text = user.name;
    _showBottomSheet(context, () async {
          if(nameCtr.text.isNotEmpty) {
            UsersModel newUser = UsersModel(
                id: 1,
                name: nameCtr.text,
                username: 'username',
                email: 'email',
                phone: 'phone',
                website: 'website',
                company: null,
                address: null);
            bool result = await GetUsersService.editUsers(newUser);

            if(result){
              Utils.snackBarSucces('Update successfully', context);
              Navigator.pop(context);
            } else {
              Utils.snackBarError('Someting is wrong', context);
            }
          } else {
            Utils.snackBarError('Please fill all fileds', context);
          }
        });
  }

  void _showBottomSheet(BuildContext context, void Function() func) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context,) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Add new name',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TextFormField(
                    controller: nameCtr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  ElevatedButton(
                    onPressed: func,
                    child: Text('Add'),
                  ),
                  SizedBox(height: 400,)
                ],
              ),
            ),
          );
        });
  }
}