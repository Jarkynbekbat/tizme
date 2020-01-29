import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/screen.dart';
import '../../models/rasp_item_model.dart';
import 'views/rasp_item_view.dart';
import 'views/titled_bottom_navigation_bar.dart';

class RaspPage extends StatefulWidget {
  @override
  _RaspPageState createState() => _RaspPageState();
}

class _RaspPageState extends State<RaspPage> {
  @override
  Widget build(BuildContext context) {
    final raspItemsModel = Provider.of<RaspItemsModel>(context);
    return Consumer<RaspItemsModel>(builder: (context, counter, _) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Screen.heigth(context) * 0.08),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: AppBar(
              title: Text('Группа'),
              centerTitle: true,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: List.generate(
                raspItemsModel.current.length,
                (int index) =>
                    RaspItemView(raspItem: raspItemsModel.current[index])),
          ),
        ),
        bottomNavigationBar: RaspTitledBottomNavigationBar(
          selectedDay: raspItemsModel.today - 1,
          jumpTo: raspItemsModel.setCurrent,
        ),
      );
    });
  }
}
