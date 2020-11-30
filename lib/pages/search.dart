import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class search extends StatefulWidget {
  search({Key key}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //修改颜色
        ),
        brightness: Brightness.light, //设置为白色字体
        backgroundColor: Colors.white,
        // shadowColor: Colors.white,
        elevation: 0, //appbar 的阴影效果
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.w),
              child: Container(
                width: 600.w,
                height: 70.h,
                color: Color.fromRGBO(0, 0, 0, 0.05),
                child: TextField(
                  style: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      color: Colors.black),
                  maxLines: 1,
                  decoration: InputDecoration(
                    isDense: true, //输入框图标文字对齐
                    hintText: '请输入关键词进行搜索',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SizedBox(width: 30.w),
            Container(
              width: 200.w,
              height: 70.h,
              child: new MaterialButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(60.w))),
                color: Color.fromRGBO(96, 208, 72, 1),
                textColor: Colors.white,
                child: new Text(
                  '搜索',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: ScreenUtil().screenHeight,
      ),
    );
  }
}
