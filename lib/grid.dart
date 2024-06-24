import 'package:connections_cherished/grid-item.dart';
import 'package:flutter/material.dart';

class DetailsGrid extends StatelessWidget {
  const DetailsGrid({super.key});

  static const List<Map<String, dynamic>> data = [
    {
      'name': 'Shriya',
      'days': 64,
      'color': 1,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': false,
      'img': 'assets/images/profile.png'
    },
    {
      'name': 'Ashley Lamborghini',
      'days': 54,
      'color': 1,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': true,
      'img': 'assets/images/profile.png'
    },
    {
      'name': 'Julia',
      'days': 24,
      'color': 1,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': false,
      'img': 'assets/images/profile.png'
    },
    {
      'name': 'Chloe',
      'days': 64,
      'color': 1,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': false,
      'img': 'assets/images/profile.png'
    },
    {
      'name': 'Felicia',
      'days': 12,
      'color': 2,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': false,
      'img': 'assets/images/profile.png'
    },
    {
      'name': 'Doreen',
      'days': 32,
      'color': 2,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': false,
      'img': 'assets/images/profile.png'
    },
    {
      'name': 'Gabby',
      'days': 47,
      'color': 3,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': false,
      'img': 'assets/images/profile.png'
    },
    {
      'name': 'Aditi',
      'days': 32,
      'color': 3,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': false,
      'img': 'assets/images/profile.png'
    },
    {
      'name': 'Pika',
      'days': 32,
      'color': 3,
      'update': '2024-06-12 00:00:00.000',
      'freq_year': 0,
      'freq_mth': 1,
      'freq_day': 0,
      'birthday': '1998-10-17 00:00:00.000',
      'alert': false,
      'img': 'assets/images/profile.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 100),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (var item in data)
                ItemWidget(
                    name: item['name'] as String,
                    days: item['days'] as int,
                    color: item['color'] as int,
                    data: item),
            ]),
      ),
    ));
  }
}
