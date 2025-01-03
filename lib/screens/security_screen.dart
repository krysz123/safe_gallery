import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  late final LocalAuthentication auth;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.topRight,
          child: Text(
            'safe gallery',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _authenticate,
              child: Image.asset(
                'assets/images/fingerprint.png',
                width: 130,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'zczytaj linie\n papilarne aby\n przejsc do ukrytej\n galerii',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Zeskanuj odcisk palca lub podaj swój PIN',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Wymagana autoryzacja',
            biometricHint: 'Udowodnij że to ty',
          )
        ],
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );

      if (authenticated) {
        Navigator.pushReplacementNamed(context, '/authenticated');
      }
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) {
      return;
    }
    // we can call setState here
  }
}
