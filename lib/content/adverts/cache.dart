import '../cache.dart';
import 'content.dart';

import 'package:start_frontend/firebase/firestore.dart';

class AdvertisementCache extends ContentCache<AdvertisementContent> {
  @override
  AdvertisementContent fromJson(dynamic data) =>
      AdvertisementContent.fromJson(data);

  @override
  void download() => FirestoreApi.download(
        AdvertisementContent.collectionName,
        limit: 10,
        populate: (dynamic data) => populate(
          AdvertisementContent.fromJson(data),
        ),
      );
}
