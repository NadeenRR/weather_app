// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:weather_app/services/networking.dart';

import '../utilities/constants.dart';

class SearchFieldWidget extends StatelessWidget {
  SearchFieldWidget({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);
  // final EdgeInsetsGeometry padding;
  // final Function(String)? submitted;
  final TextEditingController controller;
  final Function() onPressed;

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 36,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 164, 94, 173).withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        const SizedBox(width: 8),
        //  SvgPicture.asset(Constants.kIconSearch),
        const SizedBox(width: 8),
        Expanded(
          // flex: 5,
          child: TextField(
            //    onSubmitted: widget.submitted,
            onChanged: (value) {
              cityName = value;
            },
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.black.withOpacity(0.9),
              fontSize: 17,
              letterSpacing: -0.14,
            ),
            decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.14,
                )),
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
        ),
      ]),
    );
  }
}
