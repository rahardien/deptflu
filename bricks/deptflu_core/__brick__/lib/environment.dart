enum EnvironmentFlavor {
  dev(
    title: "DEV",
    appName: "{{name.titleCase()}} Dev",
  ),
  staging(
    title: "STAGING",
    appName: "{{name.titleCase()}} Staging",
  ),
  prod(
    title: "PROD",
    appName: "{{name.titleCase()}} Prod",
  );

  final String title;
  final String appName;

  const EnvironmentFlavor({
    required this.title,
    required this.appName,
  });
}

class Environment {
  static EnvironmentFlavor _flavor = EnvironmentFlavor.dev;

  static EnvironmentFlavor get flavor => _flavor;

  static void setFlavor(EnvironmentFlavor value) => _flavor = value;

  static String get appName => _flavor.name;

  /// Change [appBaseUrl] with your actual base url for API Integration
  static String get appBaseUrl {
    switch (_flavor) {
      case EnvironmentFlavor.dev:
        return "https://dev.baseurl.com/api/v1";
      case EnvironmentFlavor.staging:
        return "https://staging.baseurl.com/api/v1";
      case EnvironmentFlavor.prod:
        return "https://baseurl.com/api/v1";
      default:
        return "https://dev.baseurl.com/api/v1";
    }
  }
}
