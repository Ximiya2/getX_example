import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_x_example/screen/users/widgets/items/user_albums_item.dart';
import '../../service/userId_service.dart';

class UserAlbumsPage extends StatefulWidget {
   UserAlbumsPage({this.id,Key? key}) : super(key: key);
int? id;
  @override
  State<UserAlbumsPage> createState() => _UserAlbumsPageState();
}
TextEditingController idCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController userIdCtr = TextEditingController();

class _UserAlbumsPageState extends State<UserAlbumsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: GetUserPostService.getUserIdAlbum(widget.id!),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i){
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: UserAlbumsItem(
                            context,
                            snapshot.data![i],
                                () {
                                  userIdCtr.text = widget.id.toString();
                                  idCtr.text = snapshot.data![i].id.toString();
                                  titleCtr.text = snapshot.data![i].title;
                            }),
                      );
                    });
              } else {
                return const Center(
                  child: Text('No data'),);
              }
            }),
      ),
    );
  }
}
