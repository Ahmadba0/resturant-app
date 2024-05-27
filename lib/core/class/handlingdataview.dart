import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/core/class/statusRequest.dart';
import 'package:restaurant/core/constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            //child : Text("loading"),
            child: Lottie.asset(AppImagesAsset.lottieloading,
                width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                //child: Text("offline failure"),
                child: Lottie.asset(AppImagesAsset.offline,
                    width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    //  child: Text("server failure"),
                    child: Lottie.asset(AppImagesAsset.lottieloading,
                        width: 250, height: 250),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        //child: Text("no data"),
                        child: Lottie.asset(AppImagesAsset.nodata,
                            width: 250, height: 250),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            //child : Text("loading"),
            child: Lottie.asset(AppImagesAsset.lottieloading,
                width: 250, height: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                //child: Text("offline failure"),
                child: Lottie.asset(AppImagesAsset.lottieloading,
                    width: 250, height: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    //  child: Text("server failure"),
                    child: Lottie.asset(AppImagesAsset.lottieloading,
                        width: 250, height: 250),
                  )
                : widget;
  }
}
