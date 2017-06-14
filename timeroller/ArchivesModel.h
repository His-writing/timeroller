//
//  ArchivesModel.h
//  NewHeartRate
//
//  Created by china on 16/5/24.
//  Copyright © 2016年 china. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UUDatePicker.h"
#import "UUDatePicker_DateModel.h"

@interface ArchivesModel : NSObject



{
    UIPickerView *myPickerView;
    
    //日期存储数组
    //年数组
    NSMutableArray *yearArray;
    //月数组
    NSMutableArray *monthArray;
    //天数组
    NSMutableArray *dayArray;
    //小时的数组
    NSMutableArray *hourArray;
    //分钟的数组
    NSMutableArray *minuteArray;
    
    //限制model
    UUDatePicker_DateModel *maxDateModel;
    UUDatePicker_DateModel *minDateModel;
    
    //记录位置
    NSInteger yearIndex;
    NSInteger monthIndex;
    NSInteger dayIndex;
    NSInteger hourIndex;
    NSInteger minuteIndex;
}

+ (ArchivesModel*) getArchivesDataSource;


@property (nonatomic, assign) DateStyle datePickerStyle;

@property (nonatomic, retain) NSDate *ScrollToDate;//滚到指定日期
@property (nonatomic, retain) NSDate *maxLimitDate;//限制最大时间（没有设置默认2049）
@property (nonatomic, retain) NSDate *minLimitDate;//限制最小时间（没有设置默认1970）

-(NSMutableArray *)yearArrayss;
-(NSMutableArray*)monthArrays;
-(NSMutableArray*)dayArrays;
-(NSMutableArray*)hourArrays;
-(NSMutableArray*)minuteArrays;
//年，月，日，石，分索引
-(NSArray*)indexOfTheCurrentTime;
////通过年月求每月天数
- (NSMutableArray *)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month;
//周
- (NSString*)getWeekDayWithYear:(NSString*)year month:(NSString*)month day:(NSString*)day;
//初始化数组
+ (NSMutableArray *)ishaves:(id)mutableArray;
//前一天
-(NSDate *)dayBefore:(NSDate *)date;
//后一天
-(NSDate *)dayAfter:(NSDate *)date;




//周
-(NSDate *)dayWeeks:(NSDate *)date;



//月
-(NSDate *)dayMonth:(NSDate *)date;


//三月
-(NSDate *)dayInMarch:(NSDate *)date;


//半年
-(NSDate *)dayHalfaYear:(NSDate *)date;




//时间转时间戳的方法
+(NSString *)dateWithTimeIntervalSin:(NSString *)dateStr;


+(NSString *)dateWithTimeIntervalSinModify:(NSString *)dateStr;

+(NSString *)dateWithTimeIntervalSinAtThe:(NSString *)dateStr;

+(NSString *)dateWithTimeIntervalSinday:(NSString *)dateStr;

//时间转时间戳的方法月日
+(NSString *)dateWithTimeIntervalSindayMMdd:(NSString *)dateStr;

//月日
+(NSString *)dateFromString:(NSDate*)string;

+(NSString *)dateweFromString:(NSDate*)string;


//时间推移
-(NSString *)dayTime:(NSString *)str;


//月的天数
-(NSInteger)dayMonthCount;
//三月
-(NSInteger)dayInMarchCount;//半年
-(NSInteger )dayHalfaYearCount;
    
+(NSArray *)dateArrayFlashback:(NSMutableArray *)array;

//字符串转date
+(NSDate*) convertDateFromString:(NSString*)uiDate;
+(NSString*)convertDateMMddFromString:(NSString*)uistr;

@end
