import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_x_example/models/usersModel.dart';
import 'package:get_x_example/view/users/widgets/users_item.dart';
import '../../controller/user_controller.dart';

class UsersPage extends StatefulWidget {
   UsersPage({Key? key}) : super(key: key);


  @override
  State<UsersPage> createState() => _UsersPageState();
}
TextEditingController nameCtr = TextEditingController();


class _UsersPageState extends State<UsersPage> {

  final _controller = Get.put(UsersController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<HomeController>().apiPostList();
    _controller.apiUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Users', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Obx(() => Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: _controller.users.length,
              itemBuilder: (context, index){
                UsersModel user = _controller.users[index];
                return UsersItem(
                    context,
                    user,
                    controller: _controller,
                    edit: (){_controller.editUser(context, _controller.nameCtr, user, index);},
                );
              }),
        ),
        _controller.isLoading.value
            ? Center(
              child: CircularProgressIndicator(),
              )
            : SizedBox.shrink()
      ],
    )),
    );
  }
}

