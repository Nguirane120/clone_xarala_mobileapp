import 'dart:io';
import 'package:clonexaralalmobileapp/widgets/texformWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Map<String, dynamic>? userData;
  bool isUpdating = false;
  bool isLoading = false;

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(currentUser.uid).get();
        if (userDoc.exists) {
          setState(() {
            userData = userDoc.data() as Map<String, dynamic>;
            _nameController.text = userData!['name'] ?? '';
            _phoneController.text = userData!['phone'] ?? '';
            _emailController.text = userData!['email'] ?? '';
          });
        }
      }
    } catch (e) {
      print('Erreur lors de la récupération des données utilisateur : $e');
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<String?> uploadImage(File image) async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        final ref = _storage
            .ref()
            .child('profileImages')
            .child('${currentUser.uid}.jpg');
        await ref.putFile(image);
        return await ref.getDownloadURL();
      }
    } catch (e) {
      print('Erreur lors du téléchargement de l\'image : $e');
    }
    return null;
  }

  Future<void> updateUserData() async {
    try {
      setState(() {
        isUpdating = true;
      });

      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        String? imageUrl;
        if (_selectedImage != null) {
          imageUrl = await uploadImage(_selectedImage!);
        }

        await _firestore.collection('users').doc(currentUser.uid).update({
          'name': _nameController.text.trim(),
          'phone': _phoneController.text.trim(),
          'email': _emailController.text.trim(),
          if (imageUrl != null) 'profileImage': imageUrl,
        });

        setState(() {
          isUpdating = false;
        });
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Informations mises à jour avec succès')),
        );
      }
    } catch (e) {
      setState(() {
        isUpdating = false;
      });
      print('Erreur lors de la mise à jour des données utilisateur : $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la mise à jour')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le Profil'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/pp.jpeg'),
                  ),
                  SizedBox(height: 20),
                  TextformWidget(
                    contontroller: _nameController,
                    labelText: "Nom complet",
                  ),
                  SizedBox(height: 10),
                  TextformWidget(
                    contontroller: _phoneController,
                    labelText: 'Téléphone',
                  ),
                  SizedBox(height: 10),
                  TextformWidget(
                    contontroller: _emailController,
                    labelText: 'Email',
                  ),
                  SizedBox(height: 20),
                  isUpdating
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: updateUserData,
                          child: Text('Mettre à jour'),
                        ),
                ],
              ),
            ),
    );
  }
}
