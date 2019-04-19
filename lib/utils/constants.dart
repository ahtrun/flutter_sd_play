class Constants{

  static const ISLOGIN="ISLOGIN";
  static final String INVITE_CODE = "inviteCode";//邀请码
  static final String PHONE_NUMBER = "phoneNumber";
  static final String NICK_NAME = "userName";//昵称，可以修改
  static final String USER_HEADIMG = "headImage";
  static final String ISLOGIN_FIRST = "isLoginFirst";//登录之后首次进入首页标志
  static final String IFBILLVIP = "ifBillVip";//-1 未登录 会员等级 1玩客 2玩主 3金牌玩主 4 钻石玩主
  static String COOKIE = "";



   static const HOST = "http://123.157.216.154:8000/sdapp";//测试环境服务器
//   static const String HOST_SHARE = "https://m.mihui365.com/";//正式环境网页服务器
// 获取素店大学话题列表
  static const String GET_CORE_COLLEGE_LIST = "/core/getCoreCollegeList";
  //素店大学文章列表
  static const String GET_CORE_COLLEGE_DETIAL_LIST = "/core/getCoreCollegeDetailList";

  //登录
  static final String REQ_LOGIN_NEW = "/login";
  //
  static final String GET_USER_INFO = "/user/detail/findUserLeaderDetailById";
  //注册/修改密码短信验证码
  static final String UPDATE_MOBILE_SENDSMS = "/user/sendMoRandmoCode";


}