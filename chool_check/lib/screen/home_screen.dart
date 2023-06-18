import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // latitude - 위도, logitude - 경도
  static const LatLng companyLatLng = LatLng(37.5233273, 126.921252);
  static const CameraPosition initialPosition =
      CameraPosition(target: companyLatLng, zoom: 15);

  static const double distance = 100;
  static final Circle withinDistanceCircle = Circle(
      circleId: const CircleId('withinDistanceCircle'),
      center: companyLatLng,
      fillColor: Colors.blue.withOpacity(0.5),
      radius: distance,
      strokeColor: Colors.blue,
      strokeWidth: 1);
  static final Circle notWithinDistanceCircle = Circle(
      circleId: const CircleId('notWithinDistanceCircle'),
      center: companyLatLng,
      fillColor: Colors.red.withOpacity(0.5),
      radius: distance,
      strokeColor: Colors.red,
      strokeWidth: 1);

  static final Circle checkDoneCircle = Circle(
      circleId: const CircleId('checkDoneCircle'),
      center: companyLatLng,
      fillColor: Colors.green.withOpacity(0.5),
      radius: distance,
      strokeColor: Colors.green,
      strokeWidth: 1);
  static const Marker marker =
      Marker(markerId: MarkerId('marker'), position: companyLatLng);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder(
          future: checkPermission(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.data == '위치 권한이 허가되었습니다') {
              return Column(children: [
                _CustomGoogleMap(
                    initialPosition: initialPosition,
                    circle: withinDistanceCircle,
                    marker: marker),
                const _ChoolCheckButton()
              ]);
            }

            return Center(child: Text(snapshot.data));
          }),
    );
  }

  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요.';
    }

    LocationPermission checkedPermission = await Geolocator.checkPermission();
    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }

    if (checkedPermission == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 세팅에서 허가해주세요.';
    }

    return '위치 권한이 허가되었습니다';
  }

  AppBar renderAppBar() {
    return AppBar(
      title: const Center(
        child: Text(
          "오늘도 출근",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;
  final Circle circle;
  final Marker marker;

  const _CustomGoogleMap(
      {required this.initialPosition,
      required this.circle,
      required this.marker,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        circles: {circle},
        markers: {marker},
      ),
    );
  }
}

class _ChoolCheckButton extends StatelessWidget {
  const _ChoolCheckButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Text('출근'));
  }
}
