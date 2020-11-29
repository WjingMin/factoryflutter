import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class tailoringCom extends StatefulWidget {
  int type = 0;
  tailoringCom({this.type});
  // tailoringCom({this.type});
  // tailoringCom({Key key}) : super(key: key);

  @override
  _tailoringComState createState() => _tailoringComState();
}

class _tailoringComState extends State<tailoringCom> {
  int mytype;
  int boxNumber = 1;
  @override
  void initState() {
    // TODO: implement initState
    this.mytype = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: double.infinity,
        // color: Color.fromRGBO(242, 242, 242, 1),
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
        child: Column(
          children: [
            SizedBox(height: 20.h),
            ClipRRect(
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
                              '订单编号:BYL_W87182781789',
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
                              style: TextStyle(
                                  color: Color.fromRGBO(96, 208, 72, 1)),
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
                              style: TextStyle(
                                  color: Color.fromRGBO(96, 208, 72, 1)),
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
                              style: TextStyle(
                                  color: Color.fromRGBO(96, 208, 72, 1)),
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
                              '7#上等蘑菇9',
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
            ),
            SizedBox(height: 20.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.w),
              child: Container(
                width: 1030.w,
                padding: EdgeInsets.all(30.w),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('裁剪用刀:'), flex: 1),
                        Expanded(
                            child: Text(
                              '波剪',
                            ),
                            flex: 4)
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Text('包装方向:'), flex: 1),
                        Expanded(
                            child: Text(
                              '7天',
                            ),
                            flex: 4)
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Text('包装方向:'), flex: 1),
                        Expanded(
                            child: Text(
                              '简易包装',
                            ),
                            flex: 4)
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Text('埋头方式:'), flex: 1),
                        Expanded(
                            child: Text(
                              '深埋头',
                            ),
                            flex: 4)
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Text('出货方式:'), flex: 1),
                        Expanded(
                            child: Text(
                              '理计',
                            ),
                            flex: 4)
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Text('废料回收:'), flex: 1),
                        Expanded(
                            child: Text(
                              '我司回收',
                            ),
                            flex: 4)
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(child: Text('备注信息:'), flex: 1),
                        Expanded(
                            child: Text(
                              '备注信息备注信息备注信息备注信息备注信息备注信息备注信息备注信息备注信息备注信息备注信息',
                            ),
                            flex: 4)
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            this.mytype == 1
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20.w),
                    child: Container(
                      width: 1030.w,
                      // height: 200.h,
                      color: Colors.white,
                      padding: EdgeInsets.all(30.w),
                      child: Column(
                        children: [
                          Row(children: [
                            Text(
                              '生产情况录入',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ]),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Expanded(child: Text('开始生产时间:'), flex: 1),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(
                                        onPressed: () {
                                          DatePicker.showDatePicker(context,
                                              // 是否展示顶部操作按钮
                                              showTitleActions: true,
                                              // 最小时间
                                              minTime: DateTime(2018, 3, 5),
                                              // 最大时间
                                              maxTime: DateTime(2099, 6, 7),
                                              // change事件
                                              onChanged: (date) {
                                            print('change $date');
                                          },
                                              // 确定事件
                                              onConfirm: (date) {
                                            print('confirm $date');
                                          },
                                              // 当前时间
                                              currentTime: DateTime.now(),
                                              // 语言
                                              locale: LocaleType.zh);
                                        },
                                        child: Text(
                                          '请选择开始生产时间',
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    Icon(Icons.arrow_right)
                                  ],
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                          // SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(child: Text('结束生产时间:'), flex: 1),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(
                                        onPressed: () {
                                          DatePicker.showDatePicker(context,
                                              // 是否展示顶部操作按钮
                                              showTitleActions: true,
                                              // 最小时间
                                              minTime: DateTime(2018, 3, 5),
                                              // 最大时间
                                              maxTime: DateTime(2099, 6, 7),
                                              // change事件
                                              onChanged: (date) {
                                            print('change $date');
                                          },
                                              // 确定事件
                                              onConfirm: (date) {
                                            print('confirm $date');
                                          },
                                              // 当前时间
                                              currentTime: DateTime.now(),
                                              // 语言
                                              locale: LocaleType.zh);
                                        },
                                        child: Text(
                                          '请选择结束生产时间',
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    Icon(Icons.arrow_right)
                                  ],
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                          SizedBox(height: 20.h),

                          Row(
                            children: [
                              Expanded(child: Text('裁剪数量:'), flex: 1),
                              Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 33.w),
                                        width: 500.w,
                                        height: 80.w,
                                        child: TextField(
                                          maxLines: 1,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '请输入裁剪数量',
                                              hintStyle:
                                                  TextStyle(fontSize: 15)),
                                        ),
                                      ),
                                      Icon(Icons.arrow_right)
                                    ],
                                  ),
                                  flex: 3)
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Row(children: [
                            Text(
                              '铁皮卷号1:',
                              textAlign: TextAlign.left,
                            ),
                          ]),
                          SizedBox(height: 20.h),

                          Row(children: [
                            Expanded(
                                child: Wrap(
                                    spacing: 10, //主轴上子控件的间距
                                    runSpacing: 8, //交叉轴上子控件之间的间距
                                    children: Boxs() //要显示的子控件集合
                                    ),
                                flex: 1)
                          ]),

                          SizedBox(height: 20.h),
                          // SizedBox(height: 20.h),
                          Container(
                              width: 900.w,
                              height: 90.h,
                              child: new MaterialButton(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.w))),
                                color: Color.fromRGBO(96, 208, 72, 1),
                                textColor: Colors.white,
                                child: new Text(
                                  '立即提交',
                                  style: TextStyle(fontSize: 15),
                                ),
                                onPressed: () {
                                  // ...
                                },
                              )),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ));
  }

  List<Widget> Boxs() => List.generate(this.boxNumber, (index) {
        return Container(
            width: 300.w,
            height: 100.w,
            color: Colors.grey,
            // alignment: Alignment.topLeft,
            child: TextField(
              textAlign: TextAlign.center,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: '请输入卷皮号'),
              onEditingComplete: () {
                setState(() {
                  this.boxNumber++;
                });
              },
            ));
      });
}
