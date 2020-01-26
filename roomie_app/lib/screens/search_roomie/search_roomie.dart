import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roomie_app/screens/search_roomie/widgets/list_card_rommie.dart';

class SearchRoomieScreen extends StatelessWidget {
  final String _searchboxIcon = 'assets/images/icons/search-tool-symbol.png';
  final String _searchLabel = 'Procure ser roomie';
  final String _addRoomieLabel = 'Adicionar Roomie';
  final String _logoutLabel = 'Deslogar';
  final TextEditingController _roomieSearchFieldController =
      TextEditingController();

  final ValueNotifier<int> _roomieSelected = ValueNotifier<int>(-1);
  final ValueNotifier<bool> _isUserSelected = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: 22.0,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 58.0,
            ),
            Container(
              height: 54.0,
              padding: EdgeInsets.only(
                left: 13.0,
                top: 5.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              child: TextField(
                controller: _roomieSearchFieldController,
                style: Theme.of(context).textTheme.caption,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).primaryColorDark,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: _searchLabel,
                  hintStyle: Theme.of(context).textTheme.caption,
                  suffixIcon: Container(
                    padding: EdgeInsets.only(
                      bottom: 12.0,
                      top: 7.0,
                    ),
                    child: Image.asset(
                      _searchboxIcon,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      8.0,
                    ),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: 0,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 10,
                  itemBuilder: (_context, _index) {
                    //  TODO: List Roomies filtered by _roomieSearchFieldController
                    return ValueListenableBuilder(
                      valueListenable: _roomieSelected,
                      builder: (_buildContext, _indexSelected, _) {
                        return GestureDetector(
                          onTap: () {
                            print(_roomieSelected);
                            if (_roomieSelected.value != _index)
                              _roomieSelected.value = _index;
                            else
                              _roomieSelected.value = -1;

                            _isUserSelected.value = _roomieSelected.value != -1;
                          },
                          child: ListCardRoomie(
                            isSelected: _index == _indexSelected,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 15.0,
            ),
            ValueListenableBuilder(
              valueListenable: _isUserSelected,
              builder: (_buildContext, value, _) {
                return FlatButton(
                  onPressed: value
                      ? () {
                          //  TODO: Add User as a Roomie
                        }
                      : null,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  disabledColor: Theme.of(context).disabledColor,
                  disabledTextColor: Theme.of(context).hintColor,
                  child: Container(
                    height: 54.0,
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        Text(
                          _addRoomieLabel,
                          style: Theme.of(context).textTheme.button,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),
            Container(
              height: 15.0,
            ),
            FlatButton(
              onPressed: () {
                //  TODO: Logout User
              },
              color: Theme.of(context).primaryColorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Container(
                height: 54.0,
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      _logoutLabel,
                      style: Theme.of(context).textTheme.button,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.065,
            ),
          ],
        ),
      ),
    );
  }
}
