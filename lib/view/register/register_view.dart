import 'dart:ui';

import 'package:flutter/material.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({Key key}) : super(key: key);

  @override
  _PageRegisterState createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _configPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regiter'),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: () => Navigator.pop(
        //       context, {'username': 'aaaaa', 'password': '22222'}),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditText(
                    txtController: _userNameController,
                    name: 'Username',
                    icon: Icon(Icons.account_box_rounded),
                    hntText: 'Username',
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  EditText(
                    txtController: _passController,
                    name: 'Password',
                    icon: Icon(Icons.lock_open),
                    hntText: 'Password',
                    subIcon: true,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  EditText(
                    txtController: _configPassController,
                    name: 'Confirm Password',
                    icon: Icon(Icons.lock_outline),
                    hntText: 'Confirm password',
                    subIcon: true,
                    validate: (value) {
                      if (value != _passController.text) {
                        return 'confim is not password';
                      }
                      return null;
                    },
                  ),
                  Center(
                      child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Text(
                            'REGISTER NOW',
                          ),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              Navigator.pop(context, {
                                'username': _userNameController.text,
                                'password': _passController.text
                              });
                            }
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditText extends StatefulWidget {
  final String name;
  final String hntText;
  final bool subIcon;
  final Icon icon;
  final Function validate;
  final TextEditingController txtController;
  EditText(
      {Key key,
      this.name,
      this.hntText,
      this.subIcon,
      this.icon,
      this.txtController,
      this.validate})
      : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  bool _isObs = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              )),
          SizedBox(
            height: 5,
          ),
          Container(
              child: TextFormField(
                  validator: widget.validate,
                  controller: widget.txtController,
                  obscureText: widget.subIcon == null
                      ? false
                      : _isObs
                          ? true
                          : false,
                  //controller: widget.username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: widget.hntText,
                    prefixIcon: widget.icon,
                    suffixIcon: widget.subIcon != null
                        ? IconButton(
                            icon: Icon(_isObs
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObs = !_isObs;
                              });
                            })
                        : null,
                  ))),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
