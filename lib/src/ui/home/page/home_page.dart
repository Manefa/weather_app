import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/constants/color_constants.dart';
import 'package:weather_app/src/domain/domain/fcst_day.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/ui/home/bloc/get_weather.dart';
import 'package:weather_app/src/ui/home/widgets/forecast_display.dart';
import 'package:weather_app/src/ui/home/widgets/loading_widget.dart';
import 'package:weather_app/src/ui/home/widgets/next_day_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetWeatherBloc getWeatherBloc = injector<GetWeatherBloc>();

  @override
  void initState() {
    getWeatherBloc.add(StartGetWeather());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<FcstDay> nextDay = [];
    Future<void> _refresh() async {
      nextDay.clear();
      getWeatherBloc.add(StartGetWeather());
    }
    return BlocProvider(
      create: (_) => getWeatherBloc,
      child: BlocListener(
        bloc: getWeatherBloc,
        listener: (BuildContext context, GetWeatherState state) {

          if(state is GetWeatherLoading){

          }

          if(state is GetWeatherLoaded){

          }

          if(state is GetWeatherError){

          }
        },
        child: BlocBuilder(
          bloc: getWeatherBloc,
          builder: (BuildContext context, GetWeatherState state){

            if(state is GetWeatherLoading){
              return const LoadingWidget();
            }
            if(state is GetWeatherLoaded){
              nextDay.add(state.weather.fcstDay1!);
              nextDay.add(state.weather.fcstDay2!);
              nextDay.add(state.weather.fcstDay3!);
              nextDay.add(state.weather.fcstDay4!);

              return DefaultTabController(
                length: 2,
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      width: size.width,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 20,),
                          Text(
                            state.weather.cityInfo!.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            state.weather.currentCondition!.date!,
                          ),
                          const SizedBox(height: 20,),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0XFF06508A),
                                  ),
                                  child: TabBar(
                                    labelColor: Colors.white,
                                    indicator: BoxDecoration(
                                      color: ColorConstants.primaryColorLight,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    tabs: const [
                                      Tab(text: "Prévision",),
                                      Tab(text: "Plus",)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              SizedBox(
                                height: size.height,
                                child: TabBarView(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Image.network(
                                            state.weather.currentCondition!.iconBig!
                                        ),
                                        const SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  const Text(
                                                    "Temp",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Text(state.weather.currentCondition!.tmp!.toString(),
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                children: <Widget>[
                                                  const Text(
                                                    "Pression",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Text(
                                                    state.weather.currentCondition!.pressure.toString(),
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Column(
                                                children: <Widget>[
                                                  const Text(
                                                    "Humidity",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Text(
                                                    state.weather.currentCondition!.humidity.toString()+"%",
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 30,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const <Widget>[
                                              Text(
                                                "Aujourd'hui",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        SizedBox(
                                          height: 60,
                                          width: size.width,
                                          child: ForeCastDisplay(fcstDay: state.weather.fcstDay0!,),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: <Widget>[
                                        const SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:  <Widget>[
                                              const Text(
                                                "Aujourd'hui",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),

                                              Text(
                                                state.weather.currentCondition!.date!,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        SizedBox(
                                          height: 60,
                                          width: size.width,
                                          child: ForeCastDisplay(fcstDay:  state.weather.fcstDay0!,),
                                        ),
                                        const SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20, right: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const <Widget>[
                                              Text(
                                                "Pour les prochains jours",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),

                                              Icon(
                                                Icons.calendar_today,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(child: NextDay(nextDays: nextDay,)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            if(state is GetWeatherError){
              return const Center(
                child: Text(
                    "Err !"
                ),
              );
            }

            return const Center(
              child: Text(
                "Aucun cas"
              ),
            );
          },
        ),
      ),
    );
  }
}
