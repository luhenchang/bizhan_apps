import 'location_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "LocationBeanEntity") {
      return LocationBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}