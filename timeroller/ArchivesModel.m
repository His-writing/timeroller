//
//  ArchivesModel.m
//  NewHeartRate
//
//  Created by china on 16/5/24.
//  Copyright © 2016年 china. All rights reserved.
//
#define UUPICKER_MAXDATE 2050
#define UUPICKER_MINDATE 1970

#define UUPICKER_MONTH 12
#define UUPICKER_HOUR 24
#define UUPICKER_MINUTE 60

#define UU_GRAY [UIColor redColor];
#define UU_BLACK [UIColor blackColor];

#ifndef isIOS7
#define isIOS7  ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
#endif


#import "ArchivesModel.h"
ArchivesModel* s_archivesModel = nil;

@implementation ArchivesModel


+ (ArchivesModel*) getArchivesDataSource{


    if (nil == s_archivesModel)
    {
        s_archivesModel = [[ArchivesModel alloc] init];
    }
    return s_archivesModel;


}


+ (NSMutableArray *)ishaves:(id)mutableArray
{
    if (mutableArray)
        [mutableArray removeAllObjects];
    else
        mutableArray = [NSMutableArray array];
    return mutableArray;
}


//根据string返回date
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}


//年
-(NSMutableArray *)yearArrayss{

    yearArray   = [ArchivesModel ishaves:yearArray];
    monthArray  = [ArchivesModel ishaves:monthArray];
    dayArray    = [ArchivesModel ishaves:dayArray];
    hourArray   = [ArchivesModel ishaves:hourArray];
    minuteArray = [ArchivesModel ishaves:minuteArray];

    //赋值
    for (int i=0; i<UUPICKER_MINUTE; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d",i];
        if (0<i && i<=UUPICKER_MONTH)
            [monthArray addObject:num];
        if (i<UUPICKER_HOUR)
            [hourArray addObject:num];
        [minuteArray addObject:num];
    }
    for (int i=UUPICKER_MINDATE; i<UUPICKER_MAXDATE; i++) {
        NSString *num = [NSString stringWithFormat:@"%d",i];
        [yearArray addObject:num];
    }
    
    //最大最小限制
    if (self.maxLimitDate) {
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }else{
        self.maxLimitDate = [ArchivesModel dateFromString:@"204912312359" withFormat:@"yyyyMMddHHmm"];
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }
    //最小限制
    if (self.minLimitDate) {
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }else{
        self.minLimitDate = [ArchivesModel dateFromString:@"197001010000" withFormat:@"yyyyMMddHHmm"];
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }
    

    return yearArray;

}

//获取月
-(NSMutableArray*)monthArrays{
    
    yearArray   = [ArchivesModel ishaves:yearArray];
    monthArray  = [ArchivesModel ishaves:monthArray];
    dayArray    = [ArchivesModel ishaves:dayArray];
    hourArray   = [ArchivesModel ishaves:hourArray];
    minuteArray = [ArchivesModel ishaves:minuteArray];
    
    //赋值
    for (int i=0; i<UUPICKER_MINUTE; i++) {
//        NSString *num = [NSString stringWithFormat:@"%02d",i];
        
        NSString *num = [NSString stringWithFormat:@"%d",i];

        if (0<i && i<=UUPICKER_MONTH)
            [monthArray addObject:num];
        if (i<UUPICKER_HOUR)
            [hourArray addObject:num];
        [minuteArray addObject:num];
    }
    for (int i=UUPICKER_MINDATE; i<UUPICKER_MAXDATE; i++) {
        NSString *num = [NSString stringWithFormat:@"%d",i];
        [yearArray addObject:num];
    }
    //最大最小限制
    if (self.maxLimitDate) {
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }else{
        self.maxLimitDate = [ArchivesModel dateFromString:@"204912312359" withFormat:@"yyyyMMddHHmm"];
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }
    //最小限制
    if (self.minLimitDate) {
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }else{
        self.minLimitDate = [ArchivesModel dateFromString:@"197001010000" withFormat:@"yyyyMMddHHmm"];
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }
    
    //获取当前日期，储存当前时间位置
//    NSArray *indexArray = [self getNowDate:self.ScrollToDate];

    
    return monthArray;
}


//获取日
-(NSMutableArray*)dayArrays{
    
    yearArray   = [ArchivesModel ishaves:yearArray];
    monthArray  = [ArchivesModel ishaves:monthArray];
    dayArray    = [ArchivesModel ishaves:dayArray];
    hourArray   = [ArchivesModel ishaves:hourArray];
    minuteArray = [ArchivesModel ishaves:minuteArray];
    
    //赋值
    for (int i=0; i<UUPICKER_MINUTE; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d",i];
        if (0<i && i<=UUPICKER_MONTH)
            [monthArray addObject:num];
        if (i<UUPICKER_HOUR)
            [hourArray addObject:num];
        [minuteArray addObject:num];
    }
    for (int i=UUPICKER_MINDATE; i<UUPICKER_MAXDATE; i++) {
        NSString *num = [NSString stringWithFormat:@"%d",i];
        [yearArray addObject:num];
    }
    //最大最小限制
    if (self.maxLimitDate) {
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }else{
        self.maxLimitDate = [ArchivesModel dateFromString:@"204912312359" withFormat:@"yyyyMMddHHmm"];
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }
    //最小限制
    if (self.minLimitDate) {
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }else{
        self.minLimitDate = [ArchivesModel dateFromString:@"197001010000" withFormat:@"yyyyMMddHHmm"];
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }
    
    //获取当前日期，储存当前时间位置
    //    NSArray *indexArray = [self getNowDate:self.ScrollToDate];
    
    
    return dayArray;
}

//时
-(NSMutableArray*)hourArrays{
    
    yearArray   = [ArchivesModel ishaves:yearArray];
    monthArray  = [ArchivesModel ishaves:monthArray];
    dayArray    = [ArchivesModel ishaves:dayArray];
    hourArray   = [ArchivesModel ishaves:hourArray];
    minuteArray = [ArchivesModel ishaves:minuteArray];
    
    //赋值
    for (int i=0; i<UUPICKER_MINUTE; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d",i];
        if (0<i && i<=UUPICKER_MONTH)
            [monthArray addObject:num];
        if (i<UUPICKER_HOUR)
            [hourArray addObject:num];
        [minuteArray addObject:num];
    }
    for (int i=UUPICKER_MINDATE; i<UUPICKER_MAXDATE; i++) {
        NSString *num = [NSString stringWithFormat:@"%d",i];
        [yearArray addObject:num];
    }
    //最大最小限制
    if (self.maxLimitDate) {
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }else{
        self.maxLimitDate = [ArchivesModel dateFromString:@"204912312359" withFormat:@"yyyyMMddHHmm"];
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }
    //最小限制
    if (self.minLimitDate) {
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }else{
        self.minLimitDate = [ArchivesModel dateFromString:@"197001010000" withFormat:@"yyyyMMddHHmm"];
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }
    
    //获取当前日期，储存当前时间位置
    //    NSArray *indexArray = [self getNowDate:self.ScrollToDate];
    
    
    return hourArray;
}


//分
-(NSMutableArray*)minuteArrays{
    
    yearArray   = [ArchivesModel ishaves:yearArray];
    monthArray  = [ArchivesModel ishaves:monthArray];
    dayArray    = [ArchivesModel ishaves:dayArray];
    hourArray   = [ArchivesModel ishaves:hourArray];
    minuteArray = [ArchivesModel ishaves:minuteArray];
    
    //赋值
    for (int i=0; i<UUPICKER_MINUTE; i++) {
        NSString *num = [NSString stringWithFormat:@"%02d",i];
        if (0<i && i<=UUPICKER_MONTH)
            [monthArray addObject:num];
        if (i<UUPICKER_HOUR)
            [hourArray addObject:num];
        [minuteArray addObject:num];
    }
    for (int i=UUPICKER_MINDATE; i<UUPICKER_MAXDATE; i++) {
        NSString *num = [NSString stringWithFormat:@"%d",i];
        [yearArray addObject:num];
    }
    //最大最小限制
    if (self.maxLimitDate) {
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }else{
        self.maxLimitDate = [ArchivesModel dateFromString:@"204912312359" withFormat:@"yyyyMMddHHmm"];
        maxDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.maxLimitDate];
    }
    //最小限制
    if (self.minLimitDate) {
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }else{
        self.minLimitDate = [ArchivesModel dateFromString:@"197001010000" withFormat:@"yyyyMMddHHmm"];
        minDateModel = [[UUDatePicker_DateModel alloc]initWithDate:self.minLimitDate];
    }
    
    //获取当前日期，储存当前时间位置
    
    
    return minuteArray;
}



//获取当前时间解析及位置
- (NSArray *)getNowDate:(NSDate *)date
{
    NSDate *dateShow;
    if (date) {
        dateShow = date;
    }else{
        dateShow = [NSDate date];
    }
    
    UUDatePicker_DateModel *model = [[UUDatePicker_DateModel alloc]initWithDate:dateShow];
    ////通过年月求每月天数
    [self DaysfromYear:[model.year integerValue] andMonth:[model.month integerValue]];
    
    yearIndex = [model.year intValue]-UUPICKER_MINDATE;
    monthIndex = [model.month intValue]-1;
    dayIndex = [model.day intValue]-1;
    hourIndex = [model.hour intValue]-0;
    minuteIndex = [model.minute intValue]-0;
    
    NSNumber *year   = [NSNumber numberWithInteger:yearIndex];
    NSNumber *month  = [NSNumber numberWithInteger:monthIndex];
    NSNumber *day    = [NSNumber numberWithInteger:dayIndex];
    NSNumber *hour   = [NSNumber numberWithInteger:hourIndex];
    NSNumber *minute = [NSNumber numberWithInteger:minuteIndex];
    
//    if (self.datePickerStyle == UUDateStyle_YearMonthDayHourMinute)
        return @[year,month,day,hour,minute];
//    if (self.datePickerStyle == UUDateStyle_YearMonthDay)
//        return @[year,month,day];
//    if (self.datePickerStyle == UUDateStyle_MonthDayHourMinute)
//        return @[month,day,hour,minute];
//    if (self.datePickerStyle == UUDateStyle_HourMinute)
//        return @[hour,minute];
//    return monthArray;
}






//根据string返回date
- (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}


//通过年月求每月天数 2016  6
- (NSMutableArray *)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month
{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:{
            
            return [self setdayArray:31];
        }
            break;
        case 4:
        case 6:
        case 9:
        case 11:{
            
            return [self setdayArray:30];
        }
            break;
        case 2:{
            if (isrunNian) {
                
                return [self setdayArray:29];
            }else{
                
                return [self setdayArray:28];
            }
        }
            break;
        default:
            break;
    }
    return 0;
}





//设置每月的天数数组
- (NSMutableArray *)setdayArray:(NSInteger)num
{
    [dayArray removeAllObjects];
    for (int i=1; i<=num; i++) {
        [dayArray addObject:[NSString stringWithFormat:@"%02d",i]];
    }
    
    return dayArray;
}

//索引当前的时间
-(NSArray*)indexOfTheCurrentTime{
    NSArray *indexArray = [self getNowDate:self.ScrollToDate];
    return indexArray;
}


#pragma mark - 数据处理
//通过日期求星期
- (NSString*)getWeekDayWithYear:(NSString*)year month:(NSString*)month day:(NSString*)day
{
    NSInteger yearInt   = [year integerValue];
    NSInteger monthInt  = [month integerValue];
    NSInteger dayInt    = [day integerValue];
    int c = 20;//世纪
    int y = (int)yearInt -1;//年
    int d = (int)dayInt;
    int m = (int)monthInt;
    int w =(y+(y/4)+(c/4)-2*c+(26*(m+1)/10)+d-1)%7;
    NSString *weekDay = @"";
    switch (w) {
        case 0: weekDay = @"周日";    break;
        case 1: weekDay = @"周一";    break;
        case 2: weekDay = @"周二";    break;
        case 3: weekDay = @"周三";    break;
        case 4: weekDay = @"周四";    break;
        case 5: weekDay = @"周五";    break;
        case 6: weekDay = @"周六";    break;
            
//        case 0: weekDay = @"周一";    break;
//        case 1: weekDay = @"周二";    break;
//        case 2: weekDay = @"周三";    break;
//        case 3: weekDay = @"周四";    break;
//        case 4: weekDay = @"周五";    break;
//        case 5: weekDay = @"周六";    break;
//        case 6: weekDay = @"周日";    break;
//
        default:break;
    }
    return weekDay;
}


//前一天
-(NSDate *)dayBefore:(NSDate *)date{
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];//前一天
    return lastDay;
}
//后一天
-(NSDate *)dayAfter:(NSDate *)date{
    NSDate *nextDat = [NSDate dateWithTimeInterval:24*60*60-1 sinceDate:date];//后一天
    return  nextDat;
}

//周
-(NSDate *)dayWeeks:(NSDate *)date{
    
    NSDate *nextWeeks = [NSDate dateWithTimeInterval:-24*60*60*7 sinceDate:date];
    return nextWeeks;

}


//时间推移
-(NSString *)dayTime:(NSString *)str{

    
    NSDate *nextWeeks = [NSDate dateWithTimeInterval:-24*60*60*[str integerValue] sinceDate:[NSDate date]];


    
    return [ArchivesModel dateweFromString:nextWeeks];
}



//月的天数
-(NSInteger)dayMonthCount{

    UUDatePicker_DateModel *model = [[UUDatePicker_DateModel alloc]initWithDate:[NSDate date]];
    
    NSInteger month=   [[self DaysfromYear:[model.year integerValue] andMonth:[model.month integerValue]]count];

    return month;

}

//三月
-(NSInteger)dayInMarchCount{
    
    UUDatePicker_DateModel *model = [[UUDatePicker_DateModel alloc]initWithDate:[NSDate date]];
    ////通过年月求每月天数
    NSInteger marchY;
    NSMutableArray *array=[[NSMutableArray alloc]init];
    marchY=[model.month integerValue];
    for (int i=0; i<3;i++ ) {
        if (marchY-i<1) {
            marchY=12-i;
        }else{
            marchY=[model.month integerValue]-i;
        }
        [array addObject:[NSString stringWithFormat:@"%lu",(unsigned long)[[self DaysfromYear:[model.year integerValue] andMonth:marchY]count]]];
    }
    int dayInt=[[array objectAtIndex:0]intValue]+[[array objectAtIndex:1]intValue]+[[array objectAtIndex:2]intValue];
    
    
    return dayInt;
    
    
    
}
//半年
-(NSInteger )dayHalfaYearCount{
    
    UUDatePicker_DateModel *model = [[UUDatePicker_DateModel alloc]initWithDate:[NSDate date]];
    ////通过年月求每月天数
    
    NSInteger marchY = 0;
    NSMutableArray *array=[[NSMutableArray alloc]init];
    marchY=[model.month integerValue];
    for (int i=0; i<6;i++ ) {
        if (marchY-i<1) {
            marchY=12-i;
        }else{
            marchY=[model.month integerValue]-i;
        }
        [array addObject:[NSString stringWithFormat:@"%lu",(unsigned long)[[self DaysfromYear:[model.year integerValue] andMonth:marchY]count]]];
    }
    
    
    int dayInt=[[array objectAtIndex:0]intValue]+[[array objectAtIndex:1]intValue]+[[array objectAtIndex:2]intValue]+[[array objectAtIndex:3]intValue]+[[array objectAtIndex:4]intValue]+[[array objectAtIndex:5]intValue];

    
    return dayInt;
}



//2016  6
//月
-(NSDate *)dayMonth:(NSDate *)date{

//    __weak typeof(self) weakSelf = self;

    UUDatePicker_DateModel *model = [[UUDatePicker_DateModel alloc]initWithDate:date];
    ////通过年月求每月天数

    NSInteger month=   [[self DaysfromYear:[model.year integerValue] andMonth:[model.month integerValue]]count];

    NSDate *nextdayMonth = [NSDate dateWithTimeInterval:-24*60*60* month sinceDate:date];
    
    return nextdayMonth;


    
}


//三月
-(NSDate *)dayInMarch:(NSDate *)date{
    
    UUDatePicker_DateModel *model = [[UUDatePicker_DateModel alloc]initWithDate:date];
    ////通过年月求每月天数
    
    NSInteger marchY;
    NSMutableArray *array=[[NSMutableArray alloc]init];
        marchY=[model.month integerValue];
    for (int i=0; i<3;i++ ) {
        if (marchY-i<1) {
            marchY=12-i;
        }else{
            marchY=[model.month integerValue]-i;
        }
        [array addObject:[NSString stringWithFormat:@"%lu",(unsigned long)[[self DaysfromYear:[model.year integerValue] andMonth:marchY]count]]];
    }
    int dayInt=[[array objectAtIndex:0]intValue]+[[array objectAtIndex:1]intValue]+[[array objectAtIndex:2]intValue];
    NSDate *nextInMarch = [NSDate dateWithTimeInterval:-24*60*60* dayInt sinceDate:date];
    return nextInMarch;
}


//半年
-(NSDate *)dayHalfaYear:(NSDate *)date{
    
    
    UUDatePicker_DateModel *model = [[UUDatePicker_DateModel alloc]initWithDate:date];
    ////通过年月求每月天数
    
    NSInteger marchY = 0;
    NSMutableArray *array=[[NSMutableArray alloc]init];
        marchY=[model.month integerValue];
    for (int i=0; i<6;i++ ) {
        if (marchY-i<1) {
            marchY=12-i;
        }else{
            marchY=[model.month integerValue]-i;
        }
        [array addObject:[NSString stringWithFormat:@"%lu",(unsigned long)[[self DaysfromYear:[model.year integerValue] andMonth:marchY]count]]];
    }

    
    int dayInt=[[array objectAtIndex:0]intValue]+[[array objectAtIndex:1]intValue]+[[array objectAtIndex:2]intValue]+[[array objectAtIndex:3]intValue]+[[array objectAtIndex:4]intValue]+[[array objectAtIndex:5]intValue];
    NSDate *nextHalfaYear = [NSDate dateWithTimeInterval:-24*60*60* dayInt sinceDate:date];
    return nextHalfaYear;

}


//时间转时间戳的方法年月日，时分
+(NSString *)dateWithTimeIntervalSin:(NSString *)dateStr{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
////    [formatter setDateFormat:@"yyyy-MM-dd  HH:mm"];
//    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[dateStr integerValue]/1000];
//    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
//    return confromTimespStr;
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    //    [formatter setDateFormat:@"yyyy-MM-dd  HH:mm"];longLongValue
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[dateStr longLongValue]/1000];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;

}

+(NSString *)dateWithTimeIntervalSinModify:(NSString *)dateStr{

    NSString*str=[NSString stringWithFormat:@"%lld",[dateStr longLongValue]/1000];//时间戳
    NSTimeInterval time=[str doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    NSDate*detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    //    NSLog(@"date:%@",[detaildate  description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString*currentDateStr = [dateFormatter stringFromDate:detaildate];
    

    return currentDateStr;

}


//时间转时间戳的方法，时分
+(NSString *)dateWithTimeIntervalSinAtThe:(NSString *)dateStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setDateFormat:@"HH:mm"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[dateStr longLongValue]/1000];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

//时间转时间戳的方法年月日
+(NSString *)dateWithTimeIntervalSinday:(NSString *)dateStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[dateStr longLongValue]/1000];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}



//时间转时间戳的方法月日
+(NSString *)dateWithTimeIntervalSindayMMdd:(NSString *)dateStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setDateFormat:@"MM-dd"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[dateStr longLongValue]/1000];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}

//月日
+(NSString *)dateweFromString:(NSDate*)string
{
    //需要转换的字符串
    //    NSString*dateString=@"2015-06-2608:08:08";
    //设置转换格式
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //NSString转NSDate
    NSString *date=[formatter stringFromDate:string];
    
    
    return date;
}





//月日
+(NSString *)dateFromString:(NSDate*)string
{
    //需要转换的字符串
    //    NSString*dateString=@"2015-06-2608:08:08";
    //设置转换格式
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd"];
    //NSString转NSDate
    NSString *date=[formatter stringFromDate:string];
    
    
    return date;
}






+(NSArray *)dateArrayFlashback:(NSMutableArray *)array{
 NSArray * reversedArray = [[array reverseObjectEnumerator] allObjects];


    return reversedArray;
}


+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    //需要转换的字符串
//    NSString*dateString=@"2015-06-2608:08:08";
    //设置转换格式
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //NSString转NSDate
    NSDate*date=[formatter dateFromString:uiDate];
    return date;
}

+(NSString*) convertDateMMddFromString:(NSString*)uistr
{
    //需要转换的字符串
    //    NSString*dateString=@"2015-06-2608:08:08";
    //设置转换格式
    NSDateFormatter*formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd"];
    //NSString转NSDate
    NSDate*date=[formatter dateFromString:uistr];
    
    
    
    return [self dateFromString:date];
}

@end
