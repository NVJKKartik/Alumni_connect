import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _userNameController;
  late final TextEditingController _professionController;
  late final TextEditingController _descriptionController;

  XFile? _image;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _userNameController = TextEditingController();
    _professionController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  Future<void> _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image;
        });
      }
    } on PlatformException catch (_) {
      throw Exception;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // Handle form submission and updating user details
              // You can call a function here to update the user details
              // based on the values in the text controllers and _image
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: _image == null
                    ? CircleAvatar(
                        radius: 65,
                        child: const Icon(Icons.camera_alt),
                      )
                    : CircleAvatar(
                        radius: 65,
                        backgroundImage: FileImage(File(_image!.path)),
                      ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _professionController,
                decoration: const InputDecoration(labelText: 'Profession'),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
