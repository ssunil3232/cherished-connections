import 'package:connections_cherished/classes/user.dart';
import 'package:connections_cherished/classification.dart';
import 'package:connections_cherished/grid.dart';
import 'package:connections_cherished/update-view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connections Cherished',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
                      color:
                          Colors.black87)), // Specify the color for "Cherished"
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin:
                  const EdgeInsets.all(20), // Add margin around the Container
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center, // Center the text horizontally
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Where you can ',
                        style: TextStyle(
                          fontFamily: GoogleFonts.juliusSansOne().fontFamily,
                        )),
                    TextSpan(
                        text: 'cherish', // The word you want to color
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontFamily: GoogleFonts.juliusSansOne().fontFamily,
                            color:
                                Colors.deepPurple) // Change the color as needed
                        ),
                    TextSpan(
                        text: ' your connections better...',
                        style: TextStyle(
                          fontFamily: GoogleFonts.juliusSansOne().fontFamily,
                        )), // Text after the colored word
                  ],
                ),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.all(20), // Add margin around the Container
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'You need to cherish your connection with',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff8D8787),
                ),
              ),
            ),
            const Text(
              'Shriya',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xffB350E1),
              ),
            ),
            Row(children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Classification(),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    width: 140, // Set your desired width here
                    child: FilledButton(
                      style: ButtonStyle(
                        textStyle: WidgetStateProperty.all(
                          const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w200),
                        ),
                        foregroundColor: WidgetStateProperty.all(
                            const Color.fromARGB(255, 97, 93, 93)),
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xffF3E7F9)),
                      ),
                      onPressed: () {
                        var newUser = User(
                            name: 'Unknown',
                            days: 0,
                            color: 3,
                            update: DateTime.now().toString(),
                            freq_year: 0,
                            freq_mth: 1,
                            freq_day: 0,
                            birthday: DateTime.now().toString(),
                            alert: false,
                            img: 'assets/images/profile.png');
                        Map<String, dynamic> userMap = newUser.toJson();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateView(data: userMap)),
                        );
                      }, // Define the onPressed handler
                      child: const Row(
                        mainAxisSize: MainAxisSize
                            .min, // Use min to prevent the Row from expanding
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            child: Text(
                              'Add more connections',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Icon(
                            Icons.add, // Plus icon
                            size: 22, // Adjust the size as needed
                          ),
                        ],
                      ),
                    ),
                  ))
            ]),
            SizedBox(
              height: 30,
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: const SizedBox(width: 100, child: Text('Name')),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 80),
                  child: const SizedBox(
                    child: Text('Last Contacted'),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height:
                  300, // Add some space between the Classification and the grid
              child: DetailsGrid(),
            ),
          ],
        ),
      ),
      // ignore: prefer_const_constructors
    );
  }
}
