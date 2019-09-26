import 'package:flutter/material.dart';

import 'place.dart';
import 'place_details.dart';
import 'place_tracker_app.dart';

class PlaceList extends StatefulWidget {
  const PlaceList({Key key}) : super(key: key);

  @override
  PlaceListState createState() => PlaceListState();
}

class PlaceListState extends State<PlaceList> {
  ScrollController _scrollController = ScrollController();

  void _onCategoryChanged(PlaceCategory newCategory) {
    _scrollController.jumpTo(0.0);
    AppState.updateWith(context, selectedCategory: newCategory);
  }

  void _onPlaceChanged(Place value) {
    // Replace the place with the modified version.
    final newPlaces = List<Place>.from(AppState.of(context).places);
    final index = newPlaces.indexWhere((place) => place.id == value.id);
    newPlaces[index] = value;

    AppState.updateWith(context, places: newPlaces);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _ListCategoryButtonBar(
          selectedCategory: AppState.of(context).selectedCategory,
          onCategoryChanged: (value) => _onCategoryChanged(value),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            controller: _scrollController,
            shrinkWrap: true,
            children: AppState.of(context)
                .places
                .where((place) =>
                    place.category == AppState.of(context).selectedCategory)
                .map((place) => _PlaceListTile(
                      place: place,
                      onPlaceChanged: (value) => _onPlaceChanged(value),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _PlaceListTile extends StatelessWidget {
  const _PlaceListTile({
    Key key,
    @required this.place,
    @required this.onPlaceChanged,
  })  : assert(place != null),
        assert(onPlaceChanged != null),
        super(key: key);

  final Place place;
  final ValueChanged<Place> onPlaceChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push<void>(
        context,
        MaterialPageRoute(builder: (context) {
          return PlaceDetails(
            place: place,
            onChanged: (value) => onPlaceChanged(value),
          );
        }),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              place.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              maxLines: 3,
            ),
            Text(
              place.description != null ? place.description : '',
              style: Theme.of(context).textTheme.subhead,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 16.0),
            Divider(
              height: 2.0,
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}

class _ListCategoryButtonBar extends StatelessWidget {
  const _ListCategoryButtonBar({
    Key key,
    @required this.selectedCategory,
    @required this.onCategoryChanged,
  })  : assert(selectedCategory != null),
        assert(onCategoryChanged != null),
        super(key: key);

  final PlaceCategory selectedCategory;
  final ValueChanged<PlaceCategory> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _CategoryButton(
          category: PlaceCategory.favorite,
          selected: selectedCategory == PlaceCategory.favorite,
          onCategoryChanged: onCategoryChanged,
        ),
        _CategoryButton(
          category: PlaceCategory.visited,
          selected: selectedCategory == PlaceCategory.visited,
          onCategoryChanged: onCategoryChanged,
        ),
        _CategoryButton(
          category: PlaceCategory.wantToGo,
          selected: selectedCategory == PlaceCategory.wantToGo,
          onCategoryChanged: onCategoryChanged,
        ),
      ],
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key key,
    @required this.category,
    @required this.selected,
    @required this.onCategoryChanged,
  })  : assert(category != null),
        assert(selected != null),
        super(key: key);

  final PlaceCategory category;
  final bool selected;
  final ValueChanged<PlaceCategory> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    String _buttonText;
    switch (category) {
      case PlaceCategory.favorite:
        _buttonText = 'Route1';
        break;
      case PlaceCategory.visited:
        _buttonText = 'Route2';
        break;
      case PlaceCategory.wantToGo:
        _buttonText = 'Route3';
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selected ? Colors.blue : Colors.transparent,
          ),
        ),
      ),
      child: ButtonTheme(
        height: 50.0,
        child: FlatButton(
          child: Text(
            _buttonText,
            style: TextStyle(
              fontSize: selected ? 20.0 : 18.0,
              color: selected ? Colors.blue : Colors.black87,
            ),
          ),
          onPressed: () => onCategoryChanged(category),
        ),
      ),
    );
  }
}
