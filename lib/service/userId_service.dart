import 'package:dio/dio.dart';
import '../config/api.dart';
import '../config/doi_config.dart';
import '../models/AlbumsModel.dart';
import '../models/commentModel.dart';
import '../models/photosModel.dart';
import '../models/postModel.dart';
import 'log_service.dart';

class GetUserPostService {
  static final GetUserPostService _inheritance = GetUserPostService._init();
  static GetUserPostService get inheritance => _inheritance;
  GetUserPostService._init();

  static Future<List<PostModel>?> getUserIdPost(int id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSinglePost + '?userId=${id}');
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<PostModel> userList = [];
        for(var e in (res.data as List)) {
          userList.add(PostModel.fromJson(e));
        }

        return userList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }

  static Future<List<AlbumsModel>?> getUserIdAlbum(int id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSinglUserAlbums + '?userId=${id}');
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<AlbumsModel> userList = [];
        for(var e in (res.data as List)) {
          userList.add(AlbumsModel.fromJson(e));
        }

        return userList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }

  static Future<List<CommentModel>?> getUserIdComment(int id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSingleUserComment + '?postId=${id}');
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<CommentModel> userList = [];
        for(var e in (res.data as List)) {
          userList.add(CommentModel.fromJson(e));
        }

        return userList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }

  static Future<List<PhotosModel>?> getUserIdPhoto(int id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSingleUserPhoto + '?albumId=${id}');
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<PhotosModel> userList = [];
        for(var e in (res.data as List)) {
          userList.add(PhotosModel.fromJson(e));
        }

        return userList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }

}

