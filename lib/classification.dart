import 'package:flutter/material.dart';

class Classification extends StatelessWidget {
  const Classification({super.key});

  static const List<Map<String, dynamic>> classes = [
    {'text': 'It was great catching up', 'color': 0xffC88EE4},
    {'text': 'We should catch up soon', "color": 0xffE3C1F3},
    {'text': 'It was great catching up', "color": 0xffECE1F1}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var item in classes)
          SizedBox(
              height: 30,
              child: Row(children: [
                Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(item['color'] as int)),
                ),
                Text(item['text'] as String,
                    style: const TextStyle(color: Color(0xff8D8787)))
              ])),
        // SizedBox(
        //     height: 50,
        //     child: Row(children: [
        //       Container(
        //         width: 15,
        //         height: 15,
        //         margin: const EdgeInsets.only(right: 10, left: 10),
        //         decoration: const BoxDecoration(
        //             shape: BoxShape.circle, color: Color(0xffE3C1F3)),
        //       ),
        //       const Text('We should catch up soon',
        //           style: TextStyle(color: Color(0xff8D8787)))
        //     ])),
        // SizedBox(
        //     height: 50,
        //     child: Row(children: [
        //       Container(
        //         width: 15,
        //         height: 15,
        //         margin: const EdgeInsets.only(right: 10, left: 10),
        //         decoration: const BoxDecoration(
        //             shape: BoxShape.circle, color: Color(0xffECE1F1)),
        //       ),
        //       const Text('It was great catching up',
        //           style: TextStyle(color: Color(0xff8D8787)))
        //     ])),
      ],
    );
  }
}
