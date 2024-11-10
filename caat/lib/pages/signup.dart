import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue chez CAAT",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 10), // Add space below title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Text(
                  "Accédez à votre espace personnel pour gérer vos contrats et demandes facilement",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ),
            ),
            
            Container(
              alignment: AlignmentDirectional.centerStart
              ,child: const Padding(
                padding: EdgeInsets.only(left: 17.0,bottom: 6)  ,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 16, color: Colors.black87 ,fontWeight: FontWeight.bold),
                )
            ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: TextField(
                
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: true,
                autocorrect: true,
                autofocus: true,
                decoration: InputDecoration(
                  
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   borderSide:BorderSide(
                    color: Colors.grey,
                    width: 0.3) 
                    ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: 
                    BorderSide(color: Color.fromARGB(255, 128, 124, 124), width: 0.3),
                    gapPadding: 7.0,
                    
                   
                    
                ),
                
                hintText: 'Entrez votre email',
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,


              ),
              
            ),
            ),
            const SizedBox(height: 20), 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () {
                // Handle sign up action here
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
