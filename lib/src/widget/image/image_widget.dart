import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:naqsh_client/src/model/http/http_model.dart';
import 'package:naqsh_client/src/model/image/image_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageWidget extends StatefulWidget {
  final int id;

  const ImageWidget({Key? key, required this.id})
      : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  initState() {
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "https://naqshsoft.site/images/$image",
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Center(child: Icon(Icons.image)),
      ),
    );
  }

  getImage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? db = preferences.getString('db');
    http.Response response = await http.get(Uri.parse(
        'https://naqshsoft.site/skl2?DB=$db&ID=${widget.id}'));
    var result = GetImageModel.fromJson(json.decode(response.body));
    setState(() {
      image = result.data[0].photo;
    });
  }
  String image = '';
}
