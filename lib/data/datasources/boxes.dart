import 'package:hive/hive.dart';

import '../models/user/user.dart';

class Boxes
{
  static Box<User>getUser()=>Hive.box<User>('user');
  static Box getTakeFiveBox()=>Hive.box('takeFiveSurvey');
  static Box getRouteBox()=>Hive.box('route');
  static Box getDestinationArrivedRequestBox()=>Hive.box('destinationArrivedRequest');
  //box2
//box3
//...
}