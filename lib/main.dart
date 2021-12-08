import 'package:flutter/material.dart';
import 'package:movieappcs202/views/register.dart';
import 'package:http/http.dart' as http;
import 'sql/sqlservice.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
      // This widget is the root of your application.
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter login UI',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Login'),
        );
      }
    }

    class MyHomePage extends StatefulWidget {
      MyHomePage({Key key, this.title}) : super(key: key);
      // This widget is the home page of your application. It is stateful, meaning
      // that it has a State object (defined below) that contains fields that affect
      // how it looks.
      // This class is the configuration for the state. It holds the values (in this
      // case the title) provided by the parent (in this case the App widget) and
      // used by the build method of the State. Fields in a Widget subclass are
      // always marked "final".
      final String title;
      @override
      _MyHomePageState createState() => _MyHomePageState();
    }

 class _MyHomePageState extends State<MyHomePage> {
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
      
      final _useremail = TextEditingController();
      final _password = TextEditingController();
      final formKey = GlobalKey<FormState>();

      _loginuser ()  {
          SQLService.loginuser(_useremail.text, _password.text).then((result) {});
          

      } 
      @override
      Widget build(BuildContext context) {

        final emailField = TextFormField(
          obscureText: false,
          style: style,
          controller: _useremail,
          validator: (String value){
              if(value.isEmpty)
              {
                  return "Please input email";
              }
          },
          

          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "User Email",
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );

       

        final passwordField = TextFormField(
          obscureText: true,
          style: style,
          controller: _password,
         
           validator: (String value){
              if(value.isEmpty)
              {
                  return "Please input password";
              }
          },
         
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              labelText: "User Password",
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                                    ),    
        );


        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          //color: Color(0xff01A0C7),
          color: Colors.black,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            
            onPressed: () {
              if(formKey.currentState.validate()) {
                _loginuser();
              }

            },

            child: Text("Login",
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
          
          body: Form(
            key: formKey,
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
                      height: 300.0,
                      child: Image.asset(
                        "images/cinema.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(
                      height: 10.0),
                    emailField,
                    SizedBox(height: 15.0),
                    passwordField,
                    SizedBox(
                      height: 25.0,
                    ),

                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),

                      FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password', style: TextStyle(fontSize: 17)),
                ),


                 Container(
                  child: Row(
                    children: <Widget>[
                      Text('Does not have account?'),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => signUpPage()
                                  ),
                                );
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                )
                
                )
                  
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

