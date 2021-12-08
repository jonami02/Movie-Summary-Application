import 'package:flutter/material.dart';
import 'package:movieappcs202/sql/sqlservice.dart';
import 'package:http/http.dart' as http;




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
      // This widget is the root of your application.
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Register UI',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: signUpPage(title: 'Flutter Register'),
        );
      }
    }

    class signUpPage extends StatefulWidget {
      signUpPage({Key key, this.title}) : super(key: key);
  
      final String title;
      @override
      _signUpPageState createState() => _signUpPageState();
    }

 class _signUpPageState extends State<signUpPage> {
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

      final _useremail = TextEditingController();
      final _username = TextEditingController();
      final _password = TextEditingController();
      final formKey = GlobalKey<FormState>();
      

      _clearValues()
      {
        _useremail.text = "";
        _username.text = "";
        _password.text ="";
      }

      _addnewuser(){
          SQLService.addnewuser(_useremail.text, _username.text, _password.text).then((result){});
          {
            if ('success' == result) {
              print("New Record Added");
              //_showSnackBar(context, "New user Registered");
              //_clearValues();
              
          }};
      }

      @override
      Widget build(BuildContext context) {

        final userField = TextField(
          obscureText: false,
          style: style,
          controller: _username,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Full name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );

        final emailField = TextField(
          obscureText: false,
          style: style,
          controller: _useremail,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );


        final passwordField = TextField(
          obscureText: true,
          style: style,
          controller: _password,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );


        final saveButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {},
            child: Text("Save",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

        return Scaffold(
          appBar: AppBar(
                    backgroundColor: Colors.grey,
                    centerTitle: true,
                    title: Text('Movie App', style: TextStyle(color: Colors.white),
                    ),
          ),

          body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                   SizedBox(
                      height: 10.0),
                      userField,

                    SizedBox(
                      height: 10.0),
                      emailField,

                    SizedBox(height: 15.0),
                    passwordField,
                    SizedBox(
                      height: 25.0,
                    ),

                    saveButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  
                  ],
                 ),
            )
          )   
              ]
            )
          )
        );
      }
    }

