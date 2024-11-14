import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_qlbh/screens/post/post_controller.dart';

class PostScreen extends StatelessWidget {
  PostController postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Posts',
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Obx(
        () {
          return postController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _posts(postController);
        },
      ),
    );
  }

  // posts
  Widget _posts(PostController postController) => Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) {
              var item = postController.postResponse.posts![index];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title!,
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item.body!,
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      children: item.tags!.map(
                        (e) {
                          return Chip(
                            label: Text(
                              e,
                              style: GoogleFonts.nunito(),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.thumb_up),
                        SizedBox(width: 4),
                        Text(
                          '${item.reactions!.likes!}',
                          style: GoogleFonts.nunito(),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.thumb_down),
                        SizedBox(width: 4),
                        Text(
                          '${item.reactions!.dislikes!}',
                          style: GoogleFonts.nunito(),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.remove_red_eye),
                        SizedBox(width: 4),
                        Text(
                          '${item.views!}',
                          style: GoogleFonts.nunito(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: postController.postResponse.posts!.length),
      );
}
