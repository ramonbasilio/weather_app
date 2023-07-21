
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/model_search_city.dart';
import '../provider/app_provider.dart';
import '../service/firebase_service.dart';

class PageSearchCity extends StatefulWidget {
  const PageSearchCity({super.key});

  @override
  State<PageSearchCity> createState() => _PageSearchCityState();
}

class _PageSearchCityState extends State<PageSearchCity> {
  TextEditingController cityController = TextEditingController();
  String city = '';

  @override
  void initState() {
    cityController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: cityController,
                onChanged: (value) {
                  setState(() {
                    city = value;
                    Provider.of<AppProvider>(context, listen: false)
                        .getSearchCity(value);
                  });
                },
              ),
              Consumer<AppProvider>(
                builder: (context, value, child) {
                  List<ModelSearchCity> listCity = value.listSearchCity;
                  return cityController.text.isEmpty ? Container() : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listCity.length,
                    itemBuilder: (context, index) {
                      final dataCity = listCity[index];
                      return ListTile(
                        leading: Text('${dataCity.name} - ${dataCity.country}'),
                        onTap: () async {
                              FirebaseService().saveCitySearch(dataCity.name);
                          cityController.clear();
                          Navigator.pushReplacementNamed(context, '/');
                          print('passou aqui');
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
