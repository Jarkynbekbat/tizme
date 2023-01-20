import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Theme.of(context).appBarTheme.color,
              ),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SkeletonAnimation(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Theme.of(context).appBarTheme.color,
                        ),
                        child: Container(
                          width: 70.0,
                          height: 70.0,
                          margin: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
                          child: SkeletonAnimation(
                            child: Container(
                              height: 15,
                              width: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SkeletonAnimation(
                              child: Container(
                                width: 60,
                                height: 13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
