import 'package:flutter/material.dart';
import 'package:new_rasp_app/models/rasp_model.dart';
import 'package:new_rasp_app/pages/rasp_page/views/navigation_drawer.dart';
import 'package:new_rasp_app/pages/rasp_page/views/no_rasps.dart';
import 'package:new_rasp_app/pages/rasp_page/views/rasp_item_view.dart';
import 'package:provider/provider.dart';
import '../../helpers/screen.dart';

import 'views/titled_bottom_navigation_bar.dart';

class RaspPage extends StatefulWidget {
  @override
  _RaspPageState createState() => _RaspPageState();
}

class _RaspPageState extends State<RaspPage>
    with SingleTickerProviderStateMixin {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: DateTime.now().weekday - 1);
  }

  @override
  Widget build(BuildContext context) {
    final raspModel = Provider.of<RaspModel>(context);

    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Screen.heigth(context) * 0.08),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: AppBar(
            title: Text(raspModel.group),
            centerTitle: true,
          ),
        ),
      ),
      body: Consumer<RaspModel>(builder: (context, raspModel, _) {
        return PageView(
          controller: pageController,
          onPageChanged: (index) => raspModel.setCurrent(index + 1),
          children: List.generate(7, (index) {
            if (raspModel.getRaspByDayId(index + 1).length == 0) {
              return NoRasps();
            }
            return Wrap(
              direction: Axis.vertical,
              children: List.generate(
                  raspModel.getRaspByDayId(index + 1).length, (index2) {
                return RaspItemView(
                    raspItem: raspModel.getRaspByDayId(index + 1)[index2]);
              }),
            );
          }),
        );
      }),
      bottomNavigationBar: RaspTitledBottomNavigationBar(
        selectedDay: raspModel.today - 1,
        // jumpTo: raspModel.setCurrent,
        jumpTo: (index) => pageController.jumpToPage(index),
      ),
    );
  }
}
