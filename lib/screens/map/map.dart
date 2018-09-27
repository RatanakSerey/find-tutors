//packages
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_tutors/app_state_container.dart';
import 'package:find_tutors/models/language.dart';
import 'package:find_tutors/screens/map/test_sqflite.dart';
import 'package:find_tutors/services/localization/app_translations.dart';
import 'package:find_tutors/utils/alert_dialog.dart';
import 'package:find_tutors/utils/constants.dart';
import 'package:find_tutors/utils/icon_font.dart';
import 'package:find_tutors/utils/snack_bar.dart';
import 'package:find_tutors/widgets/common_appbar.dart';
import 'package:find_tutors/widgets/common_textinput.dart';
import 'package:http/http.dart' as http;
import 'package:find_tutors/screens/map/test.dart';
import 'package:find_tutors/screens/map/upload_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  File _image;
  String _base64;
  String gender = "male";

  final SlidableController slidableController = SlidableController();
  final List<_HomeItem> items = List.generate(
    5,
    (i) => _HomeItem(
          i,
          'Tile n°$i',
          _getSubtitle(i),
          _getAvatarColor(i),
        ),
  );

  Future getImageFromLocal() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print("Selected image =  ${image}");
    List<int> imageBytes = image.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    fetchTesting(base64Image);
  }

  Future fetchTesting(String params) {
    String url = 'http://192.168.0.103:3000/testing/${params}';
    var httpClient = http.Client();
    return httpClient.get(url).then((response) {
      print(response.body);
    });
  }

  handleGenderChange(String val) {
    setState(() {
      gender = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateContainer = AppStateContainer.of(context);
    return Container(
      child: Column(
        children: <Widget>[
          CommonAppBar(
            title: "stateContainer.currentUser.username",
            onPress: () => Scaffold.of(context).openDrawer(),
          ),
          TextInput(
            hasIcon: true,
            hint: "Username",
            iconName: FeatherIcons.smartphone,
            onChanged: (text) => print(text),
          ),
          // RaisedButton(
          //   child: Text("bottomSheet"),
          //   onPressed: () {
          //     CommonBottomSheet(context: context).show();
          //   },
          // ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: languagesList.length,
          //     itemBuilder: (context, index) {
          //       print(languagesList);
          //       return _buildLanguageItem(languagesList[index]);
          //     },
          //   ),
          // ),
          // RaisedButton(
          //   onPressed: changeLocale,
          //   child: Text('change locale'),
          // ),
          // RaisedButton(
          //   child: Text("snackbar"),
          //   onPressed: () {
          //     CommonSnackBar(context: context, content: "HI").show();
          //   },
          // ),
          Text(translate.text("home")),
          RaisedButton(
            child: Text(stateContainer.currentLanguage.code),
            onPressed: () {
              if (stateContainer.currentLanguage.code == "km") {
                stateContainer
                    .setLanguage(Language(name: "English", code: "en"));
              } else {
                stateContainer.setLanguage(Language(name: "Khmer", code: "km"));
              }
            },
          ),
          RaisedButton(
            child: Text("alert dialog"),
            onPressed: () async {
              // const phoneNumber = "093831509";
              // const url = 'tel://${phoneNumber}';
              // if (await canLaunch(url)) {
              //   await launch(url);
              // } else {
              //   throw 'Could not launch $url';
              // }

              // CommonAlertDialog(context: context, actions: [
              //   FlatButton(
              //     textColor: CommonColors.primary,
              //     child: Text("Okay"),
              //     onPressed: () => Navigator.of(context).pop(),
              //   ),
              // ]).show();
            },
          ),
          RaisedButton(
            child: Text("alert dialog yes no"),
            onPressed: () {
              CommonAlertDialog(context: context).showYesNo();
            },
          ),
          RaisedButton(
            child: Text("Test"),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => Test(),
                ),
              );
            },
          ),
          // RaisedButton(
          //   child: Text("Test sqflite"),
          //   onPressed: () {
          //     Navigator.of(context, rootNavigator: true).push(
          //       MaterialPageRoute<bool>(
          //         fullscreenDialog: true,
          //         builder: (BuildContext context) => TestSqflite(),
          //       ),
          //     );
          //   },
          // ),
          // RaisedButton(
          //   child: Text("Upload image"),
          //   onPressed: () {
          //     Navigator.of(context, rootNavigator: true).push(
          //       MaterialPageRoute<bool>(
          //         fullscreenDialog: true,
          //         builder: (BuildContext context) => UploadImg(),
          //       ),
          //     );
          //   },
          // ),
          // Expanded(
          //   child: OrientationBuilder(
          //     builder: (context, orientation) => _buildList(
          //         context,
          //         orientation == Orientation.landscape
          //             ? Axis.vertical
          //             : Axis.horizontal),
          //   ),
          // ),
          // Expanded(
          //   child: Center(
          //     child: CachedNetworkImage(
          //       imageUrl: "https://firebasestorage.googleapis.com/v0/b/find-tutors.appspot.com/o/subjects%2Fcooking.png?alt=media&token=188ab9c2-7126-43dc-a628-872b5c561f94",
          //       placeholder: new CircularProgressIndicator(),
          //       errorWidget: new Icon(Icons.error),
          //     ),
          //   ),
          // ),
          // RaisedButton(
          //   child: Text("Image picker"),
          //   onPressed: () => getImageFromLocal(),
          // )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildList(BuildContext context, Axis direction) {
    return ListView.builder(
      scrollDirection: direction,
      itemBuilder: (context, index) {
        final Axis slidableDirection =
            direction == Axis.horizontal ? Axis.vertical : Axis.horizontal;
        return _getSlidableWithDelegates(context, index, slidableDirection);
      },
      itemCount: items.length,
    );
  }

  Widget _getSlidableWithDelegates(
      BuildContext context, int index, Axis direction) {
    final _HomeItem item = items[index];

    return Slidable.builder(
      key: Key(item.title),
      controller: slidableController,
      direction: direction,
      slideToDismissDelegate: SlideToDismissDrawerDelegate(
        // onWillDismiss: (actionType) {
        //   return showDialog<bool>(
        //           context: context,
        //           builder: (context) {
        //             return new AlertDialog(
        //               title: new Text('Delete'),
        //               content: new Text('Item will be deleted'),
        //               actions: <Widget>[
        //                 new FlatButton(
        //                   child: new Text('Cancel'),
        //                   onPressed: () => Navigator.of(context).pop(false),
        //                 ),
        //                 new FlatButton(
        //                   child: new Text('Ok'),
        //                   onPressed: () => Navigator.of(context).pop(true),
        //                 ),
        //               ],
        //             );
        //           },
        //         );
        // },
        onDismissed: (actionType) {
          _showSnackBar(
              context,
              actionType == SlideActionType.primary
                  ? 'Dismiss Archive'
                  : 'Dimiss Delete');
          setState(() {
            items.removeAt(index);
          });
        },
      ),
      delegate: SlidableBehindDelegate(),
      actionExtentRatio: 0.25,
      child: direction == Axis.horizontal
          ? _buildVerticalListItem(context, index)
          : _buildhorizontalListItem(context, index),
      actionDelegate: SlideActionBuilderDelegate(
          actionCount: 2,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                caption: 'Archive',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.blue.withOpacity(animation.value)
                    : (renderingMode == SlidableRenderingMode.dismiss
                        ? Colors.blue
                        : Colors.green),
                icon: Icons.archive,
                onTap: () => _showSnackBar(context, 'Archive'),
              );
            } else {
              return IconSlideAction(
                caption: 'Share',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.indigo.withOpacity(animation.value)
                    : Colors.indigo,
                icon: Icons.share,
                onTap: () => _showSnackBar(context, 'Share'),
              );
            }
          }),
      secondaryActionDelegate: SlideActionBuilderDelegate(
          actionCount: 2,
          builder: (context, index, animation, renderingMode) {
            if (index == 0) {
              return IconSlideAction(
                caption: 'More',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.grey.shade200.withOpacity(animation.value)
                    : Colors.grey.shade200,
                icon: Icons.more_horiz,
                onTap: () => _showSnackBar(context, 'More'),
                closeOnTap: false,
              );
            } else {
              return IconSlideAction(
                caption: 'Delete',
                color: renderingMode == SlidableRenderingMode.slide
                    ? Colors.red.withOpacity(animation.value)
                    : Colors.red,
                icon: Icons.delete,
                onTap: () => _showSnackBar(context, 'delete'),
              );
            }
          }),
    );
  }

  Widget _buildVerticalListItem(BuildContext context, int index) {
    final _HomeItem item = items[index];
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: item.color,
          child: Text('${item.index}'),
          foregroundColor: Colors.white,
        ),
        title: Text(item.title),
        subtitle: Text(item.subtitle),
      ),
    );
  }

  Widget _buildhorizontalListItem(BuildContext context, int index) {
    final _HomeItem item = items[index];
    return Container(
      color: Colors.white,
      width: 160.0,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: CircleAvatar(
              backgroundColor: item.color,
              child: Text('${item.index}'),
              foregroundColor: Colors.white,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                item.subtitle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Color _getAvatarColor(int index) {
    switch (index % 4) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.indigoAccent;
      default:
        return null;
    }
  }

  static String _getSubtitle(int index) {
    return "sub title";
  }

  void _showSnackBar(BuildContext context, String text) {
    CommonSnackBar(context: context, content: text).show();
  }
}

class _HomeItem {
  const _HomeItem(
    this.index,
    this.title,
    this.subtitle,
    this.color,
  );

  final int index;
  final String title;
  final String subtitle;
  final Color color;
}
