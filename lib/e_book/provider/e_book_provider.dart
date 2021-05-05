import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geeta_movement/common/models/data_model.dart';
import 'package:geeta_movement/constants/apis.dart';
import 'package:geeta_movement/services/dio_service.dart';

class EBookProvider with ChangeNotifier {
  late DioService _dioService;
  DataModel? _dataModel;
  bool _error = false;

  EBookProvider() {
    _dioService = DioService();
    loadData(true);
  }

  loadData(bool isInit) async {
    if (DateTime(2021, 5, 15).isAfter(DateTime.now())) {
      _error = false;
      if (!isInit) notifyListeners();
      try {
        Response response = await _dioService.dio.get(E_BOOK);
        if (response.statusCode == 200) {
          _dataModel = DataModel.fromJson(
            jsonDecode('{"data":${jsonEncode(response.data)}}'),
          );
        } else {
          _error = true;
        }
      } catch (e) {
        _error = true;
      }
      if (!isInit) notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Getters
  DataModel? get model => _dataModel;
  bool get error => _error;
}