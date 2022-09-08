import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metabox/models/user_model.dart';
import 'package:metabox/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import '../widgets/progress_dialog.dart';

class AuthHelper {
  static login(
    String email,
    String password,
    context,
  ) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => ProgressDialog(
              status: 'Logging you in... ',
            ));
    try {
      final user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
              .catchError((ex) {
        Navigator.canPop(context) == true ? Navigator.pop(context) : null;
        FirebaseAuthException thisex = ex;
        //    AlertHelper.showSnackbar(thisex.message!, _scaffoldKey);
      }))
          .user;

      if (user != null) {
        //   UserModel userData = await UserData.getUserData(user.uid);
        Navigator.canPop(context) == true ? Navigator.pop(context) : null;
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users/${user.uid}');

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        // await sharedPreferences.setString('userId', user.uid);
        // await sharedPreferences.setString('name', userData.name);
        // await sharedPreferences.setString('email', userData.email);
        // await sharedPreferences.setInt('phoneNo', userData.phoneNo);

        SharedPreferences sharedPref = await SharedPreferences.getInstance();

        // Provider.of<AppData>(context, listen: false).setPreferences(sharedPref);

        userRef.once().then((DatabaseEvent event) => {
              if (event.snapshot.value != null)
                {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false)
                }
              else
                {
                  // AlertHelper.showSnackbar(
                  //    'snapshot value is null', _scaffoldKey)
                }
            });
        // DatabaseReference userRef =
        //     FirebaseDatabase.instance.reference().child('users/${user.uid}');

      }
      //  AlertHelper.showSnackbar('${user!.email} signed in', _scaffoldKey);
    } catch (e) {
      //   AlertHelper.showSnackbar(e.toString(), _scaffoldKey);
      print(e.toString());
    }
  }

  static registerUser(
    String? email,
    String? password,
    context,
    String? name,
    int? phoneNo,
  ) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => ProgressDialog(
              status: 'Registering you... ',
            ));
    final User? user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
            .catchError((ex) {
      Navigator.canPop(context) == true ? Navigator.pop(context) : null;
      PlatformException thisex = ex;
      print(thisex.message!);
      //  AlertHelper.showSnackbar(thisex.message!, _scaffoldKey);
    }))
        .user;
    if (user != null) {
      DatabaseReference newUserRef =
          FirebaseDatabase.instance.ref().child('users/${user.uid}');
      UserModel userModel = UserModel(
          name: name!, userId: user.uid, phoneNo: phoneNo!, email: email);

      newUserRef.set(userModel.toMap());

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);

      Navigator.canPop(context) == true ? Navigator.pop(context) : null;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("uid", user.uid);
    }

    print(user);
  }

  static Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .whenComplete(() {
      // AlertHelper.showToast(
      //     'A password reset email has been sent to your registered email id');
      signOut();
    });
  }

  static Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await FirebaseAuth.instance.signOut().whenComplete(() async {
      await prefs.clear();
    });
  }

  static walletConn() async {
    // Create a connector
    final connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'Metabox',
        description: 'WalletConnect Developer App',
        url: 'https://walletconnect.org',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );
    connector.on('connect', (session) => print(session));
    connector.on('session_update', (payload) => print(payload));
    connector.on('disconnect', (session) => print(session));

// Create a new session
    if (!connector.connected) {
      final session = await connector.createSession(
        chainId: 4160,
        onDisplayUri: (uri) async {
          print(await launchUrlString(uri));
        },
      );
    }
  }
}
