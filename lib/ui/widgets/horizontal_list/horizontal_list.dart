
import 'package:flutter/material.dart';
import 'package:memorylif/application/core/extensions/extensions.dart';

import 'horizontal_list_item.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    Key? key,

  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 280 ,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 30),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return HorizontalListItem(index: index);
          }),
    );
  }
}
