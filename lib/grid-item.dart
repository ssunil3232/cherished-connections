import 'package:connections_cherished/classes/severity_class.dart';
import 'package:connections_cherished/update-view.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget(
      {super.key,
      required this.name,
      required this.days,
      required this.color,
      required this.data});

  final String name;
  final int days;
  final int color;
  final data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color == 1
          ? AppColors.severeColor
          : color == 2
              ? AppColors.warningColor
              : AppColors.normalColor,
      child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 100,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: Text('$days days ago'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Material(
                    color: Colors.transparent, // Button color
                    child: InkWell(
                      splashColor: const Color.fromARGB(
                          255, 199, 193, 193), // Splash color
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateView(data: data)),
                        );
                      }, // Button pressed
                      child: const SizedBox(
                        width: 30, // Button size
                        height: 30, // Button size
                        child: Icon(Icons.settings, color: Color(0xff8D8787)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
