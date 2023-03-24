import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x_example/screen/users/userAlbum_page.dart';
import 'package:get_x_example/screen/users/userPostsPage.dart';

class UserView extends StatefulWidget {
   UserView({this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView>
    with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        title: Text('User',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal
          ),),
        bottom: TabBar(
          //labelStyle: TextStyle(fontSize: 18, color: Colors.black),
          indicatorColor: Colors.black45,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          controller: tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: 'Posts',
            ),
            Tab(
              text: 'Albums',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller:tabController ,
        children: [
          UserPostsPage(id: widget.id!,),
          UserAlbumsPage(id: widget.id!,),
        ],
      ),
    );
  }
}