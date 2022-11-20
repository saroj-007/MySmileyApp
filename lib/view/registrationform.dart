import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smileapp/view/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  void createAccount() {
    String userName = userNameController.text.trim();
    String address = addressController.text.trim();
    String mobile = mobileController.text.trim();
    String email = emailController.text.trim();
    String password = passController.text.trim();
    String cpass = confirmPassController.text.trim();

    if (password != cpass){
      print("Password didnot match");
    }
    else{
      // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: email, 
      //   password: password);
      //   print("User Created");

      Map<String, dynamic> newUserData = {
        "Name" : userName,
        "Address" : address,
        "Mobile" : mobile,
        "Email" : email,
        "Password" : password
      };

      //FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
     FirebaseFirestore.instance.collection("users").add(newUserData);
      print("User Created");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const login()))
        ),
        centerTitle: true,
        title: const Text("Registration Form"),
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
      
                // Username 
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    hintText: "Enter User name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide()
                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Required this field";
                    }
                    return null;
                  },
                  
                ),
      
                const SizedBox(height: 15.0,),
      
                // Address 
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "Enter Your Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide()
                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Required this field";
                    }
                    return null;
                  },
                  
                ),

                const SizedBox(height: 15.0,),
      
                // Mobile Number
                TextFormField(
                  controller: mobileController,
                  decoration: InputDecoration(
                    hintText: "Enter Mobile Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide()
                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Required this field";
                    }
                    return null;
                  },
                  
                ),
      
                const SizedBox(height: 15.0,),
      
                // Email
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide()
                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Required this field";
                    }
                    return null;
                  },
                  
                ),
      
                const SizedBox(height: 15.0,),

                // Password Form 
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide()
                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Required this field";
                    }
                    return null;
                  },
                  
                ),
      
                const SizedBox(height: 15.0,),

                // Confirm Password
                TextFormField(
                  controller: confirmPassController,
                  decoration: InputDecoration(
                    hintText: "Enter Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide()
                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Required this field";
                    }
                    return null;
                  },
                  
                ),
      
                const SizedBox(height: 15.0,),
                

                // Elevated Button
                SizedBox(
                height: 60,
                  width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
             
            ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()){}
                      createAccount();
                    }, 
                    child: const Text('Register', 
                    style: TextStyle(
                      fontSize: 23, 
                      fontWeight: FontWeight.bold
                      ),
                      ), 
                    ),
                )
      
                
              ],
            )
            ),
        ),
      ),
    );
  }
}