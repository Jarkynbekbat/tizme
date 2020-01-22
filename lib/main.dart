import 'package:flutter/material.dart';
import 'package:new_rasp_app/helpers/screen.dart';
import 'package:new_rasp_app/models/rasp_item_model.dart';
import 'package:new_rasp_app/pages/rasp_page/views/rasp_item_view.dart';
import 'package:new_rasp_app/pages/rasp_page/views/titled_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RaspItemsModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
