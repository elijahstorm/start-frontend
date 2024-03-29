import 'package:start_frontend/content/content.dart';
import 'package:start_frontend/content/teams/content.dart';
import 'package:start_frontend/firebase/auth.dart';
import 'package:start_frontend/content/notifications/content.dart';
import 'package:start_frontend/content/todo/content.dart';
import 'package:start_frontend/content/users/content.dart';

class NotificationsApi {
  static NotificationHandler instance = NotificationHandler();

  static void send({
    required ContentContainer? to,
    required NotificationContent noto,
  }) async {
    if (AuthApi.activeUser == null || to == null) return;

    UserContent? from = await UserContent.fromId(AuthApi.activeUser!);

    if (from == null || to == from) return;

    noto.sourceId = to.id;

    if (to.collection == TeamContent.collectionName) {
      noto.isTeam = true;
    }

    instance.desynch(noto);

    noto.upload();
  }
}

class NotificationHandler {
  Map<NotificationContent, bool> active = {};
  Map<TodoContent, NotificationContent> synchedFromContent = {};

  void add({
    required NotificationContent noto,
    required ContentContainer? to,
  }) async {
    active[noto] = true;

    await Future.delayed(const Duration(seconds: 5));

    if (active[noto] ?? false) {
      NotificationsApi.send(
        to: to,
        noto: noto,
      );
    } else {
      active.remove(noto);
    }
  }

  void remove(NotificationContent noto) {
    active[noto] = false;
  }

  Future<NotificationContent?> todoLiked(TodoContent todo) async {
    if (AuthApi.activeUser == null) return null;

    if (synchedFromContent[todo] != null) return synchedFromContent[todo]!;

    var team = await TeamContent.fromId(todo.sourceId);
    var user = await UserContent.fromId(AuthApi.activeUser);

    synchedFromContent[todo] = NotificationContent(
      title:
          '${user == null ? 'someone' : user.title} liked that ${todo.title} is done',
      caption: team == null ? '' : team.title,
      date: DateTime.now(),
      type: NotificationContent.todoLikedType,
      status: NotificationContent.unreadStatus,
      id: DateTime.now().toString(),
      fromId: AuthApi.activeUser!,
    );

    return synchedFromContent[todo]!;
  }

  Future<NotificationContent?> todoComplete(TodoContent todo) async {
    if (AuthApi.activeUser == null) return null;

    if (synchedFromContent[todo] != null) return synchedFromContent[todo]!;

    var team = await TeamContent.fromId(todo.sourceId);
    var user = await UserContent.fromId(AuthApi.activeUser);

    synchedFromContent[todo] = NotificationContent(
      title: '${user == null ? 'someone' : user.title} completed ${todo.title}',
      caption: team == null ? '' : team.title,
      date: DateTime.now(),
      type: NotificationContent.todoCompleteType,
      status: NotificationContent.unreadStatus,
      id: DateTime.now().toString(),
      fromId: AuthApi.activeUser!,
    );

    return synchedFromContent[todo]!;
  }

  void desynch(NotificationContent noto) {
    synchedFromContent.removeWhere((key, value) => value == noto);
  }
}
