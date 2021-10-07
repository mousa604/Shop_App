import 'package:amit_shop/Screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottm_navvigtion_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText=true;
  IconData icon =Icons.visibility_off_sharp;
   bool x=false;


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height*.29,
                width: size.width*.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png')
                  )

                ),
              ),
              SizedBox(height: size.height*.1,),
              Form (
                  key: _formKey,
                  child: Column(
                children: [
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty)
                        {
                          return 'enter your email';
                        }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.email),
                    ),

                  ),
                  SizedBox(height: size.height*.035,),
                  TextFormField(
                    obscureText: obscureText,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'enter your password';
                      }
                      return null;
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          obscureText=!obscureText;
                        });
                      },
                      icon: obscureText?Icon(Icons.remove_red_eye):Icon(Icons.visibility_off_sharp)
                      ),
                    ),

                  ),
                  SizedBox(height: size.height*.055,),
                  InkWell(
                    onTap: () async{
                      setState(() {
                        x=true;
                      });
                      if(_formKey.currentState!.validate()){
                         var result=await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                        if(result.user!=null){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavigtionScreen()));
                        }
                      }
                    },
                    child:Container(
                      alignment: Alignment.center,
                      height: size.height*.05,
                      width: size.height*.32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[600],
                      ),

                      child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 22),),
                    ),
                  ),
                  SizedBox(height: size.height*.02,),
                  TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()) );}, child:Text('Go SignUp'))

                ],
              )),

            ],
          ),
        ),
      ),

    );
  }
}

