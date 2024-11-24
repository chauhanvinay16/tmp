import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tmp/local_auth/auth_home.dart';

class FingerAuth extends StatefulWidget {
  const FingerAuth({super.key});

  @override
  State<FingerAuth> createState() => _FingerAuthState();
}

class _FingerAuthState extends State<FingerAuth> {
  final LocalAuthentication auth = LocalAuthentication();

  checkAuth()async{
    bool isAvailbale;
    isAvailbale=await auth.canCheckBiometrics;
    print(isAvailbale);

    if(isAvailbale){
      bool result=await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: AuthenticationOptions(
            sensitiveTransaction: EditableText.debugDeterministicCursor
          )
      );
      if(result){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AuthHome(),));
      }else{
        print('Permition denided');
      }
    }else{
      print('NO Biometric Detected...');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finger Auth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fingerprint_outlined,size: 50,),

            SizedBox(height: 30,),

            ElevatedButton(onPressed: () {
                checkAuth();
            }, child: Text('Auth'))
          ],
        ),
      ),
    );
  }
}
