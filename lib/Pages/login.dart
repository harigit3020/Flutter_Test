// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:data_list/Functions.dart/userAlerts.dart';
import 'package:data_list/Navigation/routeNames.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                        hintStyle: Theme.of(context).textTheme.bodyText1!),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: Theme.of(context).textTheme.bodyText1!),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  clear();
                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'CLEAR',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.black),
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {},
                child: Text('Forgot Password?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black)),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black)),
                  TextButton(onPressed: () {}, child: Text('Sign Up'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      printError('Credentials can not be empty.', context);
    } else {
      if (_usernameController.text == _passwordController.text) {
        Navigator.pushNamed(context, home);
      } else {
        printError('Invalid credentials.', context);
      }
    }
  }

  void clear() {
    _usernameController.clear();
    _passwordController.clear();
  }
}
