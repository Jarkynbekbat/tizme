import 'package:flutter/material.dart';
import 'package:new_rasp_app/helpers/screen.dart';
import 'package:new_rasp_app/models/rasp_model.dart';
import 'package:provider/provider.dart';

class NoRasps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String quote = Provider.of<RaspModel>(context).quote;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: Screen.isPortrait(context)
            ? [
                Image.asset('./lib/assets/norasps.png'),
                Text(
                  quote.split('/')[1],
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).textTheme.body1.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                Text(
                  quote.split('/')[0],
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).textTheme.body1.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                )
              ]
            : [
                Text(
                  quote.split('/')[1],
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).textTheme.body1.color,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
                Text(
                  quote.split('/')[0],
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
