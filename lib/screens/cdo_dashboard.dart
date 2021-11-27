import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rapid_reps/models/cdo_model.dart';
import 'package:rapid_reps/screens/export.dart';
import 'package:rapid_reps/utilities/constants.dart';

class CDODashboard extends StatefulWidget {
  final CDOModel currentUser;

  const CDODashboard({Key? key, required this.currentUser}) : super(key: key);

  @override
  _CDODashboardState createState() => _CDODashboardState();
}

class _CDODashboardState extends State<CDODashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard ${widget.currentUser.userType}'),
        centerTitle: true,
        backgroundColor: kCDOColour,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Hello",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${widget.currentUser.firstName} ${widget.currentUser.lastName}",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                "${widget.currentUser.email}",
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: const Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}