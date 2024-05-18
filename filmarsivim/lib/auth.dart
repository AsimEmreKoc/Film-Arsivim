import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:filmarsivim/AnaSayfas.dart';
import 'package:filmarsivim/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class AnaEkran extends StatelessWidget {
  const AnaEkran({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return EmailDogrulama();
            } else {
              return AuthPage();
            }
          },
        ),
      );
}

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(
          onClickedSignUp: toggle,
        )
      : SignUpPage(onClickedSignIn: toggle);

  void toggle() => setState(
        () => isLogin = !isLogin,
      );
}

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
            ),
            Image.asset('assets/images/logo.png'),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email',labelStyle:TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Şifre',labelStyle:TextStyle(color: Colors.white)),
              obscureText: true,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(
                Icons.lock_open,
                size: 32,
              ),
              label: Text(
                'Giriş Yap',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: GirisYap,
            ),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
              child: Text(
                'Şifremi unuttum',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 39, 222, 228),
                    fontSize: 20),
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SifremiUnuttum())),
            ),
            SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  text: 'Hesabın yok mu? ', 
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: 'Kayıt Ol!',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 39, 222, 228)))
                  ]),
            )
          ],
        ),
      );
  Future GirisYap() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar('Geçersiz email girdiniz!');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

class SignUpPage extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const SignUpPage({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
              ),
              Image.asset('assets/images/logo.png'),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: nameController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'İsim',labelStyle:TextStyle(color: Colors.white)),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: lastNameController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Soy İsim',labelStyle:TextStyle(color: Colors.white)),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email',labelStyle:TextStyle(color: Colors.white)),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.white),
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Geçerli bir email giriniz'
                        : null,
              ),
              SizedBox(
                height: 4,
              ),
              TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Şifre',labelStyle:TextStyle(color: Colors.white)),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.white),
                validator: (value) => value != null && value.length < 6
                    ? 'en az 6 karakter giriniz!'
                    : null,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(
                  Icons.lock_open,
                  size: 32,
                ),
                label: Text(
                  'Kayıt Ol',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: KayitOl,
              ),
              SizedBox(
                height: 24,
              ),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    text: 'Zaten Hesabın var mı? ',
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignIn,
                          text: 'Giriş Yap',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color.fromARGB(255, 39, 222, 228)))
                    ]),
              )
            ],
          ),
        ),
      );

  FirebaseAuth auth = FirebaseAuth.instance;

  Future KayitOl() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar('Bu email zaten mevcut!');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    FirebaseFirestore.instance
        .collection('Kullanıcılar')
        .doc(auth.currentUser?.uid)
        .set({
      'KullanıcıID': auth.currentUser?.uid,
      'Ad': nameController.text,
      'Soyad': lastNameController.text,
      'Doğrulama' : 'Hayır'
    });
  }
}

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class SifremiUnuttum extends StatefulWidget {
  @override
  State<SifremiUnuttum> createState() => _SifremiUnuttumState();
}

class _SifremiUnuttumState extends State<SifremiUnuttum> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          title: Text('Şifreyi Yenile'),
          titleTextStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: 24),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Şifresini yenilemek istediğiniz emaili giriniz',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24,color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(labelText: 'Email',labelStyle: TextStyle(color: Colors.white)),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white),
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'geçerli bir email giriniz'
                          : null,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                  icon: Icon(Icons.email_outlined),
                  label: Text(
                    'Şifreyi yenile',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: resetPassword,
                )
              ],
            ),
          ),
        ),
      );

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Utils.showSnackBar('Resetleme linki emaile gönderildi');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar('İşlem Gerçekleşemedi');
      Navigator.of(context).pop();
    }
  }
}

class EmailDogrulama extends StatefulWidget {
  const EmailDogrulama({Key? key}) : super(key: key);
  @override
  State<EmailDogrulama> createState() => _EmailDogrulamaState();
}

class _EmailDogrulamaState extends State<EmailDogrulama> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    });

    if (isEmailVerified) timer?.cancel();
    if (isEmailVerified) FirebaseFirestore.instance
        .collection('Kullanıcılar')
        .doc(auth.currentUser?.uid)
        .update({
      'Doğrulama' : 'Evet'
    });
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      Utils.showSnackBar(e.toString());
    }
  }

  Widget build(BuildContext context) => isEmailVerified
      ? AnaSayfa()
      : Scaffold(
          appBar: AppBar(title: Text('Emaili doğrula')),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mail gönderildi',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon: Icon(
                    Icons.email,
                    size: 32,
                  ),
                  label: Text(
                    'Tekrar gönder',
                    style: TextStyle(fontSize: 24,color: Color.fromARGB(255, 39, 222, 228)),
                  ),
                  onPressed: canResendEmail ? sendVerificationEmail : null,
                ),
                SizedBox(
                  height: 8,
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  child: Text(
                    'iptal',
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                )
              ],
            ),
          ),
        );
}
