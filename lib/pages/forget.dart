import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class forget extends StatefulWidget {
  forget({Key key}) : super(key: key);

  @override
  _forgetState createState() => _forgetState();
}

class _forgetState extends State<forget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //修改颜色
          ),
          title: new Text('忘记密码', style: TextStyle(color: Colors.black)),
          shadowColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light, //设置为白色字体
        ),
        body: Container(
            height: ScreenUtil().screenHeight,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150.h),
                Container(
                  width: 900.w,
                  height: 100.h,
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  child: TextField(
                    style: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        color: Colors.black),
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: '请输入手机号',
                      border: InputBorder.none,
                      prefixIcon: Container(
                        alignment: Alignment.center,
                        height: 100.h,
                        width: 20.w,
                        child: Text('+86'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Container(
                  width: 900.w,
                  height: 100.h,
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Container(
                          color: Colors.grey,
                          alignment: Alignment.center,
                          height: 100.h,
                          width: 300.w,
                          child: Text('获取验证码'),
                        )),
                  ),
                ),
                SizedBox(
                  height: 150.h,
                ),
                Container(
                    width: 900.w,
                    height: 110.h,
                    child: new MaterialButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.w))),
                      color: Color.fromRGBO(96, 208, 72, 1),
                      textColor: Colors.white,
                      child: new Text(
                        '立即修改',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        // ...
                      },
                    ))
              ],
            )));
  }
}
