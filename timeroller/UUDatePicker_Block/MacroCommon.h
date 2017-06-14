//
//  MacroCommon.h
//  knowZhengzhou
//
//  Created by shuzhenguo on 15/8/5.
//  Copyright (c) 2015年 hongkunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//top高图
#define topHigh   230


#define keyUSER_NICK_NAME @"NickName"
#define keyUSER_INFO_NEWS @"UserInfo"
#define keyUSER_INFO_ARMYCOMMENT @"ArmyCommentInfo"
#define keyUSER_INFO_PICTURE @"PictureInfo"
#define keySESSION @"session"
#define keyHEADICONURL @"headiconUrl"
#define keyUSER_ISWEIBO @"IsWeiBo"
#define keyUSER_ISQQ @"IsQQ"
#define keyUSER_ISWEIXIN @"IsWeiXin"

#define Weibo_AccessToken @"AccessToken"
#define Weibo_id @"_id"
#define picCommentCount @"picCount"
#define imageCommentCount @"imageCount"
#define QQ_AccessToken @"QQAccessToken"
#define QQ_OpenId @"QQ_OpenId"


//微博
#define kWBAppKey  @"2391855958"
#define kWBRedirectURL @"http://english.cri.cn/easyfm/"
//QQ
#define kQQAppkey  @"1101698845"
#define kTencentOpenApiID @""
//微信
#define kWeixinSDKAppKey  @"wxa5b043c18dc5207a"
#define kWeixinSDKDescription @"c6fe74a67ef350b97a9502efb9ea7e3e"
#define WEIBORETURNTHEDATA @"WEIBORETURNTHEDATA"


#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:a]
#define   nihaoTableViewCellLeftSmall   UIColorFromRGBWithAlpha(0Xdc255e, 1.0)

//导航条颜色 及  tableView边的颜色
#define navigationBarTintColor UIColorFromRGBWithAlpha(0x494949, 1.0)

//模块选项颜色  MostColor  相互替换
#define ModuleOptionsColor   UIColorFromRGBWithAlpha(0x5b5c5e, 1.0)




//深
#define smallMostColor  [UIColor colorWithRed:85/255 green:88/255 blue:89/255 alpha:0.7]
#define smallMostColor1  UIColorFromRGBWithAlpha(0x48494A, 1.0)
//69696D
//浅
#define MostColor  UIColorFromRGBWithAlpha(0x595D5E, 1.0)
#define MostColor1  UIColorFromRGBWithAlpha(0x48494A, 0.5)



//深蓝
#define  xDeepBlue  UIColorFromRGBWithAlpha(0x00AFF0, 1.0)
#define  AudioCircleColor  UIColorFromRGBWithAlpha(0x00aeef, 1.0)
#define  AudioCircleProgressColor  UIColorFromRGBWithAlpha(0x02668b, 1.0)



//闹钟透明度
#define alarmClockTransparentColor  [UIColor colorWithRed:85/255 green:88/255 blue:89/255 alpha:0.7]

//转轮
#define playCirclesColor UIColorFromRGBWithAlpha(0xCBCCCD, 1.0)

#define AllProgramsChoose  @"AllProgramsChoose"

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define  IPhone4   [[UIScreen mainScreen] bounds].size.height==480 &&[[UIScreen mainScreen] bounds].size.width==320||[[UIScreen mainScreen] bounds].size.height==320 &&[[UIScreen mainScreen] bounds].size.width==480

#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)480)< DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)568)< DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)667)< DBL_EPSILON)
#define IS_IPHONE_6_Plus (fabs((double)[[UIScreen mainScreen]bounds].size.height-(double)736)< DBL_EPSILON)

#define VERSION [[UIDevice currentDevice].systemVersion doubleValue]
#define grayRGB   [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:0.7]

//缓存路径
#define STORAGE_PATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define ConfFile(x) [STORAGE_PATH stringByAppendingPathComponent:x]

//音频的数据
#define    mediaUrlNSUserDefaults @"mediaUrlNSUserDefaults"
#define    mediaUrlTitleLableNSUserDefaults @"mediaUrlTitleLableNSUserDefaults"


//播出的时间
#define    mediaUrlTimeLableNSUserDefaults @"mediaUrlTimeLableNSUserDefaults"

//现在的时间
#define    mediaUrlNowTheTimeLableNSUserDefaults @"mediaUrlNowTheTimeLableNSUserDefaults"
//分类
#define    mediaUrlCategoryIdNSUserDefaults @"mediaUrlCategoryIdNSUserDefaults"

//收藏
#define  mediaUrlIdStrNSUserDefaults @"mediaUrlIdStrNSUserDefaults"
#define  mediaUrlTypeStrNSUserDefaults @"mediaUrlTypeStrNSUserDefaults"


//刷新底栏
#define  BottomDidHideMenuViewController   @"BottomDidHideMenuViewController"



//更多频道的索引
#define    productsMediaUrlIdex @"productsMediaUrlIdex"

//栏目区分
#define   columnToDistinguishBetween  @"columnToDistinguishBetween"

#define    Bottombarplaystate @"BOTTOMBARPLAYSTATE"



@interface MacroCommon : NSObject
{
    UIActivityIndicatorView *_indicatorView;

}

+ (MacroCommon*) getMacroCommonDataSource;

//+(NSString *)getCurrntNet;

- (UIActivityIndicatorView *)indicatorView;


+(NSString *)stringDateCellTime:(NSString *)timeString;

+(NSString *)stringRadioDateCellTime:(NSString *)timeString;

+(NSString *)dateWithTimeIntervalSinModify:(NSString *)dateStr;
+(UIButton *)RectangularGrayEdge:(UIButton *)button;
//+(NSString *)getCurrntNet;


//验证字符串是不是为空
+ (BOOL) isBlankString:(NSString *)string ;

+ (NSString *)decodeFromPercentEscapeString:(NSString *)input;
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;


@end
