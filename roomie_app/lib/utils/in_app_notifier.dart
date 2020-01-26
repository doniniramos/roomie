import 'package:flutter/material.dart';
import 'package:roomie_app/utils/roomie_theme.dart';

class InAppNotifier extends StatelessWidget {
  final String _addRoomieIcon = 'assets/images/icons/add-friend.png';
  final String _addText = 'adicionou você!';
  final String _fakeProfileImage = 'assets/images/mock/profile-image.png';
  final ValueNotifier<bool> isActive;
  final ValueNotifier<String> content;

  InAppNotifier({Key key, this.isActive, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: isActive,
        builder: (_buildContext, _valueIsActive, _) {
          return AnimatedContainer(
            duration: Duration(
              milliseconds: _valueIsActive ? 350 : 1350,
            ),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(
              bottom: _valueIsActive ? 0.0 : MediaQuery.of(context).size.height,
            ),
            height: _valueIsActive ? 150.0 : 0.0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      roomieTheme.hoverColor,
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.05,
                      0.8,
                    ]),
              ),
              padding: EdgeInsets.only(
                top: 30.0,
                left: 22.0,
                right: 22.0,
                bottom: 60.0,
              ),
              child: Container(
                height: 90.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                child: ValueListenableBuilder(
                  valueListenable: content,
                  builder: (_buildContext, _valueContent, _) {
                    return Row(
                      children: <Widget>[
                        Container(
                          width: 13.0,
                        ),
                        ClipOval(
                          child: Image.asset(
                            _fakeProfileImage,
                            width: 42.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          width: 13.0,
                        ),
                        Expanded(
                          child: Text(
                            _valueContent,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        Text(
                          _addText,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Spacer(),
                        Container(
                          child: Image.asset(
                            _addRoomieIcon,
                            width: 30.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          width: 13.0,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
