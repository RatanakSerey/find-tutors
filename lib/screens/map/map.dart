//packages
import 'package:find_tutors/screens/map/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//widget
import 'package:find_tutors/widgets/index.dart';
//utils
import 'package:find_tutors/utils/index.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CommonAppBar(
            onPress: () => Scaffold.of(context).openDrawer(),
          ),
          RaisedButton(
            child: Text("bottomSheet"),
            onPressed: () {
              CommonBottomSheet(context: context).show();
            },
          ),
          RaisedButton(
            child: Text("snackbar"),
            onPressed: () {
              CommonSnackBar(context: context, content: "HI").show();
            },
          ),
          RaisedButton(
            child: Text("alert dialog"),
            onPressed: () {
              CommonAlertDialog(context: context, actions: [
                FlatButton(
                  textColor: CommonColors.primary,
                  child: Text("Okay"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ]).show();
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
          Expanded(
            child: OrientationBuilder(
              builder: (context, orientation) => _buildList(
                  context,
                  orientation == Orientation.landscape
                      ? Axis.vertical
                      : Axis.horizontal),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose (){
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
