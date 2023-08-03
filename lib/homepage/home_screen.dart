import 'package:applogin/resources/media_query.dart';
import 'package:flutter/material.dart';
import '../loginpage/login_screen.dart';
import '../resources/key_store.dart';
import '../resources/shared_pref.dart';
import '../resources/user_model.dart';
import '../signuppage/signup_screen.dart';
import 'home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> userDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    setState(
      () {},
    );
  }

  Future<void> getData() async {
    String data = SharedPref.getString(KeyStore.USERDATA);
    userDataList = userModelFromJson(data);
    setState(() {});
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: ListView.builder(
          itemCount: userDataList.length,
          padding: EdgeInsets.all(MediaQueryUse.height * .01),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return userListTile(
                removeUser: () => setState(() {
                      userDataList.removeAt(index);
                      SharedPref.removeValue(KeyStore.USERDATA);
                      if (userDataList.isEmpty) {
                        SharedPref.setValue(key: 'ISLOGIN', value: false);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      }
                    }),
                title:
                    '${userDataList[index].fname} ${userDataList[index].lname}',
                subTitle: userDataList[index].email,
                id: index + 1);
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()))
              .then((value) => getData()),
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            size: MediaQueryUse.height * .035,
          )),
    );
  }
}
