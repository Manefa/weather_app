import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/domain/fcst_day.dart';
import 'package:weather_app/src/domain/domain/hourly_datum.dart';

class ForeCastTwoDisplay extends StatefulWidget {
  final FcstDay? fcstDay;
  const ForeCastTwoDisplay({Key? key, this.fcstDay}) : super(key: key);

  @override
  _ForeCastTwoState createState() => _ForeCastTwoState();
}

class _ForeCastTwoState extends State<ForeCastTwoDisplay> {
  @override
  Widget build(BuildContext context) {

    List<HourlyDatum> list = [];
    List<String> listName = [];

    for (var element in widget.fcstDay!.hourlyData!.entries) {
      list.add(element.value);
    }

    for (var element in widget.fcstDay!.hourlyData!.entries) {
      listName.add(element.key);
    }

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 20, left: 10),
      shrinkWrap: true,
      clipBehavior: Clip.none,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.network(
                      list[index].icon!,
                    height: 30,
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  <Widget>[
                      Text(
                        listName[index].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text(
                        list[index].tmp2M!.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  )
                ],
              ),
            ),
          );
      }
    );
  }
}
