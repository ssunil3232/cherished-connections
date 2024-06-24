import 'package:connections_cherished/classes/frequency.dart';
import 'package:connections_cherished/classes/profile_detail.dart';
import 'package:connections_cherished/classes/severity_class.dart';
import 'package:connections_cherished/freq_picker.dart';
import 'package:connections_cherished/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateView extends StatefulWidget {
  final Map<String, dynamic> data;

  const UpdateView({super.key, required this.data});
  @override
  UpdateViewState createState() => UpdateViewState();
}

class UpdateViewState extends State<UpdateView> {
  var dataUpdate = {};
  @override
  void initState() {
    super.initState();
    dataUpdate = Map.from(widget.data);
  }

  void updateData(value) {
    setState(() {
      dataUpdate = value;
    });
  }

  calculateSeverity(days) {
    if (days >= 60) {
      return 1;
    } else if (days <= 30 && days >= 14) {
      return 2;
    } else {
      return 3;
    }
  }

  getDaysAgo() {
    DateTime lastContact = DateTime.parse(dataUpdate['update']);
    DateTime now = DateTime.now();
    dataUpdate['days'] = now.difference(lastContact).inDays;
    dataUpdate['color'] = calculateSeverity(dataUpdate['days']);
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> dataUpdate = Map.from(widget.data);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: RichText(
            text: TextSpan(
              style: GoogleFonts.juliusSansOne(),
              children: const [
                TextSpan(
                  text: 'Connections ',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(
                          0xff8719BB)), // Specify the color for "Connections"
                ),
                TextSpan(
                    text: 'Cherished',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors
                            .black87)), // Specify the color for "Cherished"
              ],
            ),
          ),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20), // Add left and right padding
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                              // Wrap the Container with Expanded
                              child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Your connection with,',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: const Color(0xff8D8787),
                                  fontFamily: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w200)
                                      .fontFamily),
                            ),
                          )),
                        ],
                      ),
                      Profile(
                          profile: ProfileDetail(
                              name: dataUpdate['name'],
                              img: dataUpdate['img'])),
                      Row(
                        children: [
                          Expanded(
                              // Wrap the Container with Expanded
                              child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'You last cherished your connection',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: const Color(0xff8D8787),
                                  fontFamily: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w200)
                                      .fontFamily),
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        width: 300, // Set your desired fixed width
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                            left: 15.0, // Increase left padding
                            right: 15.0,
                          ),
                          // margin: const EdgeInsets.only(
                          //     right: 5.0, left: 5.0),
                          decoration: BoxDecoration(
                            color: dataUpdate['color'] == 1
                                ? AppColors.severeColor
                                : dataUpdate['color'] == 2
                                    ? AppColors.warningColor
                                    : AppColors
                                        .normalColor, // Set the background color to purple
                            borderRadius: BorderRadius.circular(
                                20.0), // Optional: if you want rounded corners
                          ),
                          child: Text('${dataUpdate['days']} days ago',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: dataUpdate['color'] == 1
                                      ? Colors.white
                                      : dataUpdate['color'] == 2
                                          ? Colors.grey[700]
                                          : Colors.grey[800],
                                  fontFamily: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w200)
                                      .fontFamily)),
                        ),
                      ),
                      Container(
                        height: 250,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 100, // Set your desired fixed width
                                    child: Text(
                                      'Last contacted',
                                      style: TextStyle(
                                        color: Color(0xff8D8787),
                                        height:
                                            0.9, // Reduce the line height; adjust this value as needed
                                      ),
                                      // textAlign: TextAlign.center,
                                      softWrap:
                                          true, // This is the default, but explicitly mentioned for clarity
                                    ),
                                  ),
                                  // const Text(':'),
                                  SizedBox(
                                    width: 175, // Set your desired fixed width
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                        left: 15.0, // Increase left padding
                                        right: 15.0,
                                      ),
                                      // margin: const EdgeInsets.only(
                                      //     right: 5.0, left: 5.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255,
                                            239,
                                            236,
                                            241), // Set the background color to purple
                                        borderRadius: BorderRadius.circular(
                                            4.0), // Optional: if you want rounded corners
                                      ),
                                      child: Text(
                                          DateFormat('d MMM yyyy').format(
                                              DateTime.parse(
                                                  dataUpdate['update'])),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily:
                                                  GoogleFonts.interTight(
                                                          fontWeight:
                                                              FontWeight.w400)
                                                      .fontFamily)),
                                    ),
                                  ),
                                  ClipOval(
                                      child: Material(
                                          color: Colors
                                              .transparent, // Button color
                                          child: InkWell(
                                              splashColor: const Color.fromARGB(
                                                  255,
                                                  199,
                                                  193,
                                                  193), // Splash color
                                              onTap: () async {
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                  context:
                                                      context, // You need to pass the BuildContext
                                                  initialDate: DateTime
                                                      .now(), // Initial date set to current date
                                                  firstDate: DateTime(
                                                      2000), // Earliest allowable date
                                                  lastDate: DateTime(
                                                      2025), // Latest allowable date
                                                );
                                                if (pickedDate != null) {
                                                  setState(() {
                                                    dataUpdate['update'] =
                                                        pickedDate.toString();
                                                  });

                                                  updateData(dataUpdate);
                                                  getDaysAgo();
                                                  // You can use the pickedDate for further operations
                                                }
                                              },
                                              child: const SizedBox(
                                                width: 30, // Button size
                                                height: 30, // Button size
                                                child: Icon(
                                                    Icons.calendar_month,
                                                    color: Color.fromARGB(
                                                        255, 141, 82, 169)),
                                              ))))
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 100, // Set your desired fixed width
                                    child: Text(
                                      'Contact Alert every',
                                      style: TextStyle(
                                        color: Color(0xff8D8787),
                                        height:
                                            0.9, // Reduce the line height; adjust this value as needed
                                      ),
                                      // textAlign: TextAlign.center,
                                      softWrap:
                                          true, // This is the default, but explicitly mentioned for clarity
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      // Show dialog code goes here
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FreqPicker(
                                              years: dataUpdate['freq_year'],
                                              months: dataUpdate['freq_mth'],
                                              days: dataUpdate['freq_day'],
                                              onChanged: (Frequency value) {
                                                setState(() {
                                                  dataUpdate =
                                                      Map.from(dataUpdate)
                                                        ..['freq_year'] =
                                                            value.years
                                                        ..['freq_mth'] =
                                                            value.months
                                                        ..['freq_day'] =
                                                            value.days;
                                                });

                                                updateData(dataUpdate);
                                              });
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                        left: 15.0, // Increase left padding
                                        right: 15.0,
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 5.0, left: 5.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255,
                                            141,
                                            82,
                                            169), // Set the background color to purple
                                        borderRadius: BorderRadius.circular(
                                            4.0), // Optional: if you want rounded corners
                                      ),
                                      child: Text(
                                        dataUpdate['freq_year'].toString(),
                                        style: const TextStyle(
                                          color: Colors
                                              .white, // Set text color to contrast with the background
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text('year',
                                      style: TextStyle(
                                        color: Color(0xff8D8787),
                                      )),
                                  GestureDetector(
                                    onTap: () async {
                                      // Show dialog code goes here
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FreqPicker(
                                              years: dataUpdate['freq_year'],
                                              months: dataUpdate['freq_mth'],
                                              days: dataUpdate['freq_day'],
                                              onChanged: (Frequency value) {
                                                setState(() {
                                                  dataUpdate =
                                                      Map.from(dataUpdate)
                                                        ..['freq_year'] =
                                                            value.years
                                                        ..['freq_mth'] =
                                                            value.months
                                                        ..['freq_day'] =
                                                            value.days;
                                                });

                                                updateData(dataUpdate);
                                              });
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                        left: 15.0, // Increase left padding
                                        right: 15.0,
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 5.0, left: 5.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255,
                                            141,
                                            82,
                                            169), // Set the background color to purple
                                        borderRadius: BorderRadius.circular(
                                            4.0), // Optional: if you want rounded corners
                                      ),
                                      child: Text(
                                        dataUpdate['freq_mth'].toString(),
                                        style: const TextStyle(
                                          color: Colors
                                              .white, // Set text color to contrast with the background
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text('month',
                                      style: TextStyle(
                                        color: Color(0xff8D8787),
                                      )),
                                  GestureDetector(
                                    onTap: () async {
                                      // Show dialog code goes here
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return FreqPicker(
                                              years: dataUpdate['freq_year'],
                                              months: dataUpdate['freq_mth'],
                                              days: dataUpdate['freq_day'],
                                              onChanged: (Frequency value) {
                                                setState(() {
                                                  dataUpdate =
                                                      Map.from(dataUpdate)
                                                        ..['freq_year'] =
                                                            value.years
                                                        ..['freq_mth'] =
                                                            value.months
                                                        ..['freq_day'] =
                                                            value.days;
                                                });

                                                updateData(dataUpdate);
                                              });
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                        left: 15.0, // Increase left padding
                                        right: 15.0,
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 5.0, left: 5.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255,
                                            141,
                                            82,
                                            169), // Set the background color to purple
                                        borderRadius: BorderRadius.circular(
                                            4.0), // Optional: if you want rounded corners
                                      ),
                                      child: Text(
                                        dataUpdate['freq_day'].toString(),
                                        style: const TextStyle(
                                          color: Colors
                                              .white, // Set text color to contrast with the background
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text('days',
                                      style: TextStyle(
                                        color: Color(0xff8D8787),
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            20.0), // Add bottom margin to the first Text
                                    child: SizedBox(
                                      width:
                                          100, // Set your desired fixed width
                                      child: Text(
                                        'Birthday',
                                        style: TextStyle(
                                          color: Color(0xff8D8787),
                                          height:
                                              0.9, // Reduce the line height; adjust this value as needed
                                        ),
                                        // textAlign: TextAlign.center,
                                        softWrap:
                                            true, // This is the default, but explicitly mentioned for clarity
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom:
                                            20.0), // Add bottom margin to the second Text
                                    child: SizedBox(
                                      width:
                                          175, // Set your desired fixed width
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          left: 15.0, // Increase left padding
                                          right: 15.0,
                                        ),
                                        // margin: const EdgeInsets.only(
                                        //     right: 5.0, left: 5.0),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255,
                                              239,
                                              236,
                                              241), // Set the background color to purple
                                          borderRadius: BorderRadius.circular(
                                              4.0), // Optional: if you want rounded corners
                                        ),
                                        child: Text(
                                            DateFormat('d MMM yyyy').format(
                                                DateTime.parse(
                                                    dataUpdate['birthday'])),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily:
                                                    GoogleFonts.interTight(
                                                            fontWeight:
                                                                FontWeight.w400)
                                                        .fontFamily)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          bottom:
                                              20.0), // Add bottom margin to the second Text
                                      child: ClipOval(
                                          child: Material(
                                              color: Colors
                                                  .transparent, // Button color
                                              child: InkWell(
                                                  splashColor:
                                                      const Color.fromARGB(
                                                          255,
                                                          199,
                                                          193,
                                                          193), // Splash color
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                      context:
                                                          context, // You need to pass the BuildContext
                                                      initialDate: DateTime
                                                          .now(), // Initial date set to current date
                                                      firstDate: DateTime(
                                                          2000), // Earliest allowable date
                                                      lastDate: DateTime(
                                                          2025), // Latest allowable date
                                                    );
                                                    if (pickedDate != null) {
                                                      setState(() {
                                                        dataUpdate['birthday'] =
                                                            pickedDate
                                                                .toString();
                                                      });

                                                      updateData(dataUpdate);
                                                      // You can use the pickedDate for further operations
                                                    }
                                                  },
                                                  child: const SizedBox(
                                                    width: 30, // Button size
                                                    height: 30, // Button size
                                                    child: Icon(
                                                        Icons.calendar_month,
                                                        color: Color.fromARGB(
                                                            255, 141, 82, 169)),
                                                  ))))),
                                  Container(
                                      margin: const EdgeInsets.only(
                                          left:
                                              5.0), // Adjust the left margin as needed
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Switch(
                                            value: dataUpdate['alert'] as bool,
                                            activeColor:
                                                const Color(0xff8719BB),
                                            onChanged: (bool value) {
                                              dataUpdate['alert'] = value;
                                              updateData(dataUpdate);
                                            },
                                          ),
                                          const Text(
                                            'Alert', // Your subtitle text
                                            style: TextStyle(
                                              fontSize:
                                                  12.0, // Adjust the font size as needed
                                              color: Colors
                                                  .grey, // Adjust the color as needed
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              // Wrap the Container with Expanded
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                margin: const EdgeInsets.only(bottom: 10),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      minimumSize: WidgetStateProperty.all(
                                          const Size(double.infinity,
                                              60)), // Ensures the button has a minimum height of 60
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Low borderRadius makes the button more rectangular
                                        ),
                                      ),
                                      backgroundColor: WidgetStateProperty.all(
                                          const Color(0xffE3C1F3))),
                                  child: Text(
                                    'Save Changes',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: const Color(0xff8D8787),
                                        fontFamily: GoogleFonts.interTight(
                                                fontWeight: FontWeight.w200)
                                            .fontFamily),
                                  ),
                                ),
                              ),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              // Wrap the Container with Expanded
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      minimumSize: WidgetStateProperty.all(
                                          const Size(double.infinity,
                                              60)), // Ensures the button has a minimum height of 60
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Low borderRadius makes the button more rectangular
                                        ),
                                      ),
                                      backgroundColor: WidgetStateProperty.all(
                                          const Color(0xffF8CBCB))),
                                  child: Text(
                                    'Delete Connection',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: const Color(0xff8D8787),
                                        fontFamily: GoogleFonts.interTight(
                                                fontWeight: FontWeight.w200)
                                            .fontFamily),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ]))));
  }
}
