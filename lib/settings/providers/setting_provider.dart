import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/models/content_model.dart';
import '../../constants/apis.dart';
import '../../services/dio_service.dart';
import '../models/credit_model.dart';

class SettingProvider with ChangeNotifier {
  late DioService _dioService;
  ContentModel? _aboutUsModel;
  ContentModel? _termsModel;
  ContentModel? _privacyModel;
  CreditModel? _creditModel;
  bool _aboutUsError = false;
  bool _termsError = false;
  bool _privacyError = false;
  bool _creditError = false;

  SettingProvider() {
    _dioService = DioService();
    _loadData();
  }

  _loadData() async {
    fetchAboutUs(true);
    fetchTerms(true);
    fetchPrivacy(true);
    fetchCredit(true);
  }

  fetchAboutUs(bool isInit) async {
    if (DateTime(2021, 6, 1).isAfter(DateTime.now())) {
      _aboutUsError = false;
      if (!isInit) notifyListeners();
      try {
        Response response = await _dioService.dio.get(ABOUT_US);
        if (response.statusCode == 200) {
          _aboutUsModel = ContentModel.fromJson(
            jsonDecode(jsonEncode(response.data)),
          );
        } else {
          _aboutUsError = true;
        }
      } catch (e) {
        _aboutUsError = true;
      }
      if (!isInit) notifyListeners();
    }
  }

  fetchTerms(bool isInit) async {
    if (DateTime(2021, 6, 1).isAfter(DateTime.now())) {
      _termsError = false;
      if (!isInit) notifyListeners();
      try {
        Response response = await _dioService.dio.get(TERMS);
        if (response.statusCode == 200) {
          _termsModel = ContentModel.fromJson(
            jsonDecode(jsonEncode(response.data)),
          );
        } else {
          _termsError = true;
        }
      } catch (e) {
        _termsError = true;
      }
      if (!isInit) notifyListeners();
    }
  }

  fetchPrivacy(bool isInit) async {
    if (DateTime(2021, 6, 1).isAfter(DateTime.now())) {
      _privacyError = false;
      if (!isInit) notifyListeners();
      try {
        Response response = await _dioService.dio.get(PRIVACY_POLICY);
        if (response.statusCode == 200) {
          _privacyModel = ContentModel.fromJson(
            jsonDecode(jsonEncode(response.data)),
          );
        } else {
          _privacyError = true;
        }
      } catch (e) {
        _privacyError = true;
      }
      if (!isInit) notifyListeners();
    }
  }

  fetchCredit(bool isInit) async {
    if (DateTime(2021, 6, 1).isAfter(DateTime.now())) {
      _creditError = false;
      if (!isInit) notifyListeners();
      try {
        Response response = await _dioService.dio.get(CREDIT);
        if (response.statusCode == 200) {
          _creditModel = CreditModel.fromJson(
            jsonDecode('{"data":${jsonEncode(response.data)}}'),
          );
        } else {
          _creditError = true;
        }
      } catch (e) {
        _creditError = true;
      }
      if (!isInit) notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Getters
  ContentModel? get aboutUs => _aboutUsModel;
  ContentModel? get terms => _termsModel;
  ContentModel? get privacy => _privacyModel;
  CreditModel? get credit => _creditModel;
  bool get aboutUsError => _aboutUsError;
  bool get termsError => _termsError;
  bool get privacyError => _privacyError;
  bool get creditError => _creditError;
}
