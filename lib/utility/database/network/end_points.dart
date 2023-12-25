
abstract class EndPoint{
  static const String baseUrl = 'https://xstaion2001.000webhostapp.com';
  static const String signInEndPoint = '/auth/login';
  static  const String sendCode = '/auth/send_code';
  static  const String checkCode = '/auth/reset_password';
  static  const String resetPassword = '/auth/reset_password';
  static const String signUpEndPoint = '/auth/register';
  static const String signUpTechnicalEndPoint = '/technicals';
  static const String profileEndPoint = '/auth/profile';
  static const String logOutEndPoint = '/auth/logout';
  static const String changePasswordEndPoint = '/auth/change_password';
  static const String category = '/categories';
  static  String ?getTechnicans(String id) {
    '/categories/${id}/technicals';
  }
  static const String getCategorySelectMenu = '/select_menu/categories';
  static const String posts = '/posts';
  static  String ?applyPost(String id) {
    '/technicals/post/${id}/apply';
  }
  static const String notificationEndPoint = '/notifications';
  static  String ?showPost(String id) {
   '/posts/${id}' ;
  }
  static  String ?search(String id) {
   '/technicals?handle=${id}';
  }
  static  const String verifyEmail = '/auth/verify_email';
  static  const String acceptPostEndPoint = '/technicals/update_applicant_status';
  static  const String rate = '/users/rate';
  static const String allAccepted = '/technicals/all_accepted';


}





