//
//  Define.h
//  WeChat
//
//  Created by 张帅 on 2017/12/7.
//  Copyright © 2017年 Black. All rights reserved.
//

#ifndef Define_h
#define Define_h

//#define ServiceRoot2 @"https://biz1.huanyouji.com"
#define ServiceRoot @"https://biz.huanyouji.com"
#define ServiceRoot1 @"http://coupon.huanyouji.com"

//文字
#define LS(key) NSLocalizedString(key, nil)

//iOS version
#define OS_VERSION [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] systemVersion]]
#define OS_ISVERSION7 (BOOL)([OS_VERSION substringToIndex:1].integerValue >= 7)
#define OS_ISVERSION8 (BOOL)([OS_VERSION substringToIndex:1].integerValue >= 8)
#define OS_VERSIONEQUAL(ver) (BOOL)([OS_VERSION substringToIndex:1].integerValue == ver)

#define IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define RGBSAME(value)(RGB(value,value,value))
#define WHITE_COLOR ([UIColor whiteColor])
#define BLACK_COLOR ([UIColor blackColor])


#define NAV_HEIGT (IS_IPHONEX ? 88 : 64)

// 尺寸
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define HScale (SCREEN_HEIGHT/667.0)
#define WScale (SCREEN_WIDTH/375.0)
#define HYHeight(value) (HScale*value)
#define HYWidth (value) (WScale*value)
#define FONTSIZE(font) ([UIFont systemFontOfSize:font*WScale])
#define IMAGE_NAME(name) ([UIImage imageNamed:name])
#define PLACE_IMAGE(value) (value ? @"no_netdork" : @"no_data")

#define FONT_14 (FONTSIZE(14))
#define FONT_12 (FONTSIZE(12))


#define HYWeakSelf __weak __typeof(self) wSelf = self
#define HYStrongSelf  __strong typeof(self) sSelf = wSelf

#define SET_USER_DEFAULT(value,key) [[NSUserDefaults standardUserDefaults]setValue:value forKey:key]
#define USER_DEFAULT(key) [[NSUserDefaults standardUserDefaults]valueForKey:key]
#define REMOVE_USER_DEFAULT(key) [[NSUserDefaults standardUserDefaults]removeObjectForKey:key]
#define SYN_USER_DEFAULT [[NSUserDefaults standardUserDefaults]synchronize]
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#define READ_SHOP_SIGN (USER_DEFAULT(SHOP_MONEY_SIGN) != nil ?USER_DEFAULT(SHOP_MONEY_SIGN):@"")
#define READ_USER_NAME (USER_DEFAULT(SHOP_USER_NAME) != nil ?USER_DEFAULT(SHOP_USER_NAME):@"")
#define READ_USER_EMAIL (USER_DEFAULT(SHOP_USER_EMAIL) != nil ?USER_DEFAULT(SHOP_USER_EMAIL):@"")
#define READ_USER_PHONE (USER_DEFAULT(SHOP_USER_PHONE) != nil ?USER_DEFAULT(SHOP_USER_PHONE):@"")
#define READ_BANK_NAME (USER_DEFAULT(SHOP_BANK_NAME) != nil ?USER_DEFAULT(SHOP_BANK_NAME):@"")
#define READ_BANK_NUMBER (USER_DEFAULT(SHOP_BANK_NUMBER) != nil ?USER_DEFAULT(SHOP_BANK_NUMBER):@"")
#define READ_SERVICE_PHONE (USER_DEFAULT(HY_SERVICE_PHONE) != nil ?USER_DEFAULT(HY_SERVICE_PHONE):@"")
#define READ_YM_NUMBER (USER_DEFAULT(YW_OWN_USER) != nil ?USER_DEFAULT(YW_OWN_USER):@"")
#define READ_SEND_EMAIL (USER_DEFAULT(SHOP_GETORDER_EMAIL) != nil ?USER_DEFAULT(SHOP_GETORDER_EMAIL):@"")
#define READ_IS_FIRST (USER_DEFAULT(SHOP_IS_FIRSTLOGIN) != nil ?USER_DEFAULT(SHOP_IS_FIRSTLOGIN):@"")
#define READ_SHOP_CAMERA (USER_DEFAULT(SHOP_CAMERA_OPEN) != nil ?USER_DEFAULT(SHOP_CAMERA_OPEN):@"")

#define READ_USER_MESSAGE(key) (USER_DEFAULT(key) != nil ? USER_DEFAULT(key):@"")

// 是否可以点菜
#define READ_SHOPCAN_DISH (USER_DEFAULT(SHOP_DISH_IDINTIFIER) != nil ?[USER_DEFAULT(SHOP_DISH_IDINTIFIER) boolValue]:NO)
// 是否绑定手机验证
#define READ_IS_BIND_MESSAGE (USER_DEFAULT(SHOP_IS_BINDMESSAGE) != nil ?USER_DEFAULT(SHOP_IS_BINDMESSAGE):@"")

#define READ_ACCOUNT_BALANCE (USER_DEFAULT(SALE_ACCOUNT_BALANCE) != nil ?USER_DEFAULT(SALE_ACCOUNT_BALANCE):@"0")
#define READ_MONTH_INCOME (USER_DEFAULT(SALE_MONTH_INCOME) != nil ?USER_DEFAULT(SALE_MONTH_INCOME):@"0")
#define READ_BANK_MESSAGE (USER_DEFAULT(SHOP_BANK_MESSAGE) != nil ?USER_DEFAULT(SHOP_BANK_MESSAGE):@[@"",@"",@"",@""])
// 字符串宏
#define SHOP_DEVICE_TOKEN @"SHOPDEVICETOKEN"
#define SHOP_MONEY_SIGN @"SHOPMONEYSIGN"
#define SHOP_NO_LOGIN @"商户未登录"
#define REQUEST_SUCCESS @"数据请求成功"
#define SHOP_TRANS_PASS @"订单交易密码"
#define SHOP_CAMERA_OPEN @"App是否有相册权限"

#define SHOP_TRADE_NO_PASS @"商户的交易密码未设置"
#define SHOP_GETORDER_EMAIL @"商户获取订单邮箱"
#define SHOP_COUPON_ENABLE @"商户是否具有卡券功能"

#define SHOP_IS_FIRSTLOGIN @"商户第一次登陆标示"
#define Notification_orderChange @"Notification_OrderChange"
#define SHOP_CAN_DISH @"dish"
#define SHOP_ID @"SHOPID"


//  商店列表
#define SHOP_NAME_LIST @"SHOPNAMELIST"
#define SHOP_USER_EMAIL @"SHOPUSEREMAIL"
#define SHOP_USER_PHONE @"SHOPUSERPHONE"
#define SHOP_USER_NAME @"SHOPUSERNAME"
#define SHOP_BANK_NAME @"SHOPBANKNAME"
#define SHOP_BANK_NUMBER @"SHOPBANKNUMBER"
#define SHOP_BANK_MESSAGE @"SHOPBANKMESSAGE"
#define SHOP_IS_BINDMESSAGE @"商户是否绑定手机短息"
#define SHOP_DISH_IDINTIFIER @"商户是否具有点菜功能"

#define SHOP_CODE @"dp309"
#define MONEY_ADD_UNIT(string) ([NSString stringWithFormat:@"%@%@",READ_SHOP_SIGN,string])

// sale
#define SALE_ACCOUNT_BALANCE @"sale_account_balance"
#define SALE_MONTH_INCOME @"current_month_income"

#define HY_SERVICE_PHONE @"HYSERVICEPHONE" // 环游客服热线
#define REQUEST_TIME 10.0
#define NOT_MORE_TIME 0.5

#define Notification_NeedLogin @"HY_Notification_NeedLogin"
#define Shop_Order_Change @"SHOPORDERCGANGE"
/**
 *  字体
 */
#define LIGHT @"STHeitiSC-Light"
#define GB1_0 @"FZLTHJW--GB1-0"
#define Thonburi @"Thonburi"

#define YW_APP_KEY @"23619450"
#define YW_OWN_PASSWORD @"123456"
//#define YW_USER_SERVICE @"utravel_custom_service"
#define YW_USER_SERVICE @"utravel_custom_service"
#define YW_OWN_USER @"云旺账号"
#define kSPCustomConversationIdForFAQ  @"cnhhupanutravel_custom_service"
#define YW_IS_LOGIN @"云旺是否登录"


// 签约宝
//typedef void (^noParameter)(void);
//typedef void (^actionHandle)(id obj);
//
//#define ServiceRoot @"http://cn.finance.huanyouji.com"
//
//#define LS(key) NSLocalizedString(key, nil)
//#define HYWeakSelf __weak __typeof(self) wSelf = self
//#define HYStrongSelf  __strong typeof(self) sSelf = wSelf
//
//#define SET_USER_DEFAULT(value,key) [[NSUserDefaults standardUserDefaults]setValue:value forKey:key]
//#define USER_DEFAULT(key) [[NSUserDefaults standardUserDefaults]valueForKey:key]
//#define REMOVE_USER_DEFAULT(key) [[NSUserDefaults standardUserDefaults]removeObjectForKey:key]
//#define SYN_USER_DEFAULT [[NSUserDefaults standardUserDefaults]synchronize]
//
//#define READ_SHOP_SIGN(obj) (USER_DEFAULT(obj) != nil ?USER_DEFAULT(obj):@"")
//#define READ_MESSAGE(obj,default) (USER_DEFAULT(obj) != nil ?USER_DEFAULT(obj):(default))
//
//#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//#define RGB(r,g,b) RGBA(r,g,b,1.0f)
//#define RGBSAME(value)(RGB(value,value,value))
//#define WHITE_COLOR ([UIColor whiteColor])
//#define BLACK_COLOR ([UIColor blackColor])
//#define CLEAR_COLOR ([UIColor clearColor])
//
//#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//#define HScale (SCREEN_HEIGHT/667.0)
//#define WScale (SCREEN_WIDTH/375.0)
//#define BDWidth(width) ((width)*(SCREEN_WIDTH/375.0))
//#define BDHeight(height) ((height)*(SCREEN_HEIGHT/667.0))
//
//#define FONTSIZE(font) ([UIFont systemFontOfSize:font*WScale])
//#define IMAGE_NAME(name) ([UIImage imageNamed:name])
//
///**
// *  数据处理
// */
//
//#define BD_ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
//#define BD_ValidArray(f) (f!=nil &&[f isKindOfClass:[NSArray class]])
//#define BD_ValidClass(f,cls) (f!=nil &&[f isKindOfClass:[cls class]])
//
//
//
//#define OS_VERSION [NSString stringWithFormat:@"%@", [[UIDevice currentDevice] systemVersion]]
//#define OS_ISVERSION7 (BOOL)([OS_VERSION substringToIndex:1].integerValue >= 7)
//
//
///**
// *  字体
// */
//#define LIGHT @"STHeitiSC-Light"
//#define GB1_0 @"FZLTHJW--GB1-0"
//#define Thonburi @"Thonburi"
//
//#define REQUEST_TIME 10.0
//#define ErrorInfo_ShowTime 1.5
//#define ERRMSG @"errmsg"
//#define RESULT @"result"
//#define PAGE @"page"
//#define TOTAL_COUNT @"total_count"
//#define LIST @"list"
//#define REQUEST_SUCCESS @"数据请求成功"
//#define NEED_LOGIN @"用户需要登录"
//
//#define Notification_orderChange @"Notification_OrderChange"
//#define Home_ScrollChange @"Notification_ScrollChange"
//
//#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
//#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
///**
// *  文本
// */
//#define AccessToken @"USER_TOKEN"
//#define User_ID @"用户ID数据库标示"
//#define User_Name @"用户姓名"
//
//#define TRIM(string) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]



#endif /* Define_h */
