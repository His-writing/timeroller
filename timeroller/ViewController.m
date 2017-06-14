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
    //日期存储数组
    //年数组
    NSMutableArray *_yearArray;
    
    //月数组
    NSMutableArray *_monthArray;
    
    NSMutableArray *_monthArray1;
    //天数组
    NSMutableArray *_dayArray;
    
    //周和天
    NSMutableArray *_dayWeeksArray;
    
    //小时的数组
    NSMutableArray *_hourArray;
    //分钟的数组
    NSMutableArray *_minuteArray;
    
    //限制model
    UUDatePicker_DateModel *_maxDateModel;
    UUDatePicker_DateModel *_minDateModel;
    
    //记录位置
    NSInteger _yearIndex;
    NSInteger _monthIndex;
    NSInteger _dayIndex;
    NSInteger _hourIndex;
    NSInteger _minuteIndex;
    
    
    int _pageNum;
    
    
}
//日期存储数组

//年数组
@property(strong,nonatomic) NSMutableArray *yearArray;

//@property(nonnull,strong)UIButton *  zkSegment1LeftButton;

@property (nonatomic,assign)ZKSegmentStyle zkSegmentStyle;

//月数组

@property(strong,nonatomic) NSMutableArray *monthArray;

//天数组
@property(strong,nonatomic) NSMutableArray *dayArray;


//周和天
@property(strong,nonatomic) NSMutableArray *dayWeeksArray;


//小时的数组
@property(strong,nonatomic) NSMutableArray *hourArray;

//分钟的数组
@property(strong,nonatomic) NSMutableArray *minuteArray;

@property(strong,nonatomic) ArchivesModel* achiverDate;


@property (nonatomic, strong)ZKSegment *zkSegment1;
@property (strong, nonatomic)  UIView  *pHeaderView;

@end

@implementation ViewController

//周和天匹配
-(void)timeInit
{
    
    _dayWeeksArray=[ArchivesModel ishaves:_dayWeeksArray];
    _dayArray=[ArchivesModel ishaves:_dayArray];
    
    for (int i=0; i<[[self.achiverDate DaysfromYear:[[_yearArray objectAtIndex:_yearIndex] intValue] andMonth:[[[self.achiverDate  monthArrays] objectAtIndex:_monthIndex] intValue]]count]; i++) {
        
        NSString *dayStr=[[self.achiverDate DaysfromYear:[[_yearArray objectAtIndex:_yearIndex] intValue] andMonth:[[[self.achiverDate  monthArrays] objectAtIndex:_monthIndex] intValue]]objectAtIndex:i];
        
        //周
        NSString *zhouStr=[self.achiverDate getWeekDayWithYear:[NSString stringWithFormat:@"%@",[_yearArray objectAtIndex:_yearIndex]] month:[NSString stringWithFormat:@"%@",[[self.achiverDate  monthArrays] objectAtIndex:_monthIndex]] day:dayStr];
        
        
        if (_dayIndex==i) {
            
            zhouStr=@"今天";
            
        }
        
        NSString *yue;
        if ([[_monthArray objectAtIndex:_monthIndex] integerValue]<10) {
            yue  =[NSString stringWithFormat:@"0%@",[_monthArray objectAtIndex:_monthIndex]];
            
        }else{
            
            yue  =[NSString stringWithFormat:@"%@",[_monthArray objectAtIndex:_monthIndex]];
            
        }
        
        
        [_dayWeeksArray addObject:[NSString stringWithFormat:@"%@\n%@/%@",zhouStr,yue,dayStr]];
        
        
        NSString *dayStr1=[[self.achiverDate DaysfromYear:[[_yearArray objectAtIndex:_yearIndex] intValue] andMonth:[[[self.achiverDate  monthArrays] objectAtIndex:_monthIndex] intValue]]objectAtIndex:i];
        
        [_dayArray addObject:[NSString stringWithFormat:@"%@",dayStr1]];
        
    }
    
    
}
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
    [self dayArrayItem];
    
    
    
    
    //将天数装进数组
    [self.zkSegment1 zk_setItems:_dayWeeksArray];
    //时间
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
    
    //    _dayIndex=itemIndex;
    //将天数装进数组
    
    
    _dayIndex=itemIndex;
    
    
    [self dayArrayItem];
    
    
    
    
    //    NSLog(@"theCurrentDate---%@",[self theCurrentDate]);
    
    //    [self getUserInfomationAction:[self theCurrentDate]];
    
    
}

-(NSString *)theCurrentDate{
    
    
    if ([_dayArray count]<=_dayIndex) {
        
        _dayIndex=[_dayArray count];
    }
    
    
    NSString *dateStr=[NSString stringWithFormat:@"%@-%@-%@ ",[_yearArray objectAtIndex:_yearIndex],[_monthArray1 objectAtIndex:_monthIndex],[_dayArray objectAtIndex:_dayIndex]];
    
    
    
    NSLog(@"dateStr-------%@",dateStr);
    return    dateStr;
    
    
    
    
    
}


-(void)dayArrayItem{
    
    if ([_dayArray count]<=_dayIndex) {
        
        _dayIndex=[_dayArray count]-1;
    }
    
}



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
    
    //    self.aTableView.frame=CGRectMake(0, heightSegment, kDeviceWidth, kDeviceHeight);
    
    
    //
    self.achiverDate=[ArchivesModel  getArchivesDataSource];
    
    _yearArray= [self.achiverDate  yearArrayss];
    
    //年
    
    _yearIndex=[[[self.achiverDate indexOfTheCurrentTime]objectAtIndex:0] intValue];
    //月
    _monthIndex= [[[self.achiverDate indexOfTheCurrentTime]objectAtIndex:1] intValue];
    
    //日
    _dayIndex=[[[self.achiverDate indexOfTheCurrentTime]objectAtIndex:2] intValue];
    
    //月
    _monthArray=[ArchivesModel ishaves:_monthArray];
    
    
    //月的数组
    for (int i=0; i<[[self.achiverDate  monthArrays]count]; i++) {
        [_monthArray addObject:[NSString stringWithFormat:@"%@",[[self.achiverDate  monthArrays]objectAtIndex:i]]];
    }
    
    
    _monthArray1=[ArchivesModel ishaves:_monthArray1];
    //月的数组
    for (int i=0; i<[[self.achiverDate  monthArrays]count]; i++) {
        
        if (i>8) {
            [_monthArray1 addObject:[NSString stringWithFormat:@"%@",[[self.achiverDate  monthArrays]objectAtIndex:i]]];
            
        }else{
            [_monthArray1 addObject:[NSString stringWithFormat:@"0%@",[[self.achiverDate  monthArrays]objectAtIndex:i]]];
            
        }
    }
    
    
    
    
    
    
    [self timeInit];
    
    
    
    //小时的数组
    _hourArray=   [self.achiverDate  hourArrays];
    //分
    _minuteArray=  [self.achiverDate  minuteArrays];
    
    
    self.zkSegmentStyle = ZKSegmentRectangleStyle;
    
    
    [self resetSegment1];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
