import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/models/data_model.dart';
import '../../constants/apis.dart';
import '../../services/dio_service.dart';

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
          print(response.data);
          _error = true;
        }
      } catch (e) {
        print(e);
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
