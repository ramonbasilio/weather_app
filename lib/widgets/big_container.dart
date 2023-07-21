import 'package:flutter/material.dart';
import 'package:weaher_app/model/model_forecastday.dart';
import 'package:weaher_app/utils/utils.dart';


class BigContainer extends StatefulWidget {
  final ForecastDayFull dataWeather;
  const BigContainer({super.key, required this.dataWeather});

  @override
  State<BigContainer> createState() => _BigContainerState();
}

class _BigContainerState extends State<BigContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 600,
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 159, 209, 250).withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(
                    0, 0.1), // Altere os valores para ajustar o brilho
              ),
            ],
            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                  0.2,
                  0.5,
                  0.8
                ],
                colors: [
                  Colors.blue, // Azul inicial
                  Colors.lightBlue, // Azul mais claro
                  Colors.blueAccent, // Azul brilhante
                ]),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/pageSearchCity');
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.location_on),
                      Text(
                        widget.dataWeather.location['name'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${widget.dataWeather.location['region']} - ${widget.dataWeather.location['country']}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Image.asset(
                  '/home/ramon/Projetos_Flutter/App_weatherapi/Assets/Icons/${Utils.NightOrDay(widget.dataWeather.linkIcon)}/${Utils.NameImage(widget.dataWeather.linkIcon)}',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.dataWeather.temp.toString(),
                    style: const TextStyle(
                        shadows: [
                          Shadow(
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              color: Colors.white),
                        ],
                        fontSize: 200,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    Utils.utf8convert(
                        widget.dataWeather.current['condition']['text']),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                child: Text(
                  'Última atualização: ${Utils.utf8convert(widget.dataWeather.current['last_updated'])}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 150,
        )
      ],
    );
  }
}
