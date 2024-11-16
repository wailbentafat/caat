import 'package:caat/controllers/auth/signup.dart';
import 'package:flutter/material.dart';
import '../widget/input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.0), // Added more padding for a balanced design
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Créer un nouveau compte",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 27, 89, 197),
                    fontWeight: FontWeight.w800,
                    wordSpacing: 0.3,
                  ),
                ),
              ),
              SizedBox(height: 30),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final FormController formController = FormController();
  bool isloading = false;
  Map<String, String>? userinfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLabelAndInputField(
            "Prénom", formController.Prenom, TextInputType.name),
        const SizedBox(height: 20),
        _buildLabelAndInputField("Nom", formController.nom, TextInputType.name),
        const SizedBox(height: 20),
        _buildLabelAndInputField(
            "Numéro téléphone", formController.Num, TextInputType.number),
        const SizedBox(height: 20),
        _buildLabelAndInputField("Numéro carte d'identité", formController.NUMI,
            TextInputType.number),
        const SizedBox(height: 20),
        _buildLabelAndInputField(
            "Email", formController.Email, TextInputType.emailAddress),
        const SizedBox(height: 20),
        _buildLabelAndInputField("Mot de passe", formController.Password,
            TextInputType.visiblePassword),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: isloading ? null : _handleSignUp,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
            backgroundColor: const Color.fromARGB(255, 27, 89, 197),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: isloading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text("Sign Up",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildLabelAndInputField(String label,
      TextEditingController controller, TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Input field
        CustomInputField(
          controller: controller,
          hint: label,
          keyboardType: keyboardType,
        ),
      ],
    );
  }

  void _handleSignUp() async {
    setState(() {
      isloading = true;
    });

    try {
      await Future.delayed(Duration(seconds: 3));
      userinfo = await formController.Usersign(
        Prenom: formController.Prenom.text,
        nom: formController.nom.text,
        Num: formController.Num.text,
        NUMI: formController.NUMI.text,
        Email: formController.Email.text,
        Password: formController.Password.text,
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Sign up successful!')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }
}
