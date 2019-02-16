import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage>{
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int checkid = 0;
    int checkpassword = 0;
    int checkconfirm = 0;
    String checking = '';
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTER"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "User id",
                hintText: "User id",
                icon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => print(value),
              validator: (value){
                if(value.isEmpty){
                  checkid = 1;
                  return "";
                }else if(value == 'admin'){
                  checkid = 2;
                  return "";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Password",
                icon: Icon(Icons.lock,)
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value){
                if(value.isEmpty){
                  checkpassword = 1;
                  return "";
                }else if(value == 'admin'){
                  checkpassword = 2;
                  checking = value;
                  return "";
                }else{
                  checking = value;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Confirm Password",
                icon: Icon(Icons.lock,)
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value){
                if(value.isEmpty){
                  checkconfirm = 1;
                  return "";
                }else if(checking == ''){
                  checkconfirm = 1;
                  return "";
                }else if(value != checking){
                  checkconfirm = 3;
                  return "";
                }else if(value == 'admin'){
                  checkconfirm = 2;
                  return "";
                }
              },
            ),
            Builder(builder: (context) => RaisedButton(
              child: Text('Continue'),
              onPressed: () {
                if(_formkey.currentState.validate()){
                  checkid = 0;
                  checkpassword = 0;
                  checkconfirm = 0;
                  checking = '';
                  Navigator.pushNamed(context, "/");
                }else if(checkconfirm == 3){
                  Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Password และ Confirm Password ไม่ตรงกัน'),
                  duration: Duration(seconds: 3),));
                }else if(checkid == 1 || checkpassword == 1 || checkconfirm == 1){
                  Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('กรุณาระบุข้อมูลให้ครบถ้วน'),
                  duration: Duration(seconds: 3),));
                }else if(checkid == 2){
                  Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('user นี้มีอยู่ในระบบแล้ว'),
                  duration: Duration(seconds: 3),));
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}