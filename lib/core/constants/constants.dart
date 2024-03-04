import '../../features/auth/data/models/user_model.dart';

abstract class Constants {
  static UserModel? userModel;
  static const String defaultImage =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
  static const String apiKey =
      'jtJhiwg4axbpXVrZgFCJS1YNW76q70HNfA1ZPozYNJeahK7Bn55oNKUHRb2s';
  static const Map<int, String> countryNames = {
    8: 'England',
    24: 'England',
    27: 'England',
    564: 'Spain',
    570: 'Spain',
    301: 'France',
    307: 'France',
    310: 'France',
    109: 'Germany',
    82: 'Germany',
    384: 'Italy ',
    390: 'Italy ',
    2: 'Europe',
    1326: 'Europe',
    5: 'Europe',
  };
}
