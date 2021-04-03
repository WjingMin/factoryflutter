import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../../apis/model/construction.dart';

class consstructionCom extends StatefulWidget {
  // List dataList = [];
  // consstructionCom(List listdata, {this.dataList});
  @override
  _consstructionComState createState() => _consstructionComState();
}

class _consstructionComState extends State<consstructionCom> {
  List data = [];
  @override
  void initState() {
    this._getConstructionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EasyRefresh(
          footer: ClassicalFooter(
              loadText: '加载loadtest',
              loadedText: '没有更多了',
              noMoreText: '',
              showInfo: false,
              loadingText: '正在加载中'),
          header: ClassicalHeader(
              noMoreText: '',
              showInfo: false,
              refreshText: '上拉加载更多',
              refreshReadyText: '上拉加载更多',
              refreshingText: '正在刷新',
              refreshedText: '刷新完成'),
          onRefresh: () async {
            print('onRefresh');
          },
          onLoad: () async {
            print('onLoad');
          },
          child: SingleChildScrollView(
            child: Column(children: this._getData()
                // [
                // SizedBox(height: 20.h),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(20.w),
                //   child: Container(
                //     width: 1030.w,
                //     // height: 500.h,
                //     padding: EdgeInsets.all(30.w),
                //     color: Colors.white,
                //     child: Column(
                //       children: [
                //         Row(
                //           children: [
                //             Expanded(
                //                 child: Text(
                //                   '订单编号:BYL_W87182781789',
                //                   style: TextStyle(
                //                       fontSize: 15,
                //                       fontWeight: FontWeight.w700),
                //                   // overflow: TextOverflow.ellipsis,
                //                 ),
                //                 flex: 3),
                //             Expanded(
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.end,
                //                   children: [
                //                     Text(
                //                       '188291',
                //                       style: TextStyle(color: Colors.red),
                //                     ),
                //                     Text('/'),
                //                     Text('9999999',
                //                         style: TextStyle(
                //                             color: Color.fromRGBO(
                //                                 96, 208, 72, 1))),
                //                   ],
                //                 ),
                //                 flex: 2)
                //           ],
                //         ),
                //         SizedBox(
                //           height: 20.w,
                //         ),
                //         Row(
                //           children: [
                //             ClipRRect(
                //               borderRadius: BorderRadius.circular(10.w),
                //               child: Container(
                //                 padding: EdgeInsets.all(15.w),
                //                 color: Color.fromRGBO(242, 242, 242, 1),
                //                 child: Text(
                //                   '原料:正常',
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(
                //                       color: Color.fromRGBO(96, 208, 72, 1)),
                //                 ),
                //               ),
                //             ),
                //             SizedBox(width: 30.w),
                //             ClipRRect(
                //               borderRadius: BorderRadius.circular(10.w),
                //               child: Container(
                //                 padding: EdgeInsets.all(15.w),
                //                 color: Color.fromRGBO(242, 242, 242, 1),
                //                 child: Text(
                //                   '剩余:15天',
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(
                //                       color: Color.fromRGBO(96, 208, 72, 1)),
                //                 ),
                //               ),
                //             ),
                //             SizedBox(width: 30.w),
                //             ClipRRect(
                //               borderRadius: BorderRadius.circular(10.w),
                //               child: Container(
                //                 padding: EdgeInsets.all(15.w),
                //                 color: Color.fromRGBO(242, 242, 242, 1),
                //                 child: Text(
                //                   '包装:1500',
                //                   textAlign: TextAlign.center,
                //                   style: TextStyle(
                //                       color: Color.fromRGBO(96, 208, 72, 1)),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(height: 20.h),
                //         Row(
                //           children: [
                //             Expanded(child: Text('产品名称:'), flex: 1),
                //             Expanded(
                //                 child: Text(
                //                   '7#上等蘑菇9',
                //                 ),
                //                 flex: 4)
                //           ],
                //         ),
                //         SizedBox(height: 20.h),
                //         Row(
                //           children: [
                //             Expanded(child: Text('规格型号:'), flex: 1),
                //             Expanded(
                //                 child: Text(
                //                   '0.18*940*926',
                //                 ),
                //                 flex: 4)
                //           ],
                //         ),
                //         SizedBox(height: 20.h),
                //         Row(
                //           children: [
                //             Expanded(child: Text('下单日期:'), flex: 1),
                //             Expanded(
                //                 child: Text(
                //                   '2020-11-28 9:53:10',
                //                 ),
                //                 flex: 4)
                //           ],
                //         ),
                //         SizedBox(height: 20.h),
                //         Row(
                //           children: [
                //             Expanded(child: Text('交货日期:'), flex: 1),
                //             Expanded(
                //                 child: Text(
                //                   '2020-11-28 9:53:10',
                //                 ),
                //                 flex: 4)
                //           ],
                //         ),
                //         SizedBox(height: 20.h),
                //         Row(
                //           children: [
                //             Expanded(child: Text('剩余时间:'), flex: 1),
                //             Expanded(
                //                 child: Text(
                //                   '7天',
                //                 ),
                //                 flex: 4)
                //           ],
                //         ),
                //         SizedBox(height: 20.h),
                //       ],
                //     ),
                //   ),
                // ),
                // ],
                ),
          )),
    );
  }

  _getConstructionList() async {
    var data = await Construction.getConstructionList({'page': 0, 'count': 10});
    print(jsonDecode(data.toString())['items']);
    setState(() {
      this.data = jsonDecode(data.toString())['items'];
    });
    // this._getData();
  }

  List<Widget> _getData() {
    var list = this.data.map((obj) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20.w),
        child: Container(
          width: 1030.w,
          // height: 500.h,
          padding: EdgeInsets.all(30.w),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                        '订单编号:' + obj["process_schedule_type"].toString(),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                        // overflow: TextOverflow.ellipsis,
                      ),
                      flex: 3),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '188291',
                            style: TextStyle(color: Colors.red),
                          ),
                          Text('/'),
                          Text('9999999',
                              style: TextStyle(
                                  color: Color.fromRGBO(96, 208, 72, 1))),
                        ],
                      ),
                      flex: 2)
                ],
              ),
              SizedBox(
                height: 20.w,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.w),
                    child: Container(
                      padding: EdgeInsets.all(15.w),
                      color: Color.fromRGBO(242, 242, 242, 1),
                      child: Text(
                        '原料:正常',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromRGBO(96, 208, 72, 1)),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.w),
                    child: Container(
                      padding: EdgeInsets.all(15.w),
                      color: Color.fromRGBO(242, 242, 242, 1),
                      child: Text(
                        '剩余:15天',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromRGBO(96, 208, 72, 1)),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.w),
                    child: Container(
                      padding: EdgeInsets.all(15.w),
                      color: Color.fromRGBO(242, 242, 242, 1),
                      child: Text(
                        '包装:1500',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromRGBO(96, 208, 72, 1)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(child: Text('产品名称:'), flex: 1),
                  Expanded(
                      child: Text(
                        obj['product_out']['goods_info'].toString(),
                      ),
                      flex: 4)
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(child: Text('规格型号:'), flex: 1),
                  Expanded(
                      child: Text(
                        '0.18*940*926',
                      ),
                      flex: 4)
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(child: Text('下单日期:'), flex: 1),
                  Expanded(
                      child: Text(
                        '2020-11-28 9:53:10',
                      ),
                      flex: 4)
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(child: Text('交货日期:'), flex: 1),
                  Expanded(
                      child: Text(
                        '2020-11-28 9:53:10',
                      ),
                      flex: 4)
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(child: Text('剩余时间:'), flex: 1),
                  Expanded(
                      child: Text(
                        '7天',
                      ),
                      flex: 4)
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    });
    return list.toList();
  }
}
