import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x_example/screen/home/homeView.dart';
import 'package:get_x_example/screen/users/usres_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
                child: Text('Posts')),
          ),

          ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsersPage())
                );
              },
              child: Text('Users')),
        ],
      ),
    );
  }
}
