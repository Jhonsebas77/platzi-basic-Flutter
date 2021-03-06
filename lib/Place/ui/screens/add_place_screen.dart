import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image_with_flaBtn.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widget/button_purple.dart';
import 'package:platzi_trips_app/widget/gradient_back.dart';
import 'package:platzi_trips_app/widget/text_input.dart';
import 'package:platzi_trips_app/widget/title_header.dart';

// ignore: must_be_immutable
class AddPlaceScreen extends StatefulWidget {
  final File image;
  final _controllerTitleText = TextEditingController();
  final _controllerDescriptionText = TextEditingController();
  final _controllerPlaceText = TextEditingController();
  AddPlaceScreen({Key key, @required this.image});
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(
            height: 300,
          ),
          Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 25, left: 5),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 45,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )),
              Flexible(
                  child: Container(
                width: screenWidth,
                child: TitleHeader(
                  title: 'Add a new place',
                  padding: EdgeInsets.only(top: 45, left: 20, right: 10),
                ),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 20),
                  child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_alt_rounded,
                    width: 350.0,
                    height: 250.0,
                    left: 0,
                    onPressedFabIcon: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextInput(
                    hintText: 'Title',
                    inputType: TextInputType.name,
                    maxLines: 1,
                    controller: widget._controllerTitleText,
                  ),
                ),
                TextInput(
                  hintText: 'Description',
                  inputType: TextInputType.multiline,
                  maxLines: 4,
                  controller: widget._controllerDescriptionText,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TitleInputLocation(
                    hintText: 'Add Location',
                    iconData: Icons.location_on_outlined,
                    controller: widget._controllerPlaceText,
                  ),
                ),
                Container(
                  width: 70,
                  child: ButtonPurple(
                    buttonText: 'Add Place',
                    onPressed: () {
                      userBloc.currentUser.then((FirebaseUser user) async {
                        final String uid = (await userBloc.currentUser).uid;
                        final uploadTask = await userBloc.uploadFile(
                            '$uid/${DateTime.now().toString()}.jpg',
                            widget.image);
                        final taskSnapshot = await uploadTask.onComplete;
                        final imageUrl =
                            await taskSnapshot.ref.getDownloadURL();
                        if (uploadTask == null ||
                            uid == null ||
                            taskSnapshot == null ||
                            imageUrl == null) {
                          print('->BAD<-');
                          return;
                        }
                        userBloc
                            .updatePlaceData(
                          Place(
                              name: widget._controllerTitleText.text,
                              description:
                                  widget._controllerDescriptionText.text,
                              urlImage: imageUrl,
                              likes: 0),
                        )
                            .whenComplete(() {
                          print('-->Place Add<--');
                          Navigator.pop(context);
                        });
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
