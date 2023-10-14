class Serverinfo {
  //localhost for dev
  static String server = 'http://127.0.0.1:3000';
  static String auth = '$server/auth';
  static String login = '$auth/email/login';

  static String serverAndroid = 'http://10.0.2.2:3000';
  static String authAndroid = '$serverAndroid/auth';
  static String loginAndroid = '$authAndroid/email/login';
}
