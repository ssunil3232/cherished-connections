import 'package:connections_cherished/classes/profile_detail.dart';
import 'package:connections_cherished/profile_update.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final ProfileDetail profile;

  const Profile({super.key, required this.profile});
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  ProfileDetail profileUpdate = ProfileDetail(name: '', img: '');
  @override
  void initState() {
    super.initState();
    profileUpdate = widget.profile;
  }

  void updateData(value) {
    setState(() {
      profileUpdate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Expanded(
          //     child:
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // margin: const EdgeInsets.symmetric(vertical: 20),
            width: 300,
            height: 50,
            child: Text(
              profileUpdate.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xffB350E1),
                fontSize: 30,
                height:
                    0.9, // Reduce the line height; adjust this value as needed
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Stack(
            children: [
              SizedBox(
                width: 180,
                height: 150,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(profileUpdate.img),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                right:
                    -10, // Adjust this value to move the button closer or further from the right edge
                top:
                    -10, // Adjust this value to move the button closer or further from the top
                child: IconButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  icon: const Icon(Icons.edit,
                      color: Color.fromARGB(255, 164, 78, 235)),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ProfileUpdate(
                              name: profileUpdate.name,
                              img: profileUpdate.img,
                              onChanged: (ProfileDetail value) {
                                setState(() {
                                  updateData(value);
                                });
                              });
                        });
                  },
                ),
              ),
            ],
          )
        ]);
  }
}
