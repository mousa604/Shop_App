import 'package:amit_shop/cubit/cubit.dart';
import 'package:amit_shop/cubit/stats.dart';
import 'package:amit_shop/shard/shard_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var emailController =TextEditingController();
  var passwordController =TextEditingController();
  var nameController =TextEditingController();



  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,AppStats>(
        listener: (context,stats){},
        builder: (context,stats){
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
                    SizedBox(height: size.height*.00,),
                    Form (
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'enter your name';
                                }
                                return null;
                              },
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                prefixIcon: Icon(Icons.person),
                              ),

                            ),
                            SizedBox(height: size.height*.035,),
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
                              obscureText: AppCubit.get(context).obscureText,
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
                                  AppCubit.get(context).showPassword(obscureText:AppCubit().obscureText );
                                },
                                    icon:AppCubit.get(context).obscureText?Icon(Icons.remove_red_eye):Icon(Icons.visibility_off_sharp)
                                ),
                              ),

                            ),
                            SizedBox(height: size.height*.055,),
                            InkWell(
                              onTap: ()async{
                                AppCubit.get(context).isShowBottomLogin(show : true);
                                try{
                                  if(_formKey.currentState!.validate()) {
                                    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                                    if(result.user!=null){
                                      await FirebaseFirestore.instance.collection('users').doc(result.user!.uid).set({
                                        'email': result.user!.email.toString(),
                                        'name': nameController.text,
                                        'id': result.user!.uid.toString(),
                                      }).then((value) => {
                                      }).catchError((error){

                                        print(error.toString());
                                      });
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginScreen()));
                                    }
                                  }
                                }catch(error){
                                  AppCubit.get(context).isShowBottomLogin(show : false);
                                  alertDialogFunc(context: context,error: error.toString());
                                }
                              },
                              child:AppCubit.get(context).isShowBottom==false? Container(
                                alignment: Alignment.center,
                                height: size.height*.05,
                                width: size.height*.32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.red[600],
                                ),

                                child: Text('SingUp',style: TextStyle(color: Colors.white,fontSize: 22),),
                              ): Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(height: size.height*.02,),
                            Text('Have an account?'),
                            TextButton(onPressed: (){Navigator.pop(context);}, child:Text('Go login'))

                          ],
                        )),

                  ],
                ),
              ),
            ),

          );
        },
      ),
    );
  }
}


