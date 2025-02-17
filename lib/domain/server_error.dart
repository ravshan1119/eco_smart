import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:eco_smart/core/colors.dart';
import 'package:eco_smart/screens/common/flash.dart';
import 'package:eco_smart/screens/common/flash/flash.dart';

class ServerError implements Exception {
  String _errorMessage = "";

  ServerError.withError({required DioException error}) {
    _handleError(error);
  }

  _handleError(DioException error) async {
    switch (error.type) {
      case DioExceptionType.sendTimeout:
        _errorMessage = "Connection timeout";
        flash(_errorMessage, kPrimaryGrey100Color,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Connection timeout";
        flash(_errorMessage, kPrimaryGrey100Color,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.cancel:
        _errorMessage = "Canceled";
        flash(_errorMessage, kPrimaryGrey100Color,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
        flash(_errorMessage, kPrimaryBlack50Color,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.badResponse:
        try {
          try {
            _errorMessage = error.response?.data['error'];
          } catch (e) {
            _errorMessage = error.response?.data['detail'];
          }
        } catch (e) {
          try {
            _errorMessage = error.response?.data['message'];
          } catch (e) {
            _errorMessage = 'Server bilan xatolik yuz berdi';
          }
        }

        flash(_errorMessage, kPrimaryGrey500Color,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        break;
      case DioExceptionType.unknown:
        _errorMessage = "Something wrong";
        final status = await Connectivity().checkConnectivity();
        if (status == ConnectivityResult.none) {
          _errorMessage = 'Internet aloqasi uzilgan';
        }
        flash(_errorMessage, kPrimaryGrey100Color,
            position: FlashPosition.bottom);
        break;
    }
  }
}
