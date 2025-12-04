import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white.withValues(alpha: 0.5),
        border: BoxBorder.all(color: Colors.amber, width: 0.5),
      ),
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(10),
          hint: Text('Search Products....'),
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
