import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:learningdart/login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final PageController _pageController = PageController();
  final _emailTextController = TextEditingController();
  bool isActive = false;
  @override
  void initState() {
    super.initState();

    _emailTextController.addListener(() {
      setState(() {
        isActive = _emailTextController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Text(
                    'What\'s your email?',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'To receive a verification code you need to enter your email address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text('Email Address'),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(12),
                    child: TextField(
                      controller: _emailTextController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: isActive
                        ? () {
                            if (_pageController.hasClients) {
                              _pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          }
                        : null,
                    child: Text('Get Code'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text('Verification Code'),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(12),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Full name'),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(12),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                  SizedBox(height: 20),
                  Text('Nationality'),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(12),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                  ElevatedButton(
                    onPressed: () {
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),

          //last pagge
          Container(
            color: Colors.blue[200],
            child: Center(
              child: Column(
                children: [

                  Text('You have successfully registered, Please proceed to Login'),
                  ElevatedButton(
                    onPressed: () {
                      if (_pageController.hasClients) {
                        // _pageController.animateToPage(
                        //   0,
                        //   duration: const Duration(milliseconds: 400),
                        //   curve: Curves.easeInOut,
                        // );
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      }
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
