import 'package:flutter/material.dart';
import 'package:new_rasp_app/components/my_app_bar.dart';
import 'package:new_rasp_app/main.dart';
import 'package:new_rasp_app/models/rasp_model.dart';
import 'package:new_rasp_app/pages/rasp_page/views/get_skeleton.dart';
import 'package:new_rasp_app/pages/rasp_page/views/navigation_drawer.dart';
import 'package:new_rasp_app/pages/rasp_page/views/no_rasps.dart';
import 'package:new_rasp_app/pages/rasp_page/views/rasp_item_view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'views/titled_bottom_navigation_bar.dart';

class RaspPage extends StatefulWidget {
  @override
  _RaspPageState createState() => _RaspPageState();
}

class _RaspPageState extends State<RaspPage>
    with SingleTickerProviderStateMixin {
  //глобальный ключ scaffold a
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController pageController;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    main();
    super.initState();
    pageController = PageController(initialPage: DateTime.now().weekday - 1);
  }

  @override
  Widget build(BuildContext context) {
    final raspModel = Provider.of<RaspModel>(context);

    // TODO: доделать работает не корректно
    // final localNotifications = LocalNotificationModel();
    // localNotifications.setDailyNotification(
    //   id: 1,
    //   title: 'Расписание текущего дня',
    //   body: '',
    //   time: Time(7, 30, 0),
    //   rasps: rasps,
    // );

    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(),
      appBar: MyAppBar(raspModel.group, Icon(Icons.menu),
          () => _scaffoldKey.currentState.openDrawer(), 'default'
          //TODO: добавить потом
          // [
          //   IconButton(
          //     icon: Icon(Icons.notifications),
          //     onPressed: () {},
          //   )
          // ],
          ),
      body: Consumer<RaspModel>(builder: (context, raspModel, _) {
        return !raspModel.isLoaded
            ? getSkeleton()
            : SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                onRefresh: () =>
                    raspModel.onRefresh(_scaffoldKey, _refreshController),
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) => raspModel.setCurrent(index + 1),
                  children: List.generate(7, (index) {
                    List<RaspItem> raspsList =
                        raspModel.getRaspByDayId(index + 1);
                    return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(right: 8, left: 8, top: 8),
                        child: Column(
                          children: raspsList.length == 0
                              ? [NoRasps()]
                              : List.generate(
                                  raspsList.length,
                                  (index2) =>
                                      RaspItemView(raspItem: raspsList[index2]),
                                ),
                        ),
                      ),
                    );
                  }),
                ),
              );
      }),
      bottomNavigationBar: RaspTitledBottomNavigationBar(
        selectedDay: raspModel.today - 1,
        jumpTo: (index) => pageController.jumpToPage(index),
      ),
    );
  }
}
