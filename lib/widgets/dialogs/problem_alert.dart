import 'package:flireator/models/problems/problem.dart';
import 'package:flutter/material.dart';

class ProblemAlert extends StatelessWidget {
  final Problem problem;

  ProblemAlert({required this.problem});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('Dammit!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Looks like there was A problem.'),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (problem.info != null)
                  for (final key in problem.info!.keys)
                    Text('$key: ${problem.info![key]}')
              ],
            ),
            Text('error: ${problem.errorString}'),
            SizedBox(height: 20),
            Text(problem.traceString ?? '-'),
            // RichText(
            //   text: TextSpan(
            //     text: problem.traceString,
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
            //   ),
            // )
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop<Problem>(problem);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
