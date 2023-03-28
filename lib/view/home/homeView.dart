import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_x_example/controller/home_controller.dart';
import 'package:get_x_example/models/postModel.dart';
import 'package:get_x_example/view/home/widgets/post_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<HomeController>().apiPostList();
    _controller.apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Posts',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: (){
                _controller.addPost(context,);
              },
              icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Obx(() => Stack(
        children: [
          Padding(
              padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: _controller.posts.length,
                itemBuilder: (ctx, index){
                  PostModel post = _controller.posts[index];
                  return postItem(
                      context: context,
                      post: post,
                      edit: (){
                        _controller.editPost(context, post, index);
                      },
                    controller: _controller,
                  );
                }
            ),
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
