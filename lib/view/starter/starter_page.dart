import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/models/postModel.dart';
import 'package:get_x_example/view/starter/widgets/starter_item.dart';
import '../../controller/starter_controller.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {

  final _controller = Get.put(StarterController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<HomeController>().apiPostList();
    _controller.apiStarterList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX'),),
      body: GetX(
        init: StarterController(),
        builder: (controller){
          return Stack(
            children: [
            Padding(
                padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: controller.posts.length,
                  itemBuilder: (ctx, index) {
                    PostModel post = controller.posts[index];
                    return starterItem(
                        context: context,
                        post: post,
                    );
                  }
              ),
            ),
              controller.isLoading
              ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
