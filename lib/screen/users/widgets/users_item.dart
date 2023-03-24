import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x_example/controller/user_controller.dart';
import '../../../models/usersModel.dart';

Widget UsersItem(
    BuildContext context,
    UsersModel users,{
      required UsersController controller,
      required void Function() edit, }) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
      users.name,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Colors.black
      ),
      ),
      Column(
        children: [
          IconButton(
              onPressed: (){
                controller.deleteUser(context, users);
              },
              icon: Icon(Icons.delete)),

          IconButton(
              onPressed: edit,
              icon: Icon(Icons.edit)),
        ],
      )
    ],
  );
}