class Serverinfo {
  //localhost for dev
  static String server = 'http://127.0.0.1:3000';
  static String auth = '$server/auth';
  static String login = '$auth/email/login';

  static String serverAndroid = 'http://10.0.2.2:3000';
  static String authAndroid = '$serverAndroid/auth';
  static String loginAndroid = '$authAndroid/email/login';

  //register
  static String avatarAndroid = '$serverAndroid/avatars';
  static String registeAndroid = '$userAndroid/create';

  //user
  static String userAndroid = '$serverAndroid/users';
  static String userupdate = '$userAndroid/update';

  static String avatarfindOne = '$avatarAndroid/findOne';
  static String avatarcreate = '$avatarAndroid/create';

  //news
  static String newsAndroid = '$serverAndroid/news';
  static String newsfind = '$newsAndroid/findAll';

  //vent
  static String ventAndroid = '$serverAndroid/vent';
  static String ventfindemail = '$ventAndroid/findOwner';

  //vent_chocie
  static String ventchoiceAndroid = '$serverAndroid/ventchoice';
  static String ventchiocefind = '$ventchoiceAndroid/findAll';
}
