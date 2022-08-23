import 'package:flutter/material.dart';
import 'package:fos7a/constnats/utils.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();
  CustomSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Container(
      height: size.height * .07,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        focusNode: _searchTextFocusNode,
        controller: _searchTextController,
        onChanged: (value) {},
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.greenAccent, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.greenAccent, width: 1),
          ),
          hintText: "What's in your mind",
          prefixIcon: const Icon(Icons.search),
          suffix: IconButton(
            onPressed: () {
              _searchTextController!.clear();
              _searchTextFocusNode.unfocus();
            },
            icon: Icon(
              Icons.close,
              color: _searchTextFocusNode.hasFocus ? Colors.red : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
