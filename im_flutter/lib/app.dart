import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import 'chat/message_page.dart';
import 'contacts/contacts.dart';
import 'personal/personal.dart';
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //当前选中页面索引
  var _currentIndex = 0;

  // //聊天页面
  MessagePage message;

  //
  // //好友页面
  Contacts contacts;
  //
  // //我的页面
  Personal me;
  //
  // //根据当前索引返回不同的页面
  currentPage() {
    switch (_currentIndex) {
      case 0: //第一页
        if (message == null) {
          message = MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = Contacts();
        }
        return contacts;
      case 2:
        if (me == null) {
          me = Personal();
        }
        return me;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              //跳转至搜索页面
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(//点击搜索按钮跳到搜索页
              //搜索图标
              Icons.search,
            ),
          ),
          // Padding(
          //   //左右内边距
          //   padding: const EdgeInsets.only(left: 30.0, right: 20.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       //弹出菜单
          //       showMenu(
          //         context: context,
          //         //定位在界面的右上角
          //         position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
          //         //展示所有菜单项
          //         items: <PopupMenuEntry>[
          //           _popupMenuItem('发起会话',
          //               imagePath: 'images/icon_menu_group.png'),
          //           _popupMenuItem('添加好友',
          //               imagePath: 'images/icon_menu_addfriend.png'),
          //           _popupMenuItem('联系客服', icon: Icons.person),
          //         ],
          //       );
          //     },
          //     //菜单按钮
          //     child: Icon(Icons.add),
          //   ),
          // ),
        ],
      ),









      bottomNavigationBar: BottomNavigationBar(
        //通过fixedColor设置选中item 的颜色
        type: BottomNavigationBarType.fixed,
        //当前页面索引
        currentIndex: _currentIndex,
        //按下后设置当前页面索引
        onTap: ((index) {
          setState(() {
            _currentIndex = index;
          });
        }),
        //底部导航按钮项
        items: [
          //导航按钮项传入文本及图标
          BottomNavigationBarItem(
              title: Text(
                '聊天',
                style: TextStyle(
                    color: _currentIndex == 0
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              //判断当前索引作图片切换显示
              icon: _currentIndex == 0
                  ? Image.asset(
                      'images/message_pressed.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/message_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          BottomNavigationBarItem(
              title: Text(
                '好友',
                style: TextStyle(
                    color: _currentIndex == 1
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 1
                  ? Image.asset(
                      'images/contact_list_pressed.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/contact_list_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
          BottomNavigationBarItem(
              title: Text(
                '我的',
                style: TextStyle(
                    color: _currentIndex == 2
                        ? Color(0xFF46c01b)
                        : Color(0xff999999)),
              ),
              icon: _currentIndex == 2
                  ? Image.asset(
                      'images/profile_pressed.png',
                      width: 32.0,
                      height: 28.0,
                    )
                  : Image.asset(
                      'images/profile_normal.png',
                      width: 32.0,
                      height: 28.0,
                    )),
        ],
      ),
      body: currentPage(),//数据
    );
  }
}
