class Serverinfo {
  //localhost for dev
  static String server = 'https://mental-assessment.cyclic.app';
  static String auth = '$server/auth';
  static String login = '$auth/email/login';

  //register
  static String avatar = '$server/avatars';
  static String register = '$user/create';

  //user
  static String user = '$server/users';
  static String userupdate = '$user/update';
  static String userdelete = '$user/delete';

  static String avatarfindOne = '$avatar/findOne';
  static String avatarcreate = '$avatar/create';
  static String avatarupdate = '$avatar/update';

  //news
  static String news = '$server/news';
  static String newsfind = '$news/findAll';

  //vent
  static String vent = '$server/vent';
  static String ventfindemail = '$vent/findOwner';
  static String ventcreate = '$vent/create';
  static String ventupdate = '$vent/update';
  static String ventdelete = '$vent/delete';

  //audio
  static String audio = '$server/audio';
  static String audiofindOwner = '$audio/findOwner';
  static String audiocreate = '$audio/create';
  static String audiodelete = '$audio/delete';

  //storage
  static String storage = '$server/storage';
  static String storageaudio = '$storage/uploadAudio';

  //vent_chocie
  static String ventchoice = '$server/ventchoice';
  static String ventchiocefind = '$ventchoice/findAll';

  //contact
  static String contactAndroid = '$server/contact';
  static String contactfindAll = '$contactAndroid/findAll';
  static String contactupdate = '$contactAndroid/update';

  //assessment
  static String assessmentAndroid = '$server/assessment';
  static String assessmentfindMain = '$assessmentAndroid/findMain';

  //history
  static String historyAndroid = '$server/history';
  static String historyfindOwner = '$historyAndroid/findOwner';
  static String historycreate = '$historyAndroid/create';

  //task
  static String taskAndroid = '$server/task';
  static String taskfindOwner = '$taskAndroid/findOwner';
  static String taskupdate = '$taskAndroid/update';
  static String taskfindOne = '$taskAndroid/findOne';
  static String taskcreate = '$taskAndroid/create';
  static String taskdelete = '$taskAndroid/delete';
}
