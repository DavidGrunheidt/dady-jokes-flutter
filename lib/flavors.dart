// ignore_for_file: constant_identifier_names
enum Flavor { DEV, QA, STAGING, PROD }

late final Flavor appFlavor;

String get appTitle {
  switch (appFlavor) {
    case Flavor.QA:
      return '[QA]Dady Jokes';
    case Flavor.STAGING:
      return '[Stg]Dady Jokes';
    case Flavor.PROD:
      return 'Dady Jokes';
    case Flavor.DEV:
    default:
      return '[Dev]Dady Jokes';
  }
}

String get baseUrl {
  switch (appFlavor) {
    case Flavor.QA:
    case Flavor.STAGING:
      return 'https://icanhazdadjoke.com';
    case Flavor.PROD:
      return 'https://icanhazdadjoke.com';
    case Flavor.DEV:
      return 'https://icanhazdadjoke.com';
    default:
      return 'https://icanhazdadjoke.com';
  }
}

String get deeplinkProtocol {
  switch (appFlavor) {
    case Flavor.QA:
      return 'dadyjokesappqa';
    case Flavor.STAGING:
      return 'dadyjokesppstg';
    case Flavor.PROD:
      return 'dadyjokesapp';
    default:
      return 'dadyjokesappdev';
  }
}

int get connectTimeout {
  switch (appFlavor) {
    case Flavor.DEV:
      return 20000;
    default:
      return 5000;
  }
}

String get environment {
  switch (appFlavor) {
    case Flavor.PROD:
      return 'prod';
    case Flavor.QA:
    case Flavor.STAGING:
      return 'qa';
    case Flavor.DEV:
    default:
      return 'dev';
  }
}
