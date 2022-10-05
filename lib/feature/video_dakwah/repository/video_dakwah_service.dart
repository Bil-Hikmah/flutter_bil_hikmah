import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/common/endpoint/app_endpoint.dart';
import 'package:flutter_bil_hikmah/common/misc/injection.dart';
import 'package:flutter_bil_hikmah/common/network/http_client.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_genre_response.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_item.dart';

abstract class VideoDakwahService {
  Future<List<VideoTypesData>> getVideoGenre();
  Future<List<VideoItemData>> onGetVideoItem(int? idTypeVideo);
}

class VideoDakwahServiceImpl implements VideoDakwahService {
  final HttpClient _httpClient;
  final AppEndpoint _appEndpoint;

  VideoDakwahServiceImpl(this._httpClient, this._appEndpoint);

  @override
  Future<List<VideoTypesData>> getVideoGenre() async {
    try {
      final url = _appEndpoint.getVideoGenre();
      final response = await _httpClient.get(url, {});
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return VideoTypes.fromJson(response.body).data;
    } on AppException {
      rethrow;
    }
  }

  @override
  Future<List<VideoItemData>> onGetVideoItem(int? idTypeVideo) async {
    try {
      final url = _appEndpoint.getVideo(idTypeVideo);
      final response = await _httpClient.get(url, {});
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return VideoItem.fromJson(response.body).data;
    } on AppException {
      rethrow;
    }
  }

  factory VideoDakwahServiceImpl.create() {
    return VideoDakwahServiceImpl(
      Injection.httpClient,
      Injection.endpoint,
    );
  }
}
