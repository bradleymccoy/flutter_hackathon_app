import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'place.dart';
import 'stub_data.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({
    @required this.place,
    @required this.onChanged,
    Key key,
  })  : assert(place != null),
        assert(onChanged != null),
        super(key: key);

  final Place place;
  final ValueChanged<Place> onChanged;

  @override
  PlaceDetailsState createState() => PlaceDetailsState();
}

class PlaceDetailsState extends State<PlaceDetails> {
  Place _place;
  GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _place = widget.place;
    _nameController.text = _place.name;
    _descriptionController.text = _place.description;
    return super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_place.latLng.toString()),
        position: _place.latLng,
      ));
    });
  }

  Widget _detailsBody() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
      children: <Widget>[
        _NameTextField(
          controller: _nameController,
          onChanged: (value) {
            setState(() {
              _place = _place.copyWith(name: value);
            });
          },
        ),
        _DescriptionTextField(
          controller: _descriptionController,
          onChanged: (value) {
            setState(() {
              _place = _place.copyWith(description: value);
            });
          },
        ),
        _Map(
          center: _place.latLng,
          mapController: _mapController,
          onMapCreated: _onMapCreated,
          markers: _markers,
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_place.name}'),
        backgroundColor: Colors.green[700],
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            child: IconButton(
              icon: const Icon(Icons.save, size: 30.0),
              onPressed: () {
                widget.onChanged(_place);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: _detailsBody(),
      ),
    );
  }
}

class _NameTextField extends StatelessWidget {
  const _NameTextField({
    @required this.controller,
    @required this.onChanged,
    Key key,
  })  : assert(controller != null),
        assert(onChanged != null),
        super(key: key);

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Name',
          labelStyle: TextStyle(fontSize: 18.0),
        ),
        style: const TextStyle(fontSize: 20.0, color: Colors.black87),
        autocorrect: true,
        controller: controller,
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}

class _DescriptionTextField extends StatelessWidget {
  const _DescriptionTextField({
    @required this.controller,
    @required this.onChanged,
    Key key,
  })  : assert(controller != null),
        assert(onChanged != null),
        super(key: key);

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(fontSize: 18.0),
        ),
        style: const TextStyle(fontSize: 20.0, color: Colors.black87),
        maxLines: null,
        autocorrect: true,
        controller: controller,
        onChanged: (value) {
          onChanged(value);
        },
      ),
    );
  }
}

class _Map extends StatelessWidget {
  const _Map({
    @required this.center,
    @required this.mapController,
    @required this.onMapCreated,
    @required this.markers,
    Key key,
  })  : assert(center != null),
        assert(onMapCreated != null),
        super(key: key);

  final LatLng center;
  final GoogleMapController mapController;
  final ArgumentCallback<GoogleMapController> onMapCreated;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      elevation: 4.0,
      child: SizedBox(
        width: 340.0,
        height: 240.0,
        child: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 32.0,
          ),
          markers: markers,
          zoomGesturesEnabled: true,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          scrollGesturesEnabled: false,
        ),
      ),
    );
  }
}

