import 'package:flutter/material.dart';

import '../../../helpers/screen.dart';

class NoRasps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // String quote = Provider.of<RaspModel>(context).quote;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: Screen.isPortrait(context)
            ? [
                Image.asset('./lib/assets/norasps.png'),
                Text(
                  'quote.split()[1]',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).textTheme.body1.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                Text(
                  'quote.split()[0]',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).textTheme.body1.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                )
              ]
            : [
                Text(
                  'quote.split()[1]',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).textTheme.body1.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                Text(
                  'quote.split()[0]',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).textTheme.body1.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                )
              ],
      ),
    );
  }
}
