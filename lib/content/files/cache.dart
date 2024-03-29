import '../cache.dart';
import 'content.dart';

import 'package:start_frontend/firebase/firestore.dart';
import 'package:start_frontend/firebase/auth.dart';

class FileCache extends ContentCache<FileContent> {
  @override
  FileContent fromJson(dynamic data) => FileContent.fromJson(data);

  FileCache.search(String searchTerms) {
    filters = [FirestoreFilter.search(searchTerms)];
    download();
  }

  @override
  void download() async => FirestoreApi.download(
        FileContent.collectionName,
        limit: 10,
        filters: filters,
        id: AuthApi.activeUser,
        // id: await AuthApi.active_team,
        populate: (dynamic data) => populate(
          FileContent.fromJson(data),
        ),
      );
}
