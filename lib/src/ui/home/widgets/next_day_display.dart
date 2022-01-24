import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/color_constants.dart';

class NextDay extends StatelessWidget {
  const NextDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(right: 20, left: 10),
        shrinkWrap: true,
        clipBehavior: Clip.hardEdge,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: size.width,
              height: 70,
              decoration: BoxDecoration(
                color: ColorConstants.primaryColorLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Friday",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "May,29",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Text(
                    "32",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Image.asset("assets/images/meteo.png"),
                ],
              ),
            ),
          );
        }
    );
  }
}
