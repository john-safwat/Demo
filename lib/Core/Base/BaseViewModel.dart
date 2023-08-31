import 'package:demo/Core/Base/BaseNavigator.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {

  N? navigator;

}