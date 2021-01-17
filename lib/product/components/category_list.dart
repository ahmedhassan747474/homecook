import 'package:flutter/material.dart';
import './body.dart';
import 'package:homecook/constants.dart';

// We need statefull widget because we are gonna change some state on our category
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected

  List categories = ['الأطباق الجانبية ', ' الأطباق الرئيسية'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              print(selectedIndex);
            });
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 70,
                // At end item it add extra 20 right  padding
                right: index == categories.length - 1 ? 30 : 0,
              ),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: index == selectedIndex
                    ? Colors.white.withOpacity(0.4)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                categories[index],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
