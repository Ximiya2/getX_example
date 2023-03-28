import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_example/controller/splash_controller.dart';
import 'package:get_x_example/models/postModel.dart';
import 'package:get_x_example/view/splash/widgets/splash_item.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final _controller = Get.put(SplashController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<HomeController>().apiPostList();
    _controller.apiSplashList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX'),),
      body: GetX(
        init: SplashController(),
        builder: (controller){
          return Stack(
            children: [
            Padding(
                padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: controller.posts.length,
                  itemBuilder: (ctx, index) {
                    PostModel post = controller.posts[index];
                    return splashItem(
                        context: context,
                        post: post,
                    );
                  }
              ),
            ),
              controller.isLoading.value
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
