// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// File? _image;
// final ImagePicker _picker = ImagePicker();

// Future<void> _takePhoto() async {
//   final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
  
//   if (photo != null) {
//     setState(() {
//       _image = File(photo.path);
//     });
//   }
// }


//para visualizar:
// _image == null
//     ? const Text('Nenhuma foto selecionada.')
//     : Image.file(_image!),