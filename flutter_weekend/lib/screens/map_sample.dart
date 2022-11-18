import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// https://api.mapbox.com/styles/v1/ja3far03/clamapeg9002414n7iwvvrw5o/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamEzZmFyMDMiLCJhIjoiY2w3N3VtemlyMDJiajNxbzgzZXE4cTM1dSJ9.ItrD0mLRn-IDiywvQyLO1w

class MapSample extends StatefulWidget {
  const MapSample({super.key});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}


// const Campground = require("../models/campground");
// const mbxGeocoding = require("@mapbox/mapbox-sdk/services/geocoding")
// const mapboxToken = process.env.MAPBOX_TOKEN;
// const geocoder = mbxGeocoding({ accessToken: mapboxToken });
// const { cloudinary } = require("../cloudinary");

// module.exports.index = async (req, res) => {
//     const camps = await Campground.find();
//     res.render("campgrounds/index", { camps })
// }

// module.exports.new = (req, res) => {
//     res.render("campgrounds/new")
// }

// module.exports.createCamp = async (req, res, next) => {
//     const geoData = await geocoder.forwardGeocode({
//         query: req.body.campground.location,
//         limit: 1
//     }).send();
//     const camp = new Campground(req.body.campground);
//     camp.geometry = geoData.body.features[0].geometry;
//     camp.images = req.files.map(file => ({ url: file.path, filename: file.filename }));
//     camp.author = req.user._id;
//     await camp.save();
//     req.flash("success", "Successfully Added The Camp");
//     res.redirect(`campgrounds/${camp._id}`);
// }

// module.exports.showCamp = async (req, res, next) => {
//     const camp = await Campground.findById(req.params.id).populate({
//         path: "reviews",
//         populate: "author",
//     }).populate("author");
//     if (!camp) {
//         req.flash("error", "Cannot Find That Campground");
//         return res.redirect("/campgrounds")
//     }
//     res.render("campgrounds/show", { camp })
// }

// module.exports.deleteCamp = async (req, res, next) => {
//     const deleted = await Campground.findByIdAndDelete(req.params.id);
//     req.flash("success", "Successfully Deleted The Camp");
//     res.redirect("/campgrounds");
// }
// module.exports.edit = async (req, res, next) => {
//     const camp = await Campground.findById(req.params.id);

//     if (!camp) {
//         req.flash("error", "Cannot Find That Campground");
//         return res.redirect("/campgrounds")
//     }
//     res.render("campgrounds/edit", { camp })
// }
// module.exports.update = async (req, res, next) => {
//     if (!req.body.campground) throw new AppError("Invalid Data", 400);
//     const { id } = req.params;
//     console.log(req.body);
//     const camp = await Campground.findByIdAndUpdate(id, req.body.campground, { runValidators: true });
//     const imgs = req.files.map(file => ({ url: file.path, filename: file.filename }));
//     camp.images.push(...imgs);
//     await camp.save();

//     if (req.body.deleteImages.length) {
//         for (let filename of req.body.deleteImages) {
//             await cloudinary.uploader.destroy(filename);
//         }
//         await camp.updateOne({ $pull: { images: { filename: { $in: req.body.deleteImages } } } });
//     }
//     req.flash("success", "Successfully Updated The Camp");
//     res.redirect(`/campgrounds/${id}`);
// }