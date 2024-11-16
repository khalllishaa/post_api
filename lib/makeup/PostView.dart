import 'package:apii/makeup/PostController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostView extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX API'),
      ),
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: postController.postList.length,
            itemBuilder: (context, index) {
              final post = postController.postList[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Section
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          post.imageLink,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.image_not_supported, size: 60),
                        ),
                      ),
                      SizedBox(width: 16),
                      // Text Information Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Brand: ${post.brand ?? "Unknown"}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              post.description ?? "No description available",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Price: ${post.price ?? "N/A"}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}