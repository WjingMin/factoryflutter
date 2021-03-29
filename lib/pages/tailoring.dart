import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../compoments/tailoringCom.dart';
import '../pages/search.dart';
import '../apis/model/construction.dart';

class tailoring extends StatefulWidget {
  tailoring({Key key}) : super(key: key);

  @override
  _tailoringState createState() => _tailoringState();
}

class _tailoringState extends State<tailoring>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int type = 0;
  // @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
    )..addListener(() {});
    this._getList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0, //默认显示第几个
        length: 3, //有几个tab页面
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                backgroundColor: Color.fromRGBO(96, 208, 72, 1),
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
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
                                  SizedBox(width: 40.w),
                                  Text('7years',
                                      style: TextStyle(
                                          fontSize: 40.w,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                              flex: 1),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ClipRRect(
                                    child: GestureDetector(
                                      child: Container(
                                        width: 200.w,
                                        height: 90.w,
                                        color:
                                            Color.fromRGBO(250, 250, 250, 0.3),
                                        padding: EdgeInsets.all(20.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.search,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text('搜索',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 35.w))
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => search(),
                                          ),
                                        );
                                      },
                                    ),
                                    borderRadius: BorderRadius.circular(40.w)),
                              ],
                            ),
                            flex: 1,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  controller: tabController,
                  //将tab放在appbar中
                  tabs: <Widget>[
                    Tab(text: '生产订单'), //type ===1
                    Tab(text: '待审核'), //type ===2
                    Tab(text: '审核不通过'), //type ===3
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(300.w)),
          body: TabBarView(
            controller: tabController,
            children: [
              Container(
                  width: double.infinity,
                  height: ScreenUtil().screenHeight - 300.w,
                  color: Color.fromRGBO(242, 242, 242, 1),
                  child: tailoringCom(type: 1)),
              Center(
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().screenHeight - 300.w,
                  color: Color.fromRGBO(242, 242, 242, 1),
                  child: tailoringCom(type: 2),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().screenHeight - 300.w,
                  color: Color.fromRGBO(242, 242, 242, 1),
                  child: tailoringCom(type: 3),
                ),
              ),
            ],
          ),
        ));
  }

  _getList() async {
    // try {
    //   await Construction.getConstructionList().then((value) => print(value));
    // } catch (error) {
    //   print(error);
    //   var data = jsonDecode(error.response.toString());
    //   print(data);
    // }
  }
}
