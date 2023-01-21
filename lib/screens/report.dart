import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/database.dart';

class ReportIssue extends StatelessWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    final emailController = TextEditingController();
    final issueController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                    'If you have any issue or problem \nplease tell us...!',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                   padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 100,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: issueController,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Description/Complaint',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        Map.identity();
                        //String id = '1';
                        var email = emailController.text;
                        var issue = issueController.text;
                        await dbclass.complain(email, issue);
                        
                      },
                      child: const Text('Submit')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
