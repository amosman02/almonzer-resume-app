import 'package:portfolio/profile.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/schedules.dart';
import 'package:portfolio/settings.dart';
import 'package:portfolio/notifications.dart';
import 'package:portfolio/stats.dart';

typedef Constructor<T> = T Function();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Profile>(() => Profile());
    register<Notifications>(() => Notifications());
    register<Stats>(() => Stats());
    register<Schedules>(() => Schedules());
    register<Settings>(() => Settings());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}
