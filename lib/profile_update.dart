import 'dart:io';

import 'package:connections_cherished/classes/profile_detail.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileUpdate extends StatelessWidget {
  ProfileUpdate(
      {super.key,
      required this.name,
      required this.img,
      required this.onChanged});

  String name;
  String img;
  final Function(ProfileDetail) onChanged;

  @override
  Widget build(BuildContext context) {
    ProfileDetail currProfile = ProfileDetail(name: name, img: img);

    return AlertDialog(
      title: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Edit Profile'),
        ],
      ),
      // const Text('Select Frequency'),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: currProfile.name),
                onChanged: (value) {
                  currProfile = currProfile.copyWith(
                      name: value); // Update newName with the input
                },
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 180,
                height: 150,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(currProfile.img), fit: BoxFit.cover),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  // Pick an image
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    File imageFile = File(image.path);
                    print(imageFile);
                  }
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center align the row's content
                    children: [
                      Icon(Icons.camera_alt),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Update Picture')
                    ]),
              ),
            ],
          );
        },
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () {
            onChanged(currProfile);
            Navigator.of(context)
                .pop(); // Close the dialog after saving changes
          },
        ),
      ],
    );
  }
}
