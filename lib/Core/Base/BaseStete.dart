import 'package:demo/Core/Base/BaseNavigator.dart';
import 'package:demo/Core/Base/BaseViewModel.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget , VM extends BaseViewModel> extends State<T> implements BaseNavigator {

  VM? viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel!.navigator = this;
  }

  @override
  void dispose() {
    viewModel!.navigator = null;
    viewModel = null;
    super.dispose();
  }

  VM initViewModel();

}