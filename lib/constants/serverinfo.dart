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
  static String userdelete = '$userAndroid/delete';

  static String avatarfindOne = '$avatarAndroid/findOne';
  static String avatarcreate = '$avatarAndroid/create';
  static String avatarupdate = '$avatarAndroid/update';

  //news
  static String newsAndroid = '$serverAndroid/news';
  static String newsfind = '$newsAndroid/findAll';

  //vent
  static String ventAndroid = '$serverAndroid/vent';
  static String ventfindemail = '$ventAndroid/findOwner';
  static String ventcreate = '$ventAndroid/create';
  static String ventupdate = '$ventAndroid/update';
  static String ventdelete = '$ventAndroid/delete';

  //audio
  static String audioAndroid = '$serverAndroid/audio';
  static String audiofindOwner = '$audioAndroid/findOwner';
  static String audiocreate = '$audioAndroid/create';
  static String audiodelete = '$audioAndroid/delete';

  //storage
  static String storageAndroid = '$serverAndroid/storage';
  static String storageaudio = '$storageAndroid/uploadAudio';

  //vent_chocie
  static String ventchoiceAndroid = '$serverAndroid/ventchoice';
  static String ventchiocefind = '$ventchoiceAndroid/findAll';

  //contact
  static String contactAndroid = '$serverAndroid/contact';
  static String contactfindAll = '$contactAndroid/findAll';
  static String contactupdate = '$contactAndroid/update';

  //assessment
  static String assessmentAndroid = '$serverAndroid/assessment';
  static String assessmentfindMain = '$assessmentAndroid/findMain';

  //history
  static String historyAndroid = '$serverAndroid/history';
  static String historyfindOwner = '$historyAndroid/findOwner';
  static String historycreate = '$historyAndroid/create';

  //task
  static String taskAndroid = '$serverAndroid/task';
  static String taskfindOwner = '$taskAndroid/findOwner';
  static String taskupdate = '$taskAndroid/update';
  static String taskfindOne = '$taskAndroid/findOne';
  static String taskcreate = '$taskAndroid/create';
  static String taskdelete = '$taskAndroid/delete';
}
