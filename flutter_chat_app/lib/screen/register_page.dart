
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/repository/user_repository.dart';
import 'package:flutter_chat_app/models/register.dart' as reg;
import 'login_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _namecontroller = TextEditingController();
    TextEditingController _emailcontroller = TextEditingController();
    TextEditingController _passcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.black45,
      ),
      body: Theme(
        data: ThemeData(
          accentColor: Colors.grey[200],
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               const SizedBox(
                  height: 15,
                ),
                 const Text(
                   "Please fill the details to create an account",
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                 ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child:  TextField(
                    controller: _namecontroller,
                    decoration: const InputDecoration(
                        hintText: "Enter your First Name",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: const InputDecoration(
                        hintText: "Enter your email",
                        icon: Icon(Icons.email),
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: _passcontroller,
                    decoration: const InputDecoration(
                        hintText: "Enter your password",
                        icon: Icon(Icons.lock),
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                RaisedButton(
                  onPressed: () async {
                   bool isReg = await UserRepository.instance.register(reg.UserRegister(email: _emailcontroller.text, name: _namecontroller.text, password: _passcontroller.text), context);
                   _emailcontroller.clear();
                    _namecontroller.clear();
                    _passcontroller.clear();
                    if(isReg){
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.blue,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}