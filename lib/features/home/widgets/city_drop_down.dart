import 'package:flutter/material.dart';

import '../../../core/data/cities_data.dart';
import '../../../core/models/city_model.dart';
import '../../../core/utils/size_manager.dart';
import '../../../core/utils/string_util.dart';

class CityDropDown extends StatefulWidget {
  final ValueChanged<CityModel>? onCityChange;
  const CityDropDown({super.key, this.onCityChange});

  @override
  State<CityDropDown> createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  late CityModel _selectedCity;
  late List<CityModel> cities;

  @override
  void initState() {
    setInitialCity();
    super.initState();
  }

  void setInitialCity() {
    cities = deserializedCities;
    var data = CityModel.defaultCity;
    _selectedCity = CityModel.fromJson(data);
    widget.onCityChange?.call(_selectedCity);
  }

  void actionOnSelectCity(CityModel value) {
    CityModel cityData = value;

    if (_selectedCity.city == cityData.city) {
      return;
    }

    setState(() {
      _selectedCity = value;
    });

    widget.onCityChange?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return Container(
      height: SizeMg.height(20),
      width: SizeMg.width(70),
      padding: EdgeInsets.only(
        left: SizeMg.width(5),
        right: SizeMg.width(5),
      ),
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(SizeMg.radius(5)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CityModel>(
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey,
            size: SizeMg.width(24),
          ),
          items: cities.map<DropdownMenuItem<CityModel>>((e) {
            return DropdownMenuItem<CityModel>(
              value: e,
              child: Text('${e.city}'),
            );
          }).toList(),
          onChanged: (value) {
            if (StringUtil.isEmpty(value?.city)) {
              return;
            }
            actionOnSelectCity(value!);
          },
          isExpanded: true,
          hint: Text(
            _selectedCity.city ?? 'Please Select',
            style: theme.textTheme.bodySmall,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
