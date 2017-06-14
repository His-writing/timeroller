
#import <UIKit/UIKit.h>
@class UUDatePicker;

typedef enum{
    
    UUDateStyle_YearMonthDayHourMinute = 0,
    UUDateStyle_YearMonthDay,
    UUDateStyle_MonthDayHourMinute,
    
    UUDateStyle_HourMinute,
    //男女
    UUDateStyle_gender,

    //身高
    UUDateStyle_height,
    
    //体重
    UUDateStyle_weight,
    //年龄
    UUDateStyle_age
    
    
}DateStyle;

typedef void (^FinishBlock)(NSString * year,
                            NSString * month,
                            NSString * day,
                            NSString * hour,
                            NSString * minute,
                            NSString * weekDay);


@protocol UUDatePickerDelegate <NSObject>


//滑动出数据
//
//- (void)uuDatePicker:(UUDatePicker *)datePicker
//                year:(NSString *)year
//               month:(NSString *)month
//                 day:(NSString *)day
//                hour:(NSString *)hour
//              minute:(NSString *)minute
//             weekDay:(NSString *)weekDay;
//
//
//
//
//- (void)uuDatePicker:(UUDatePicker *)datePicker
//          dataString:(NSString *)dataString;
//



//取消按钮
-(void)cancelButton:(NSString *)cancel;


//确定按钮
-(void)determineButton:(UUDatePicker *)datePicker
                  year:(NSString *)year
                 month:(NSString *)month
                   day:(NSString *)day
                  hour:(NSString *)hour
                minute:(NSString *)minute
               weekDay:(NSString *)weekDay;



-(void)determineButton:(UUDatePicker *)datePicker
                  type:(NSString *)type
            dataString:(NSString *)dataString;

//男女
////身高
////体重



@end
//YearsTimeMo

@interface UUDatePicker : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, assign) id <UUDatePickerDelegate> delegate;

@property (nonatomic, assign) DateStyle datePickerStyle;

@property (nonatomic, retain) NSDate *ScrollToDate;//滚到指定日期
@property (nonatomic, retain) NSDate *maxLimitDate;//限制最大时间（没有设置默认2049）
@property (nonatomic, retain) NSDate *minLimitDate;//限制最小时间（没有设置默认1970）


@property (nonatomic, retain) NSString *characterString;//数据




- (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;

- (id)initWithframe:(CGRect)frame Delegate:(id<UUDatePickerDelegate>)delegate PickerStyle:(DateStyle)uuDateStyle;

- (id)initWithframe:(CGRect)frame PickerStyle:(DateStyle)uuDateStyle didSelected:(FinishBlock)finishBlock;

@end
