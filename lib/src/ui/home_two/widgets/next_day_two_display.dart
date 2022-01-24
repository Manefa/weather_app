import 'package:flutter/material.dart';
import 'package:weather_app/src/core/constants/color_constants.dart';
import 'package:weather_app/src/domain/domain/fcst_day.dart';

class NextDayTwo extends StatelessWidget {
  final List<FcstDay> nextDays;
  const NextDayTwo({Key? key, required this.nextDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(right: 20, left: 10),
        shrinkWrap: true,
        clipBehavior: Clip.hardEdge,
        itemCount: nextDays.length ,
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
                    children: <Widget>[
                      Text(
                        nextDays[index].dayLong!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        nextDays[index].date!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Text(
                    nextDays[index].tmax!.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.network(nextDays[index].icon.toString()),
                ],
              ),
            ),
          );
        }
    );
  }
}
