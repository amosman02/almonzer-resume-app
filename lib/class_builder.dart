import 'package:portfolio/experience.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/projects.dart';
import 'package:portfolio/education.dart';

typedef Constructor<T> = T Function();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<Experience>(() => Experience());
    register<Projects>(() => Projects());
    register<Education>(() => Education());
    register<Contact>(() => Contact());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}
