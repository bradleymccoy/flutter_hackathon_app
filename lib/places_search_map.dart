import 'package:google_maps_flutter/google_maps_flutter.dart';

// 1
Completer<GoogleMapController> _controller = Completer();
// 2
static final CameraPosition _myLocation =
CameraPosition(target: LatLng(0, 0),);
