
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/widgets/contact.dart';
import 'package:tareeq/widgets/second_text_field.dart';
import 'package:image/image.dart' as img;

class ProfilePage extends StatefulWidget {
   ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

XFile? _image;
  final ImagePicker _imagePicker = ImagePicker(); // Instance of ImagePicker
   final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isSaving = false;
   String? _profileImageUrl;
@override
  void initState() {
    super.initState();
    _fetchProfileImage(); // Fetch profile picture URL when page loads
  }

  /// Fetch the profile picture URL from Firestore at login
  Future<void> _fetchProfileImage() async {
    final user = _auth.currentUser;

    if (user != null) {
      try {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        setState(() {
          _profileImageUrl = userDoc['profileImageUrl'] ?? null;
        });
      } catch (e) {
        print("Error fetching profile image URL: $e");
      }
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = pickedImage;
      });
    } catch (e) {
      // Handle any errors here
      print("Error picking image: $e");
    }
  }

   Future<void> _uploadImage() async {
    if (_image == null) {
      print("No image selected");
      return;
    }

    try {
      final user = _auth.currentUser;
      if (user == null) {
        print("No user signed in");
        return;
      }

      final storageRef = FirebaseStorage.instance.ref();
      final uploadRef = storageRef.child('profile_images/${user.uid}/${_image!.name}');

      setState(() => _isSaving = true); // Start saving indicator

      // Upload the image file
      await uploadRef.putFile(File(_image!.path));

      // Get the download URL
      final downloadUrl = await uploadRef.getDownloadURL();

      // Save the image URL to Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
        {'profileImageUrl': downloadUrl},
        SetOptions(merge: true), // Merge with existing data
      );

      print('File uploaded successfully. Download URL: $downloadUrl');
        setState(() {
        _isSaving = false;
        _profileImageUrl = downloadUrl; // Update the profile image URL
      });

      ScaffoldMessenger.of(context).showSnackBar(
       const  SnackBar(content: Text("Profile picture saved successfully!"))
      );
    } catch (e) {
      setState(() => _isSaving = false); // Stop saving indicator
      print("Error uploading image: $e");
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      backgroundColor: kprimaryColor,
      title: const Text('Edit Profile',style: TextStyle(color: Colors.white,fontFamily: kFont,fontWeight: FontWeight.bold,fontSize: 20),),
      centerTitle: true,
      automaticallyImplyLeading: false,
     leading: IconButton(
      onPressed: (){
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back_ios,color: Colors.grey.shade300,)),

     ),
     body: ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
          height:90,width: double.infinity,
        decoration: const BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(26),bottomRight: Radius.circular(26))
        ),
        ),
        Positioned(
          right: 50,
          left: 50,
          top: 20,
          child:CircleAvatar(
            radius: 70,
            backgroundColor:const Color(0xff5C7292).withOpacity(.5),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: const Color(0xff5C7292),
              child: CircleAvatar(
                 radius: 55,          
              backgroundImage: _image != null
      ? FileImage(File(_image!.path)) as ImageProvider<Object>
      : (_profileImageUrl != null
          ? NetworkImage(_profileImageUrl!) as ImageProvider<Object>
          : const AssetImage('assets/images/ii.jpg') as ImageProvider<Object>)
              ),
            ),
          )
        ),
        Positioned(
          right: 30,
          top: 70,
          child:Container(
            height: 33,
            width: 33,
          decoration: BoxDecoration(
            color: const Color(0xff5C7292),
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed:(){
              
            },
            icon:GestureDetector(
              onTap:  _pickImage,
              child: const Icon(Icons.add_a_photo_rounded,color: Colors.white,size:20)) ,
              ),
        )
        ),
       
          ],
        ),
      const Padding(
        padding:  EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Text('pick a new image?',style: const TextStyle(color: Color(0xffA1ACBC),fontSize:9,fontWeight: FontWeight.bold ))
        ],),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         Padding(
           padding: const EdgeInsets.only(right: 12),
           child: GestureDetector(
            onTap: _uploadImage,
             child: Container(
                     decoration: BoxDecoration(        
                         color:const  Color(0xffA1ACBC),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      width:80,
                      height: 20,
                      child: const Center(child: Text('Upload image',style: TextStyle(fontSize: 10,color: Colors.white),)),
             ),
           ),
         )
      ]),
      Column(
        children: [
          const SizedBox(height: 50,),
          SecondTextField(hintText: 'Enter your name', labalText: 'Full name'),
          const SizedBox(height: 30),
          SecondTextField(hintText:'your gmail' , labalText: 'E-mail Address'),
           const SizedBox(height: 30),
          SecondTextField(hintText:'your phone number' , labalText: 'Phone number'),
           const SizedBox(height: 30),
          SecondTextField(hintText:'your location' , labalText:'Location Address'),
          const SizedBox(height: 24,),
          Container(
            width: 244,
            color: Colors.grey,
            height: 1,
          ),
          const SizedBox(height: 20),
         const  Padding(
            padding: const EdgeInsets.only(left: 33),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Emergency contacts',style:TextStyle(color: Color(0xff3C4B63),fontFamily: kFont,fontWeight: FontWeight.bold, decoration: TextDecoration.underline,) ,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60,top: 10,right: 24),
            child: Column(
              children: [
               EmergencyContact(name: 'mama',phone: '01077889555',),
               const SizedBox(height:8),
               EmergencyContact(name: 'baba', phone: '  01077889555'),
               const SizedBox(height:8),
               EmergencyContact(name: 'my sis', phone: '01077889555'),  
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                 decoration: BoxDecoration(        
                     color: const Color(0xffFFF3CF),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color:const Color.fromARGB(255, 233, 228, 212))
                  ),
                  width: 110,
                  height: 22,
                  child:const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add,color: Color(0xffE8C872),size: 16,),
                      const Text('add number',style: TextStyle(color:Color(0xffE8C872),fontFamily:kFont,fontWeight: FontWeight.bold,fontSize:11),)
                    ],
                  )
                  
                ),
              ],
            ),
          ),
           const SizedBox(height:12),
           Container(
            width: 250,
            color: Colors.grey,
            height: 1,
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Container(
                height: 33,
                width: 135,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(24)
                ),
                child: const Center(child: Text('CANCEL',style: TextStyle(fontFamily: kFont,fontWeight: FontWeight.w700,fontSize: 12),)),
               ),
               Container(
                height: 33,
                width: 135,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(24)
                ),
                child:const  Center(child: Text('SAVE',style: TextStyle(color:Colors.white ,fontFamily: kFont,fontWeight: FontWeight.w700,fontSize: 12),)),
               ),
              ],
            ),
          ),
          const SizedBox(height: 60,)
        ],
      )
      ],
     ),
    );
  }


}

