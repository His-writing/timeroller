//
//  ViewController.m
//  timeroller
//
//  Created by shuzhenguo on 2017/6/14.
//  Copyright © 2017年 shuzhenguo. All rights reserved.
//

#import "ViewController.h"
#import "ZKSegment.h"
#import "ArchivesModel.h"
#import "MacroCommon.h"

@interface ViewController ()
{
//    //日期存储数组
//    //年数组
//    NSMutableArray *_yearArray;
//    
//    //月数组
//    NSMutableArray *_monthArray;
//    
//    NSMutableArray *_monthArray1;
//    //天数组
//    NSMutableArray *_dayArray;
//    
//    //周和天
//    NSMutableArray *_dayWeeksArray;
//    
//    //小时的数组
//    NSMutableArray *_hourArray;
//    //分钟的数组
//    NSMutableArray *_minuteArray;
//    
//    //限制model
//    UUDatePicker_DateModel *_maxDateModel;
//    UUDatePicker_DateModel *_minDateModel;
//    
//    //记录位置
//    NSInteger _yearIndex;
//    NSInteger _monthIndex;
    NSInteger _dayIndex;
//    NSInteger _hourIndex;
//    NSInteger _minuteIndex;
//    
//    
//    int _pageNum;
//    
//    
}
//日期存储数组

//年数组
//@property(strong,nonatomic) NSMutableArray *yearArray;

//@property(nonnull,strong)UIButton *  zkSegment1LeftButton;

@property (nonatomic,assign)ZKSegmentStyle zkSegmentStyle;


@property(nonatomic,strong)NSMutableArray *dataArray ;
@property(nonatomic,strong)NSMutableArray *YearMonthDayArray ;


////月数组
//
//@property(strong,nonatomic) NSMutableArray *monthArray;
//
////天数组
//@property(strong,nonatomic) NSMutableArray *dayArray;
//
//
////周和天
//@property(strong,nonatomic) NSMutableArray *dayWeeksArray;
//
//
////小时的数组
//@property(strong,nonatomic) NSMutableArray *hourArray;
//
////分钟的数组
//@property(strong,nonatomic) NSMutableArray *minuteArray;
//
//@property(strong,nonatomic) ArchivesModel* achiverDate;
//

@property (nonatomic, strong)ZKSegment *zkSegment1;
@property (strong, nonatomic)  UIView  *pHeaderView;

@end

@implementation ViewController

////周和天匹配
//-(void)timeInit
//{
//    
//    _dayWeeksArray=[ArchivesModel ishaves:_dayWeeksArray];
//    _dayArray=[ArchivesModel ishaves:_dayArray];
//    
//    for (int i=0; i<[[self.achiverDate DaysfromYear:[[_yearArray objectAtIndex:_yearIndex] intValue] andMonth:[[[self.achiverDate  monthArrays] objectAtIndex:_monthIndex] intValue]]count]; i++) {
//        
//        NSString *dayStr=[[self.achiverDate DaysfromYear:[[_yearArray objectAtIndex:_yearIndex] intValue] andMonth:[[[self.achiverDate  monthArrays] objectAtIndex:_monthIndex] intValue]]objectAtIndex:i];
//        
//        //周
//        NSString *zhouStr=[self.achiverDate getWeekDayWithYear:[NSString stringWithFormat:@"%@",[_yearArray objectAtIndex:_yearIndex]] month:[NSString stringWithFormat:@"%@",[[self.achiverDate  monthArrays] objectAtIndex:_monthIndex]] day:dayStr];
//        
//        
//        if (_dayIndex==i) {
//            
//            zhouStr=@"今天";
//            
//        }
//        
//        NSString *yue;
//        if ([[_monthArray objectAtIndex:_monthIndex] integerValue]<10) {
//            yue  =[NSString stringWithFormat:@"0%@",[_monthArray objectAtIndex:_monthIndex]];
//            
//        }else{
//            
//            yue  =[NSString stringWithFormat:@"%@",[_monthArray objectAtIndex:_monthIndex]];
//            
//        }
//        
//        
//        [_dayWeeksArray addObject:[NSString stringWithFormat:@"%@\n%@/%@",zhouStr,yue,dayStr]];
//        
//        
//        NSString *dayStr1=[[self.achiverDate DaysfromYear:[[_yearArray objectAtIndex:_yearIndex] intValue] andMonth:[[[self.achiverDate  monthArrays] objectAtIndex:_monthIndex] intValue]]objectAtIndex:i];
//        
//        [_dayArray addObject:[NSString stringWithFormat:@"%@",dayStr1]];
//        
//    }
//    
//    
//}
//天
- (void)resetSegment1 {
    if (self.zkSegment1) {
        [self.zkSegment1 removeFromSuperview];
        
        
    }
    
    CGFloat  heightSegment;
    
    heightSegment=55;
    
    
    
    
    self.zkSegment1 = [ZKSegment
                       zk_segmentWithFrame:CGRectMake(5, 0, kDeviceWidth-10, heightSegment)
                       style:self.zkSegmentStyle];
    
    
    
    // 可手动设置各种颜色；
    // 如不设置则使用默认颜色
    
    self.zkSegment1.backgroundColor=[UIColor clearColor];
    self.zkSegment1.zk_itemDefaultColor = [UIColor colorWithRed:250 / 255.0 green:250 / 255.0 blue:250 / 255.0 alpha:0.4];
    self.zkSegment1.zk_itemSelectedColor = [UIColor colorWithRed:250 / 255.0 green:250 / 255.0 blue:250 / 255.0 alpha:1];
//    [self dayArrayItem];
    
    
    
//    
//    //将天数装进数组
    [self.zkSegment1 zk_setItems:self.dataArray];
//    //时间
    [self.zkSegment1 zk_itemClickByIndex:_dayIndex];
    
    
    
    __weak typeof(self) weakSelf = self;
    self.zkSegment1.zk_itemClickBlock = ^(NSString *itemName, NSInteger itemIndex) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        //
        [strongSelf zkSegment1ButtonClick:itemName itemIndex:itemIndex];
    };
    
    
    
    if (self.pHeaderView) {
        [self.pHeaderView removeFromSuperview];
        
    }
    
    
    self.pHeaderView =[[UIView alloc]initWithFrame:CGRectMake(0, 150, kDeviceWidth, heightSegment)];
    
    self.pHeaderView.backgroundColor=smallMostColor1;
    //    smallMostColor
    [self.pHeaderView addSubview:self.zkSegment1];
    
    [self.view addSubview:self.pHeaderView];
    //    self.aTableView.tableHeaderView=self.pHeaderView ;
}
//日
-(void)zkSegment1ButtonClick:(NSString *)itemName  itemIndex:(NSInteger)itemIndex {
    
    NSLog(@"itemIndex-%ld",(long)itemIndex);
    NSLog(@"itemName-%ld",(long)itemName);
    
    
    //    itemIndexitemIndexitemIndexitemIndex
    //    [self.zkSegment1 zk_setItems:_dayWeeksArray];
    //    //时间
    //    [self.zkSegment1 zk_itemClickByIndex:_dayIndex];
    
//        _dayIndex=itemIndex;
    //将天数装进数组
    
    
    _dayIndex=itemIndex;
    
    
//    [self dayArrayItem];
    
    
    
    
    //    NSLog(@"theCurrentDate---%@",[self theCurrentDate]);
    
    //    [self getUserInfomationAction:[self theCurrentDate]];
    
    
}

//-(NSString *)theCurrentDate{

//    
//    if ([_dayArray count]<=_dayIndex) {
//        
//        _dayIndex=[_dayArray count];
//    }
//    
//    
//    NSString *dateStr=[NSString stringWithFormat:@"%@-%@-%@ ",[_yearArray objectAtIndex:_yearIndex],[_monthArray1 objectAtIndex:_monthIndex],[_dayArray objectAtIndex:_dayIndex]];
//    
    
//    
//    NSLog(@"dateStr-------%@",dateStr);
//    return    dateStr;
//    
//    
//    
//    
//    
//}


//-(void)dayArrayItem{
//    
//    if ([_dayArray count]<=_dayIndex) {
//        
//        _dayIndex=[_dayArray count]-1;
//    }
//    
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat  heightSegment;
    
    
    
    if (IS_IPHONE_6_Plus) {
        
        heightSegment=55;
        
    }else if (IS_IPHONE_6){
        heightSegment=45;
        
    }else if (IS_IPHONE_5){
        
        heightSegment=35;
        
    }else {
        heightSegment=35;
        
        
    }
    
    
    self.dataArray = [NSMutableArray array];
    
    
    
    //前推3周，21天日期数据集合
    NSMutableArray *forward = [self getForwardDataArr:22];
    for (NSInteger i=0; i<forward.count; i++) {
        [self.dataArray addObject:forward[i]];
    }
    
    
    //当前日期数据集合
    NSMutableArray *current = [self getForwardDataArr:0];
    for (NSInteger i=0; i<current.count; i++) {
        //        [dataArray addObject:current[i]];
        
        NSLog(@"22222----%@",[self getYearMonthDayWeekWithDate:[NSDate date]]);
        
        if ([[self getYearMonthDayWeekWithDate:[NSDate date]] isEqualToString:current[i]]) {
            
            NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
            //    [dateformatter setDateFormat:@"yyy"];
            //    NSString *  yearString = [dateformatter stringFromDate:date];
            [dateformatter setDateFormat:@"MM"];
            NSString *  monthString = [dateformatter stringFromDate:[NSDate date]];
            [dateformatter setDateFormat:@"dd"];
            NSString *  dayString = [dateformatter stringFromDate:[NSDate date]];
            [dateformatter setDateFormat:@"EEE"];
            [dateformatter setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
//            NSString *weekString = [dateformatter stringFromDate:[NSDate date]];
            
            //    return [NSString stringWithFormat:@"%@-%@-%@",monthString,dayString,weekString];
            
            
            
            [self.dataArray addObject:[NSString stringWithFormat:@"%@\n%@/%@",@"今天",monthString,dayString]];

            
        }
        
    }

    
    //后推一周，7天日期数据集合
    NSMutableArray *backward = [self getBackwardDataArr:7];
    for (NSInteger i=0; i<backward.count; i++) {
        [self.dataArray addObject:backward[i]];
    }
    
    for (int i=0; i<self.dataArray.count; i++) {
        NSLog(@"%@",self.dataArray[i]);
        //正数22，倒数8为今天日期
    }

    
    
    
    
    self.YearMonthDayArray=[NSMutableArray array];

    
    
    //前推3周，21天日期数据集合
    NSMutableArray *forwardYearMonthDay = [self getForwardYearMonthDayDataArr:22];
    for (NSInteger i=0; i<forwardYearMonthDay.count; i++) {
        [self.YearMonthDayArray addObject:forwardYearMonthDay[i]];
    }

    
    //当前日期数据集合
    NSMutableArray *currentYearMonthDay = [self getForwardYearMonthDayDataArr:0];
    for (NSInteger i=0; i<currentYearMonthDay.count; i++) {
                [self.YearMonthDayArray addObject:currentYearMonthDay[i]];
//        [self.dataArray addObject:[NSString stringWithFormat:@"%@%@",@"%@",currentYearMonthDay[i]]];
        
    }

    
    //后推一周，7天日期数据集合
    NSMutableArray *backwardYearMonthDay = [self getYearMonthDayDataArr:7];
    for (NSInteger i=0; i<backwardYearMonthDay.count; i++) {
        [self.YearMonthDayArray addObject:backwardYearMonthDay[i]];
    }
    
    
    for (int i=0; i<self.YearMonthDayArray.count; i++) {
        NSLog(@"YearMonthDayArray---%@",self.YearMonthDayArray[i]);
        //正数22，倒数8为今天日期
    }
    
    

    _dayIndex=22;
    
    self.zkSegmentStyle = ZKSegmentRectangleStyle;
    
    
    [self resetSegment1];

    
    NSLog(@"%lu",(unsigned long)self.dataArray.count);
    
}


//获取几天后的日期集合
- (NSMutableArray *)getYearMonthDayDataArr:(NSInteger)index
{
    NSMutableArray *array = [NSMutableArray array];
    if (index>0) {
        for (NSInteger i=0; i<index; i++) {
            NSDate *date = [self getOneDay:i+1];
            NSString *ymdString = [self getYearMonthDayWithDate:date];
            [array addObject:ymdString];
        }
    }else{
        NSDate *date = [self getOneDay:index];
        NSString *ymdString = [self getYearMonthDayWithDate:date];
        [array addObject:ymdString];
    }
    
    return array;
}

//获取几天前的日期集合
- (NSMutableArray *)getForwardYearMonthDayDataArr:(NSInteger)index
{
    NSMutableArray *array = [NSMutableArray array];
    if (index>0) {
        for (NSInteger i=index; i>0; i--) {
            NSDate *date = [self getOneDay:-i];
            NSString *ymdString = [self getYearMonthDayWithDate:date];
            [array addObject:ymdString];
        }
    }else{
        NSDate *date = [self getOneDay:index];
        NSString *ymdString = [self getYearMonthDayWithDate:date];
        [array addObject:ymdString];
    }
    
    return array;
}

//根据日期获取年月日周
- (NSString *)getYearMonthDayWithDate:(NSDate *)date
{
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyy"];
    NSString *  yearString = [dateformatter stringFromDate:date];
    [dateformatter setDateFormat:@"MM"];
    NSString *  monthString = [dateformatter stringFromDate:date];
    [dateformatter setDateFormat:@"dd"];
    NSString *  dayString = [dateformatter stringFromDate:date];
    //    [dateformatter setDateFormat:@"EEE"];
    [dateformatter setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    //    NSString *weekString = [dateformatter stringFromDate:date];
    
    //    return [NSString stringWithFormat:@"%@-%@-%@",monthString,dayString,weekString];
    
    
    //    return [NSString stringWithFormat:@"%@\n%@/%@",weekString,monthString,dayString];
    
    return [NSString stringWithFormat:@"%@-%@-%@",yearString,monthString,dayString];
}

//获取几天后的日期集合
- (NSMutableArray *)getBackwardDataArr:(NSInteger)index
{
    NSMutableArray *array = [NSMutableArray array];
    if (index>0) {
        for (NSInteger i=0; i<index; i++) {
            NSDate *date = [self getOneDay:i+1];
            NSString *ymdString = [self getYearMonthDayWeekWithDate:date];
            [array addObject:ymdString];
        }
    }else{
        NSDate *date = [self getOneDay:index];
        NSString *ymdString = [self getYearMonthDayWeekWithDate:date];
        [array addObject:ymdString];
    }
    
    return array;
}



//获取几天前的日期集合
- (NSMutableArray *)getForwardDataArr:(NSInteger)index
{
    NSMutableArray *array = [NSMutableArray array];
    if (index>0) {
        for (NSInteger i=index; i>0; i--) {
            NSDate *date = [self getOneDay:-i];
            NSString *ymdString = [self getYearMonthDayWeekWithDate:date];
            [array addObject:ymdString];
        }
    }else{
        NSDate *date = [self getOneDay:index];
        NSString *ymdString = [self getYearMonthDayWeekWithDate:date];
        [array addObject:ymdString];
    }
    
    return array;
}




//根据日期获取年月日周
- (NSString *)getYearMonthDayWeekWithDate:(NSDate *)date
{
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    //    [dateformatter setDateFormat:@"yyy"];
    //    NSString *  yearString = [dateformatter stringFromDate:date];
    [dateformatter setDateFormat:@"MM"];
    NSString *  monthString = [dateformatter stringFromDate:date];
    [dateformatter setDateFormat:@"dd"];
    NSString *  dayString = [dateformatter stringFromDate:date];
    [dateformatter setDateFormat:@"EEE"];
    [dateformatter setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    NSString *weekString = [dateformatter stringFromDate:date];
    
    //    return [NSString stringWithFormat:@"%@-%@-%@",monthString,dayString,weekString];
    
    
    return [NSString stringWithFormat:@"%@\n%@/%@",weekString,monthString,dayString];
    
    //    return [NSString stringWithFormat:@"%@-%@-%@-%@",yearString,monthString,dayString,weekString];
}

/**
 *  获取几年几月几日后的日期，0表示当天，负数表示之前
 *  这里只要取到日就好了，年月置0，表示当年当月
 */
- (NSDate *)getOneDay:(NSInteger)day {
    NSInteger year = 0, month = 0;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:[NSDate date]];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:[NSDate date] options:0];
    return newdate;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
