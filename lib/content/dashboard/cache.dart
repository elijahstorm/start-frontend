import '../cache.dart';
import 'content.dart';

import 'package:start_app_frontend/firebase/firestore.dart';
import 'package:start_app_frontend/firebase/auth.dart';

class DashboardCache extends ContentCache<DashboardContent> {
  @override
  DashboardContent fromJson(dynamic data) => DashboardContent.fromJson(data);

  @override
  void download() async => FirestoreApi.download(
        DashboardContent.collectionName,
        limit: 10,
        id: AuthApi.activeUser,
        // id: await AuthApi.active_team,
        populate: (dynamic data) => populate(
          DashboardContent.fromJson(data),
        ),
      );
}
