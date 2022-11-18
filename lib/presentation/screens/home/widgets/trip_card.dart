import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/trip/trip.dart';
import '../../../../logic/home_cubit/home_cubit.dart';
import '../../trip/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, 4),
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 2)
      ]),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                width: 6.0.w, color: Color.fromRGBO(0, 145, 159, 1.0)),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.driverName ?? '',
                        style: TextStyle(fontSize: 18),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(children: <Widget>[
                        Text(
                          ' رقم :',
                          style: TextStyle(),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '(${trip.tripNumber ?? ''})',
                        ),
                      ]),
                    ],
                  ),
                  Text(
                    '(${trip.tripStatus ?? ''})',
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Icon(
                            Icons.gps_fixed,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'مكان التوصيل:',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            trip.jobsiteName ?? '',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Icon(
                            Icons.wifi,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'تغطية الانترنت:',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            trip.jobsiteHasNetworkCoverage ? 'نعم' : 'لا',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 16.0.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        HomeCubit.get(context).startTrip();
                        final service = FlutterBackgroundService();
                        service.startService();
                        Navigator.pushReplacementNamed(
                            context, TripScreen.routeName);
                      },
                      child: const Text('ابدأ الرحلة'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
