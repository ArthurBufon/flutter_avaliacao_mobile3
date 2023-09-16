import 'package:flutter/material.dart';
import 'package:flutter_avaliacao_mobile3/view/alunos_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color myWhiteColor = const Color.fromARGB(255, 212, 213, 214);
  Color myDarkColor = const Color.fromARGB(255, 75, 65, 79);

  // usernameController
  final usernameController = TextEditingController();

  // passwordController
  final passwordController = TextEditingController();

  //Password
  bool _showPassword = true;

  // FormKey.
  final _formKey = GlobalKey<FormState>();

  void doLogin() {}

  @override
  Widget build(BuildContext context) {
    // PrimaryColor.
    Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width * 0.3,),
                //widget logotipo
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Image.asset('assets/images/student.png'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //widget input entrada de email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: usernameController,
                    //keyboardAppearance: Brightness.dark,
                    maxLength: 30,
                    //maxLines: 1,
                    cursorColor: myDarkColor,
                    style: TextStyle(color: myDarkColor),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      counterStyle: TextStyle(color: myWhiteColor),
                      contentPadding: const EdgeInsets.only(left: 17),
                      //se o input é só underline ou tem um container
                      filled: true,
                      fillColor: myWhiteColor,
                      hintText: 'Informe seu usuário',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(37),
                        borderSide: const BorderSide(
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(color: myDarkColor),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite o nome de usuário!';
                      }
                      return null;
                    },
                  ),
                ),
          
                const SizedBox(height: 10),
          
                //widget input entrada de senha
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardAppearance: Brightness.dark,
                    maxLength: 40,
                    maxLines: 1,
                    cursorColor: myDarkColor,
                    style: TextStyle(color: myDarkColor),
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      counterStyle: TextStyle(color: myWhiteColor),
                      contentPadding: const EdgeInsets.only(left: 17),
                      filled: true,
                      fillColor: myWhiteColor,
                      hintText: 'Informe a senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(37),
                        borderSide: const BorderSide(
                          style: BorderStyle.none,
                        ),
                      ),
                      hintStyle: TextStyle(color: myDarkColor),
          
                      ////////////////////
                      /////// icone do olho deixar pro final
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          child: IconButton(
                            onPressed: null,
                            icon: _showPassword == false
                                ? Icon(
                                    Icons.visibility,
                                    color: myWhiteColor,
                                    size: 18,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: myWhiteColor,
                                    size: 18,
                                  ),
                          ),
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      ///////icone do olho//////////////
                      //////////////////////////////////////
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Digite uma senha!';
                      }
                      return null;
                    },
                  ),
                ),
                //widget text simples com a frase e fará um link
                Text(
                  'Esqueci minha senha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //widget botão de entrar login
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AlunosPage()),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
