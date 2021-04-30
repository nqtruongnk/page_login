import 'package:flutter/material.dart';
import 'package:login_screen/view/main_login/main_login.dart';
import 'package:login_screen/view/register/register_view.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key key}) : super(key: key);

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Log in',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 135,
            margin: EdgeInsets.all(10),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      child: Image.asset('assets/images/logoLogin.webp'),
                    ),
                    InforUserPass(
                      userNameController: _userNameController,
                      passController: _passController,
                    ),
                    SizedBox(height: 20),
                    Container(
                        child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return MainLogin();
                          }));
                        }
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("DON'T HAVE AN ACCOUNT? "),
                        ),
                        InkWell(
                          onTap: () async {
                            final data = await Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return PageRegister();
                            }));
                            _userNameController.text = data['username'];
                            _passController.text = data['password'];
                          },
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class InforUserPass extends StatefulWidget {
  final TextEditingController userNameController;
  final TextEditingController passController;
  final Function validate;

  InforUserPass(
      {Key key, this.passController, this.userNameController, this.validate})
      : super(key: key);

  @override
  _InforUserPassState createState() => _InforUserPassState();
}

class _InforUserPassState extends State<InforUserPass> {
  bool _isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: widget.userNameController,
            decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: 'Username'),
          ),
          SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: widget.passController,
            obscureText: _isObsecure,
            decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObsecure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObsecure = !_isObsecure;
                    });
                  },
                )),
          ),
        ],
      ),
    );
  }
}
