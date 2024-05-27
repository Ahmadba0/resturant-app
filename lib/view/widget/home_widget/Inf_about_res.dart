import 'package:flutter/material.dart';
import 'package:restaurant/core/constant/color.dart';
import 'package:restaurant/view/screen/add_restaurant.dart';

class InfAboutRes extends StatelessWidget {
  final String src;
  final valueOfStar;
  final String textName;
  final String textLoaction;
  const InfAboutRes(
      {super.key,
      required this.src,
      this.valueOfStar,
      required this.textName,
      required this.textLoaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //"${linkApi.linkImage}/${controller.detailsdata[index]['policeReport_image']}"
        Image.network(
            src /* "${AppLink.imagestatic}/${controller.allres[index]['res_image']}"*/),
        const SizedBox(height: 15),
        stars(value: valueOfStar /*controller.allres[index]['res_rating']*/),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "name: ",
                style: TextStyle(
                    color: AppColor.mygrey, fontSize: 15, letterSpacing: 1.5),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  /*"${controller.allres[index]['res_name']}",*/
                  textName,
                  style: const TextStyle(
                      color: AppColor.myprimarycolor2, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "location: ",
                style: TextStyle(color: AppColor.mygrey, fontSize: 15),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  /* "${controller.allres[index]['res_location']}",*/
                  textLoaction,
                  style: const TextStyle(
                      color: AppColor.myprimarycolor2, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
