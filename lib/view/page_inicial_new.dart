// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weaher_app/utils/geolocator.dart';
import 'package:weaher_app/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant/constants.dart';
import '../model/model_forecastday.dart';
import '../provider/app_provider.dart';

class PageInicialNew extends StatefulWidget {
  final ForecastDayFull dataWeather;
  final Function reload;
  const PageInicialNew(
      {required this.dataWeather, required this.reload, super.key});

  @override
  State<PageInicialNew> createState() => _PageInicialNewState();
}

class _PageInicialNewState extends State<PageInicialNew> {
  late Color fontColor;

  @override
  void initState() {
    if (!widget.dataWeather.isDay) {
      fontColor = Constants.BACKGROUND_NIGHT;
    } else {
      fontColor = Constants.BACKGROUND_DAY;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) => SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) => Container(
            color: !widget.dataWeather.isDay
                ? Constants.BACKGROUND_DAY
                : Constants.BACKGROUND_NIGHT,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.height*0.95 : 1200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              color: fontColor,
                              onPressed: () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.amber.shade100,
                                    content: const Text(
                                      'Carregando localização atual...',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                                GeolocatorClass _geolocatorclass =
                                    GeolocatorClass();
                                Position myposition =
                                    await _geolocatorclass.getPosition();
                                String loc =
                                    '${myposition.latitude},${myposition.longitude}';
                                print('Minha localização atual: $loc');
                                value.getSearchCity(loc, true);
                                value.getCitySaved(loc);
                                widget.reload();
                              },
                              icon: Icon(Icons.location_on),
                              iconSize: 40),
                          Text(
                            widget.dataWeather.location['name'],
                            style: TextStyle(fontSize: 50, color: fontColor),
                          ),
                          Text(
                              '${widget.dataWeather.location['region']} - ${widget.dataWeather.location['country']}',
                              style: TextStyle(fontSize: 20, color: fontColor)),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        child: Image.asset(
                          'Assets/${Utils.NightOrDay(widget.dataWeather.linkIcon)}/${Utils.NameImage(widget.dataWeather.linkIcon)}',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${widget.dataWeather.temp}°',
                                style:
                                    TextStyle(fontSize: 150, color: fontColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text('${widget.dataWeather.tempMax}°',
                                      style: TextStyle(
                                          fontSize: 30, color: fontColor)),
                                  Text('${widget.dataWeather.tempMin}°',
                                      style: TextStyle(
                                          fontSize: 30, color: fontColor)),
                                ],
                              )
                            ],
                          ),
                          Text(
                            widget.dataWeather.text,
                            style: TextStyle(fontSize: 20, color: fontColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                    iconColor: fontColor,
                                    side:
                                        BorderSide(color: fontColor, width: 1)),
                                onPressed: () {},
                                child: Text(
                                  '5 dias',
                                  style:
                                      TextStyle(color: fontColor, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'Assets/Comum_icons/humidity.png',
                                        height: 80,
                                      ),
                                      Text(
                                        'Umidade \n${widget.dataWeather.humidity}%',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18, color: fontColor),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'Assets/Comum_icons/umbrella.png',
                                        height: 80,
                                      ),
                                      Text(
                                        'Chuva \n${widget.dataWeather.rain}%',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18, color: fontColor),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'Assets/Comum_icons/wind.png',
                                        height: 80,
                                      ),
                                      Text(
                                        'Vento \n${widget.dataWeather.wind} Km/h',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 18, color: fontColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Divider(
                                  color: fontColor,
                                  thickness: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Text(
                    'Atualizado em: ${widget.dataWeather.lastUpdated}',
                    style: TextStyle(
                      color: fontColor,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                      onPressed: () {
                        value.resetCity();
                        Navigator.pushNamed(context, '/pageSearchCity');
                      },
                      icon: const Icon(Icons.add),
                      color: fontColor,
                      iconSize: 40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
