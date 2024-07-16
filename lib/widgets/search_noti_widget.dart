import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchAndNotiWidget extends StatelessWidget {
  const SearchAndNotiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                hintText: 'Dogecoin to the Moon...',
                suffixIcon: Icon(
                  Icons.search,
                  size: 38,
                ),
                //  SvgPicture.asset(
                //   'assets/images/search_icon.svg',
                // ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
          )),
          SizedBox(
            width: 16,
          ),
          SvgPicture.asset(
            'assets/images/notification_icon.svg',
            height: 50,
          )
        ],
      ),
    );
  }
}
