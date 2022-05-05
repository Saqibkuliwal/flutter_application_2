import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/background.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/signup.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // List images = [
  //   'img/1.png.png',
  //   'img/2,png.png',
  // ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController phonecontroller = new TextEditingController();
    TextEditingController passwordcontroller = new TextEditingController();
    
    return Stack(
      children: [
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('WORKSHOP'),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
       body:
      // PageView.builder(
        
      //     scrollDirection: Axis.vertical,
      //     // itemCount: images.length,
      //     itemBuilder: (_, index) {
      //        return 
       Form(
            // Container(
            //   width: double.maxFinite,
            //   height: double.maxFinite,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         // image: AssetImage('img/'+images[index])
              //         image: AssetImage('img/t.png'),
              //         fit: BoxFit.fill,
              //         colorFilter: ColorFilter.mode(
              //             Colors.black.withOpacity(0.3), BlendMode.dstATop))),
              key: _formKey,
              child: Column(
                
                children: <Widget>[
                  
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(10, 70, 10, 25),
                    child: Text(
                      'SIGN IN ',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                   child : Container(
                    padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    child: TextFormField(
                      controller: phonecontroller,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Phone Number'),
                          keyboardType: TextInputType.phone,
                          validator: 
                         // 
                         
                          (value){
                            //  validateMobile(value);
                            if( value == null || value.isEmpty)
                           {return'please enter number';} 
                           return null;
                          },
                    ),
                  ),
                  ),
                  
                  Padding(padding: EdgeInsets.all(10),
                  child :Container(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                     decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                     
                        child: TextFormField(
                      obscureText: true,
                      controller: passwordcontroller,
                      decoration: const InputDecoration(
                        
                        labelText: 'Password',
                        border: InputBorder.none,
                      ),
                      validator: (value){
                            if( value == null || value.isEmpty)
                           {return('please enter correct password');} 
                           return null;
                          },
                    ),
                      
                  ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home())
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Succeed")));
                        print(phonecontroller.text);
                        print(passwordcontroller.text);
                      }},
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(40, 13, 40, 0),
                    child: Text(
                      'Not Registered?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    //padding: const EdgeInsets.all(1),
                    child: TextButton(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 24,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        }),
                  ),
                ],
              ),
            ),)
      ],
    );
          
    
  }
}

// String  validateMobile(String value) {
//     if (value.length != 11)
//       return 'Mobile Number must be of 11 digit';
//     else
//       return null;
//   }  
