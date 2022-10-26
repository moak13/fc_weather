import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/lat_long_model.dart';
import '../../core/utils/size_manager.dart';
import 'view_model/home_viewmodel.dart';
import 'widgets/city_drop_down.dart';
import 'widgets/general_error_widget.dart';
import 'widgets/report_data_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Switch.adaptive(
              value: model.isDark,
              onChanged: (value) {
                model.actionSwitchTheme();
              },
            ),
            actions: [
              IconButton(
                onPressed: model.actionGetUserLocationWeather,
                icon: const Icon(Icons.location_on),
              ),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.only(
              top: SizeMg.height(10),
              left: SizeMg.width(5),
              right: SizeMg.width(5),
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Weather',
                    style: theme.textTheme.headline5,
                  ),
                  CityDropDown(
                    onCityChange: (value) {
                      LatLongModel data =
                          LatLongModel(lat: value.lat, long: value.lng);
                      void afterBuild() {
                        model.actionFetchCurrentWeather(data);
                        model.actionTrackLatLong(data);
                      }

                      Timer(Duration.zero, afterBuild);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: SizeMg.height(150),
              ),
              Builder(
                builder: (context) {
                  if (model.isBusy) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  if (model.hasError) {
                    return Center(
                      child: GeneralErrorWidget(
                        errorMessage: model.modelError,
                        onTap: () {
                          if (model.latLongModel == null) return;
                          model.actionFetchCurrentWeather(model.latLongModel!);
                        },
                      ),
                    );
                  }

                  if (model.currentWeatherModel == null) {
                    return Center(
                      child: GeneralErrorWidget(
                        errorMessage: 'Weather data is unavailable!',
                        onTap: () {
                          if (model.latLongModel == null) return;
                          model.actionFetchCurrentWeather(model.latLongModel!);
                        },
                      ),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${model.currentWeatherModel?.name}',
                        style: theme.textTheme.bodyText1?.copyWith(
                          fontSize: SizeMg.text(18),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: SizeMg.height(48),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          final weather = model.currentWeatherModel?.weather
                              ?.elementAt(index);
                          return Text(
                            '${weather?.description}',
                            style: theme.textTheme.caption?.copyWith(
                              fontSize: SizeMg.text(20),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                      SizedBox(
                        height: SizeMg.height(6),
                      ),
                      Text(
                        '${model.currentWeatherModel?.main?.temp} °C',
                        style: theme.textTheme.bodyText1?.copyWith(
                          fontSize: SizeMg.text(56),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: SizeMg.height(32),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ReportDataWidget(
                            title: 'Pressure',
                            data: model.currentWeatherModel?.main?.pressure,
                          ),
                          ReportDataWidget(
                            title: 'Humidity',
                            data: model.currentWeatherModel?.main?.humidity,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
