import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Widget frontPage() {
  Geolocator.checkPermission;

  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      if (index == 0) {
        return searchBar();
      }
      return placeProfile();
    },
    // children: [
    //   searchBar(),
    //   FutureBuilder<Padding>(
    //     future: currentLocation(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return placeProfile();
    //       } else {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     },
    //   ),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    //   placeProfile(),
    // ],
  );
}

Padding placeProfile() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Card(
      child: SizedBox(
        height: 200,
        width: double.infinity,
      ),
    ),
  );
}

const LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.best,
  distanceFilter: 100,
);
Future<Padding> currentLocation() async {
  Position position =
      await Geolocator.getCurrentPosition(locationSettings: locationSettings);

  return Padding(
    padding:
        const EdgeInsets.only(left: 15.0, right: 13.0, top: 10.0, bottom: 6.0),
    child: Row(
      children: [
        const Icon(Icons.location_on),
        const SizedBox(width: 1),
        Text(
          position.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color.fromARGB(255, 6, 6, 6),
          ),
        ),
      ],
    ),
  );
}

Padding searchBar() {
  return Padding(
    padding:
        const EdgeInsets.only(left: 13.0, right: 13.0, top: 6.0, bottom: 6.0),
    child: TextField(
      controller: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      textAlign: TextAlign.start,
      maxLines: 1,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        color: Color(0xff000000),
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        hintText: "Search",
        prefixIcon: const Icon(
          Icons.search,
        ),
      ),
    ),
  );
}
