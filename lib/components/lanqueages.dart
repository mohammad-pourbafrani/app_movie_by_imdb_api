import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'search': 'Search',
          'most_popular': 'most popular Movies',
          'see_all': 'See All',
        },
      };
}
