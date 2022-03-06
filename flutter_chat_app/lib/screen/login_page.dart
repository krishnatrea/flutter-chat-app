import 'package:flutter/material.dart';
import 'package:flutter_chat_app/repository/user_repository.dart';
import 'package:flutter_chat_app/screen/chats_page.dart';
import 'package:flutter_chat_app/screen/register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 2,
        backgroundColor: Colors.black54,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blueGrey,
              Colors.blueAccent,
              Colors.blue,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Welcome! Kindly fill all your details",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: _usernamecontroller,
                        decoration: InputDecoration(
                            hintText: "Enter your username",
                            icon: Icon(Icons.person),
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                        controller: _passwordcontroller,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            icon: const Icon(Icons.lock_rounded),
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            border: InputBorder.none),
                        obscureText: false ,
                      ),
                    ),
                    ElevatedButton(onPressed: () async{
                      bool islogin = await UserRepository.instance.login(
                          _usernamecontroller.text, _passwordcontroller.text, context);
                          if(islogin){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatsPage()));
                          }
                          _usernamecontroller.clear();
                          _passwordcontroller.clear();
                    }, child: Text("Login"),),

                    ElevatedButton(onPressed: () async{
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                    }, child: const Text("Register"),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
