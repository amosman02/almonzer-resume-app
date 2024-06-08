import 'package:portfolio/screens/experience_screen.dart';
import 'package:portfolio/screens/home_screen.dart';
import 'package:portfolio/contact.dart';
import 'package:portfolio/screens/projects_screen.dart';
import 'package:portfolio/screens/education_screen.dart';

typedef Constructor<T> = T Function();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<HomeScreen>(() => HomeScreen());
    register<ExperienceScreen>(() => ExperienceScreen());
    register<ProjectsScreen>(() => ProjectsScreen());
    register<EducationScreen>(() => EducationScreen());
    register<Contact>(() => Contact());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}
