import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'place.dart';

class StubData {
  static const List<Place> places = [
    Place(
      id: '1',
      latLng: LatLng(33.4602588, -86.91860489999999),
      name: '7316 Pine Tree Lane',
      description:
      'estimated pickup time:  ',
      category: PlaceCategory.favorite ,
    ),
    Place(
      id: '2',
      latLng: LatLng(33.4651262,   -86.9180239),
      name: 'Wedgewood Drive and Westmoreland Drive',
      description:
      '',
      category: PlaceCategory.favorite ,
    ),
    Place(
      id: '3',
      latLng: LatLng(33.4625386 ,-86.9233748),
      name: 'Westmoreland Drive and Dogwood Lane',
      description:
      '',
      category: PlaceCategory.favorite ,
    ),
    Place(
      id: '4',
      latLng: LatLng(33.4640802, -86.9230908),
      name: 'Fair Oaks Drive and Earlwood Drive',
      description:
      '',
      category: PlaceCategory.favorite ,
    ),
    Place(
      id: '5',
      latLng: LatLng(33.4654508 ,-86.92690309999999),
      name: '509 Crest Drive',
      description:
      '',
      category: PlaceCategory.favorite ,
    ),
    Place(
      id: '6',
      latLng: LatLng(33.4912583, -86.9082481),
      name: ' FAIRFIELD HIGH PREPARATORY SCHOOL',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '7',
      latLng: LatLng(33.4652177 ,-86.9165925),
      name: '7128 Pine Tree Lane',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '8',
      latLng: LatLng(33.4621511 ,-86.9225976),
      name: '317 Englewood Drive',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '9',
      latLng: LatLng(433.463031 ,-86.9210319),
      name: '7416 Westmoreland Drive',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '10',
      latLng: LatLng(33.4650425, -86.9174697),
      name: '7105 Westmoreland Drive',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '11',
      latLng: LatLng(33.4654508 ,-86.92690309999999),
      name: '509 Crest Drive',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '12',
      latLng: LatLng(33.4663309, -86.9235762),
      name: '318 Hillview Drive',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '13',
      latLng: LatLng(33.4688888 ,-86.9245194),
      name: 'Seminole Circle @ Mt. Pilgrim Baptist Church',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '14',
      latLng: LatLng(33.4701969, -86.9239676),
      name: 'Grasselli Road and Seminole Circle (Apts.  On Seminole Circle)',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '15',
      latLng: LatLng(33.469694 , -86.9205326),
      name: 'Grasselli Road and Ridgewood Ave. (Apts. Office)',
      description:
      '',
      category: PlaceCategory.favorite,
    ),
    Place(
      id: '16',
      latLng: LatLng( 33.4664528,  -86.9347566 ),
      name: '1491 Cambridge BLVD',
      description:'',
      category: PlaceCategory.visited,
    ),
    Place(
      id: '17',
      latLng: LatLng(33.4659675 ,-86.9330077),
      name: ' 1101 Cambridge Circle',
      description:'',
      category: PlaceCategory.visited,
    ),
    Place(
      id: '18',
      latLng: LatLng(33.4685963, -86.9331817),
      name: ' 1420 Cambridge Blvd',
      description:'',
      category: PlaceCategory.visited,
    ),
    Place(
      id: '19',
      latLng: LatLng(33.4685963 , -86.9331817),
      name: '1420 Cambridge Blvd',
      description:"14-01  1 0740  1535",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '20',
      latLng: LatLng(33.4912628,  -86.9104368 ),
      name: 'FAIRFIELD HIGH PREPARATORY SCHOOL',
      description:"14-01  1 0750",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '21',
      latLng: LatLng(33.4536616 , -86.9315461 ),
      name: 'Park Ridge Ave and Westfield Drive',
      description:"14-01  1A  0645  1456 ",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '22',
      latLng: LatLng(33.4526138 , -86.9332041 ),
      name: '929 Westfield Drive',
      description:"14-01  1A  0646  1458  ",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '23',
      latLng: LatLng(33.4551111,  -86.9351215),
      name: '817 Westfield Drive',
      description:"14-01  1A  0647  1500",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '24',
      latLng: LatLng(33.4577531,  -86.93582599999999),
      name: '  619 Westfield Drive',
      description:"14-01  1A  0649  1503",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '25',
      latLng: LatLng(33.4543018,  -86.93833389999999),
      name: '  1000 Hillandale Dr. (Oakland Dr. side)',
      description:"14-01  1A  0651  1505",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '26',
      latLng: LatLng(33.4912583, -86.9082481),
      name: "900 Glen Oaks Drive (Hillandale Dr. Side)",
      description:"14-01  1A  0653  1506 ",
      category: PlaceCategory.visited,
    ),
    Place(
      id  : '27',
      latLng: LatLng(33.4557422  ,-86.93766509999999),
      name: '1000 Glen Oaks Drive',
      description:"14-01  1A  0654  1507",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '28',
      latLng: LatLng(33.455494 ,-86.9367802),
      name: '800 Glen Crest Dr. (Park Ave. side)',
      description:"14-01  1A  0655  1508 ",
      category: PlaceCategory.visited,
    ),
    Place(
      id: '29',
      latLng: LatLng(33.4542869, -86.9331943 ),
      name: '846 Park Ave.',
      description:"14-01  1A  0656  1509 " ,
      category: PlaceCategory.visited,
    ),
    Place(
      id: '30',
      latLng: LatLng(33.4562005 , -86.93140389999999),
      name: '  824 Fairfax Drive',
      description:"14-01  1A  0657  1511 ",
      category: PlaceCategory.visited,
    ),



  ];

}
