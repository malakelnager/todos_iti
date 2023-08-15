import 'package:flutter/material.dart';
import 'package:todos_iti/screens/Second_Screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final formKey= GlobalKey<FormState>();
TextEditingController emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    width: 140,
                    height: 140,
                    child: Image(image: AssetImage('assets/images/img.png'),),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: ' Email Address ',
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    validator: (value){
                      if(value!.isEmpty )
                      {
                        return "enter valid email";
                      }
                    },

                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',

                    ),
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    validator: (value){
                      if(value == null || value.length<5){
                        return "enter valid password";
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () async {
                        if(formKey.currentState!.validate()){


                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondScreen(),),);
                        }

                      },

                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forget password? ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(onPressed: (){}, child: const Text('Register Now'),),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}