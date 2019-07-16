class AppConfig {

  static Flavor appFlavor;

  static String _appName = 'Pomelo';

  static String get appName {
    switch (appFlavor) {
      case Flavor.LABS:
        return '${_appName}Labs';
      case Flavor.STAGING:
        return '${_appName}Staging';
      case Flavor.PROD:
        return _appName;
      default:
        return null;
    }
  }

  static String get pomeloApiBaseUrl {
    switch (appFlavor) {
      case Flavor.LABS:
        return 'https://docky-staging-api.pmlo.co/';
      case Flavor.STAGING:
        return 'https://docky-staging-api.pmlo.co/';
      case Flavor.PROD:
        return 'https://api.pomelofashion.com/';
      default:
        return null;
    }
  }

  static String get imgixBaseUrl {
    switch (appFlavor) {
      case Flavor.LABS:
        return 'http://pomelofashion-staging.imgix.net';
      case Flavor.STAGING:
        return 'http://pomelofashion-staging.imgix.net';
      case Flavor.PROD:
        return 'http://pomelofashion.imgix.net';
      default:
        return null;
    }
  }
}

enum Flavor {
  LABS,
  STAGING,
  PROD,
}