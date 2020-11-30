import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './forget.dart';
import './tailoring.dart';
import './authority.dart';

class MyhomePage extends StatefulWidget {
  int type;
  MyhomePage({Key key}) : super(key: key);
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  bool passwordVisible;
  String userName;
  @override
  void initState() {
    passwordVisible = true;
    //设置初始状态
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: new Text(''),
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
            // SizedBox(height: 200.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.w),
              child: Container(
                width: 200.w,
                height: 200.w,
                color: Colors.black12,
                child: Image.network(
                    'https://tfs.alipayobjects.com/images/partner/TB1LX8pXlaEMeJjme5tXXcEKFXa'),
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              '福建佰利源生产管理系统',
              style: TextStyle(
                  color: Color.fromRGBO(96, 208, 72, 1), fontSize: 20),
            ),
            SizedBox(height: 80.h),
            Container(
              width: 900.w,
              height: 100.h,
              color: Color.fromRGBO(0, 0, 0, 0.05),
              child: TextField(
                onChanged: (value) {
                  print(value);
                  setState(() {
                    this.userName = value;
                  });
                },
                style: TextStyle(
                    textBaseline: TextBaseline.alphabetic, color: Colors.black),
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: '输入用户名',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(height: 60.h),
            Container(
                width: 900.w,
                height: 100.h,
                color: Color.fromRGBO(0, 0, 0, 0.05),
                child: TextField(
                  obscureText: passwordVisible,
                  style: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      color: Colors.black),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: '输入密码',
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        //更新状态控制密码显示或隐藏
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                  ),
                )),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => forget(),
                  ),
                );
              },
              child: Container(
                width: 900.w,
                child: Text(
                  '忘记密码?',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 900.w,
              child: Text(
                'Tips:用户名1进入操作裁剪，用户名2进入裁剪班组',
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 60.h),
            Container(
                width: 900.w,
                height: 120.h,
                child: new MaterialButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20.w))),
                  color: Color.fromRGBO(96, 208, 72, 1),
                  textColor: Colors.white,
                  child: new Text(
                    '立即登陆',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    // ...
                    if (this.userName == '1') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => tailoring(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => authority(),
                        ),
                      );
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
