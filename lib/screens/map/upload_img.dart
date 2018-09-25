import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:find_tutors/utils/constants.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import '../../utils/firebase_config.dart';

class UploadImg extends StatefulWidget {
  @override
  _UploadImgState createState() => _UploadImgState();
}

class _UploadImgState extends State<UploadImg> {
  FirebaseStorage _storage;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  bool isLoggedIn = false;

  String _networkImage = "";
  // FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    firebaseConfig()
        .then((storage) => setState(() {
              _storage = storage;
            }))
        .catchError((err) => print(err));
  }

  Future getImageFromLocal() async {
    ImagePicker.pickImage(source: ImageSource.gallery)
        .then((img) => uploadFile(img.path))
        .catchError((err) => print(err));
  }

  Future<Null> uploadFile(String filepath) async {
    final ByteData bytes = await rootBundle.load(filepath);
    final Directory tempDir = Directory.systemTemp;
    final String fileName = path.basename(filepath);
    final File file = File('${tempDir.path}/$fileName');
    file.writeAsBytes(bytes.buffer.asInt8List(), mode: FileMode.write);

    // final StorageReference ref = _storage.ref().child("student_001/" + fileName);

final StorageReference ref = Constants.storageRef(_storage,"teacher_001/post", "001_${fileName}");

    final StorageUploadTask task = ref.putFile(
      file,
      new StorageMetadata(
        contentLanguage: 'en',
        customMetadata: <String, String>{'activity': 'uploading image'},
      ),
    );
    final Uri downloadUrl = (await task.future).downloadUrl;
    setState(() {
      _networkImage = downloadUrl.toString();
    });
  }

  Future<Null> deleteFile() async {
    final StorageReference ref = _storage.ref().child("pool.jpg");
    ref
        .delete()
        .then((res) => print('delete success'))
        .catchError((err) => print(err));
  }

  // Future<FirebaseUser> signInGoogle() async {
  //   GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //   GoogleSignInAuthentication gSA = await googleSignInAccount.authentication
  //       .catchError((err) => print(err));

  //   FirebaseUser user = await _auth.signInWithGoogle(
  //       idToken: gSA.idToken, accessToken: gSA.accessToken);

  //   print("User Name : ${user.displayName}");
  //   setState(() {
  //     isLoggedIn = true;
  //   });
  //   return user;
  // }

  void signOutGoogle() {
    googleSignIn.signOut();
    deleteAuthAccount();
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        //firebase_auth
        print(facebookLoginResult.accessToken.token);
        print(facebookLoginResult.accessToken.userId);
        // _auth
        //     .signInWithFacebook(
        //         accessToken: facebookLoginResult.accessToken.token)
        //     .then((user) => print(user))
        //     .catchError((err) => print(err));
        break;
    }
  }

  deleteAuthAccount() {
    // _auth.currentUser().then((user) {
    //   user.delete();
    //   setState(() {
    //     isLoggedIn = false;
    //   });
    // }).catchError((err) => print(err));
  }

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload image")),
      body: Column(
        children: <Widget>[
          Center(
            child: isLoggedIn
                ? RaisedButton(
                    child: Text("Logout Facebook"),
                    onPressed: () => deleteAuthAccount(),
                  )
                : RaisedButton(
                    child: Text("Login with Facebook"),
                    onPressed: () => initiateFacebookLogin(),
                  ),
          ),
          Container(
            child: RaisedButton(
              child: Text("Choose image"),
              onPressed: getImageFromLocal,
            ),
          ),
          _networkImage != "" ? Image.network(_networkImage) : Text("no image"),
          Center(
            child: isLoggedIn
                ? RaisedButton(
                    child: Text("Sign out Google"),
                    onPressed: signOutGoogle,
                  )
                : RaisedButton(
                    child: Text("Sign in with Google"),
                    onPressed: null,
                  ),
          ),
          RaisedButton(
            child: Text("delete file from storage"),
            onPressed: deleteFile,
          ),
          Expanded(
            child: new StreamBuilder(
                stream: Firestore.instance.collection('subjects').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading...');
                  return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    padding: const EdgeInsets.only(top: 10.0),
                    itemExtent: 55.0,
                    itemBuilder: (context, index) =>
                        _buildListItem(context, snapshot.data.documents[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return new ListTile(
      key: new ValueKey(document.documentID),
      title: new Container(
        decoration: new BoxDecoration(
          border: new Border.all(color: const Color(0x80000000)),
          borderRadius: new BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Text(document['name']),
            ),
            new Text(
              document['price'].toString(),
            ),
          ],
        ),
      ),
      onTap: () => Firestore.instance.runTransaction((transaction) async {
            DocumentSnapshot freshSnap =
                await transaction.get(document.reference);
            await transaction
                .update(freshSnap.reference, {'price': freshSnap['price'] + 1});
          }),
    );
  }
}
