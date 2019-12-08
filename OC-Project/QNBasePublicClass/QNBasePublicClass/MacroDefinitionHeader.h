//
//  MacroDefinitionHeader.h
//  FEBasePublicClass
//
//  Created by fetechios1 on 2017/9/19.
//  Copyright © 2017年 Qifeng. All rights reserved.
//

#ifndef MacroDefinitionHeader_h
#define MacroDefinitionHeader_h

#pragma mark - 相关方法缩写

/*------------ MARK: - 关键字缩写 -------------*/
#define let __auto_type const
#define var __auto_type

/*-----------block 弱引用-------------*/
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self
#define WS_Type(weakType,type)  __weak __typeof(&*type)weakType = type

/*------------AppDelegate 相关代理缩写----------------*/
#define appDelegate ((AppDelegate *) [UIApplication sharedApplication].delegate)
#define rootviewControl ((UINavigationController*)appDelegate.window.rootViewController)
#define WINDOW  [UIApplication sharedApplication].keyWindow

/*------------获取设备UUID----------------*/
#define UUIDStr [[[UIDevice currentDevice] identifierForVendor] UUIDString]
#define UUID_NS [[NSUUID UUID] UUIDString]


/*------------中英文国际化----------------*/
#define LocalString(string) [[InternationalControl bundle] localizedStringForKey:string value:nil table:@"LocalString"]


#pragma mark - 手机 大小 宽高 系统版本 颜色 宏定义

/*-----------获取手机宽高-------------*/

#define SCREENSIZE [UIScreen mainScreen].bounds.size

#define SCREEN_SIZE_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_SIZE_HEIGHT  [UIScreen mainScreen].bounds.size.height

/*-----------获取当前视图位置属性-------------*/
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y
#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

/*-----------获取视图坐标-------------*/
#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

/*-----------屏幕宽高-------------*/

#define iPhone4_Hight 480
#define iPhone5_Hight 568
#define iPhone6_Hight 667
#define iPhone6P_HIGHT 736
#define iphoneX_HIGHT  812

#define iPhone4_Width 320
#define iPhone5_Width 320
#define iPhone6_Width 375
#define iPhone6P_Width 414
#define iPhoneX_Width 375

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)//iphone4
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)//iphone5
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)//iphone6
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)//iphone6p
#define IS_IPHONE_X  (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0) //iphoneX

/*----------- iPhone X 适配 -------------*/
#define iPhone_X  (SCREEN_SIZE_HEIGHT == iphoneX_HIGHT)

#define kNavHight 64    //  顶部导航栏高度
#define iPhoneX_Nav  88.0f

#define iPhoneX_NAV (IS_IPHONE_X?88.0:64.0)
#define iPhoneX_TOP (IS_IPHONE_X?44:20)

/*-----------宽高比 -------------*/
#define SuitHeight (SCREEN_SIZE_HEIGHT/iPhone6P_HIGHT)
#define SuitWidth (SCREEN_SIZE_WIDTH/iPhone6_Width) //计算屏幕比例大小 以6为原型,没被用到

#define FIT_SIZE (SCREEN_SIZE_WIDTH/iPhone5_Width) //  体育测评中用到

/*-------------设置颜色缩写----------------*/
#ifndef COLOR
#define COLOR(r,g,b,al) [UIColor colorWithRed:r/255.0f green:g/255.0 blue:b/255.0 alpha:al]
#endif

// 随机颜色（RGB）
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0f]

/*
 16进制的文字颜色转RGB
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/*-------------判断系统版本 7.0 、8.0---------------*/
#ifndef IOS7_OR_LATER
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending)
#endif

/*-------------当前系统版本---------------*/
#define DEV_C_V [[UIDevice currentDevice].systemVersion doubleValue]


/*------------设置边、圆角----------------*/
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#define View_Border_Radius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:Color]

#pragma mark 字符串拼接

#define STRING_FORMAT(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

#pragma mark -  字符串转换

/*-------------将整型转化成字符串----------------*/
#define GET_STRING_FTOM_INT(num) [NSString stringWithFormat:@"%d",num]
#define GET_STRING_FTOM_Folat(num) [NSString stringWithFormat:@"%f",num]
#define GET_STRING_FTOM_INTGER(num) [NSString stringWithFormat:@"%zd",num]
#define GET_STRING_FTOM_DOUBLE(num) [NSString stringWithFormat:@"%.2lf",num]

/*-------------将字符串或者number类型转化成(int)数值类型----------------*/
#define GET_STRING_NUM_INT(str_or_number) (str_or_number && ( [str_or_number isKindOfClass:[NSNumber class]] || [str_or_number isKindOfClass:[NSString class]] ) ) ? [str_or_number intValue] : 0;

/*-------------将字符串或者number类型转化成(Integer)数值类型----------------*/
#define GET_STRING_NUM_INTEGR(str_or_number) (str_or_number && ( [str_or_number isKindOfClass:[NSNumber class]] || [str_or_number isKindOfClass:[NSString class]] ) ) ? [str_or_number integerValue] : 0;

/*-------------将字符串或者number类型转化成(Float)数值类型----------------*/
#define GET_STRING_NUM_FLOAT(str_or_number) (str_or_number && ( [str_or_number isKindOfClass:[NSNumber class]] || [str_or_number isKindOfClass:[NSString class]] ) ) ? [str_or_number floatValue] : 0;

/*-------------将字符串或者number类型转化成(Double)数值类型----------------*/
#define GET_STRING_NUM_DOUBLE(str_or_number) (str_or_number && ( [str_or_number isKindOfClass:[NSNumber class]] || [str_or_number isKindOfClass:[NSString class]] ) ) ? [str_or_number doubleValue] : 0;

/*-------------判断数组(array)、字符串(String)、字典（dictionary）不为空----------------*/
#define SAFE_ARRAY(array) (array && [array isKindOfClass:[NSArray class]] && array.count>0) ? 1 :0
#define SAFE_STRING(string) (string && [string isKindOfClass:[NSString class]] && ![HHControl isBlankString:string]) ? 1 :0
#define SAFE_DICTIONARY(dictionary) (dictionary && [dictionary isKindOfClass:[NSDictionary class]] && dictionary.count > 0) ? 1:0

/*-------------判断是否为安全字符串------------- */
#define SAFESTRING(textFiled) (textFiled==nil||[textFiled.text isEqualToString:@""])? NO:YES
#define SAFESTRINGS(STR) (STR==nil) ? "":STR

/*------------- 系统提示框缩写 --- 已过期 ----------------*/
#define alert(msg) [[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];


/*------------- G---C----D ----------------*/
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

/*------------- NSUserDefaults 本地轻量级存储／实例化 ----------------*/
#define UserDafaults  [NSUserDefaults standardUserDefaults]

#define UserData(object, key) {[UserDafaults setObject:object forKey:key];[UserDafaults synchronize];}  // 普通存储
#define UserKey(key) [UserDafaults objectForKey:key] // 普通获取


// 序列化 存储
#define UserDataChiver(object, key) {[UserDafaults setObject:[NSKeyedArchiver archivedDataWithRootObject:object]; forKey:key];[UserDafaults synchronize];}
#define UserKeyChiver(key) [NSKeyedUnarchiver unarchiveObjectWithData:[UserDafaults objectForKey:key]] // model数据


/*------------- 单例 ----------------*/
#undef	AS_SINGLETON
#define  AS_SINGLETON( __class ) \
+ (__class * __nonnull)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class * __nonnull)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

/*------------- DEBUG 下 Log 显示 ----------------*/
#ifdef DEBUG
//#define HHLog(...) NSLog(__VA_ARGS__)
#define LRString [NSString stringWithFormat:@"%s",__FILE__].lastPathComponent

//  显示详情分割
#define HHLog(...)  printf("\n\n%s %s %s : %d\n----------------------------------------------------\n\n %s \n\n----------------------------------------------------\n", [LRString UTF8String], __TIME__ , __func__, __LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

//  显示详情无分割 -->   处理量大数据重复显示问题
#define HHNewLog(...) printf("%s --> %s\n", [LRString UTF8String], [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

//  替换系统 打印
#define NSLog(...)  printf("\n\n%s %s %s : %d\n----------------------------------------------------\n\n %s \n\n----------------------------------------------------\n", [LRString UTF8String], __TIME__ , __func__, __LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

#else

#define HHLog(...)
#define HHNewLog(...)

#define NSLog(...) 

#endif

// - ----------------------------------------------


#endif /* MacroDefinitionHeader_h */
