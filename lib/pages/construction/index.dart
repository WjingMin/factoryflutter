// 施工单的列表
//
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'compoments/constructionList.dart';
import '../../apis/model/construction.dart';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List listdata = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Color.fromRGBO(96, 208, 72, 1),
            automaticallyImplyLeading: false,
            elevation: 0, //appbar 的阴影效果
            title: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('施工单'),
                        flex: 1,
                      ),
                      Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ClipOval(
                                child: Container(
                                    width: 130.w,
                                    height: 130.w,
                                    child: Image.network(
                                      'https://tfs.alipayobjects.com/images/partner/TB1LX8pXlaEMeJjme5tXXcEKFXa',
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ],
                          ),
                          flex: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(150.w)),
      body: Center(
          child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              color: Color.fromRGBO(96, 208, 72, 1),
              height: 120.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.w),
                  child: Container(
                      width: 1000.w,
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
                          ))))),
          Container(
            width: double.infinity,
            height: ScreenUtil().screenHeight - 500.w,
            color: Color.fromRGBO(242, 242, 242, 1),
            child: consstructionCom(),
          ),
        ],
      )),
    );
  }

  _getConstructionList() async {
    var data = await Construction.getConstructionList({'page': 0, 'count': 10});
    print(jsonDecode(data.toString())['items']);
    this.listdata = jsonDecode(data.toString())['items'];
  }
}
