//
//  MacroCommon.m
//  knowZhengzhou
//
//  Created by shuzhenguo on 15/8/5.
//  Copyright (c) 2015年 hongkunpeng. All rights reserved.
//

#import "MacroCommon.h"
#import "AppDelegate.h"
//#import "Reachability.h"

MacroCommon* s_macroCommon = nil;
//
//@implementation ChinaNewsModel
//
//


@implementation MacroCommon

+(UIButton *)RectangularGrayEdge:(UIButton *)button{
    
    
    button.layer.cornerRadius = 1;
    button.layer.borderColor = grayRGB.CGColor;
    button.layer.borderWidth = 1.0f;
    button.layer.rasterizationScale = [UIScreen mainScreen].scale;
    button.layer.shouldRasterize = YES;
    button.clipsToBounds = YES;
    return button;
    
}
+ (MacroCommon*) getMacroCommonDataSource{
    if (nil == s_macroCommon)
    {
        s_macroCommon = [[MacroCommon alloc] init];
    }
    return s_macroCommon;
    
}


////判断网络类型
//+(NSString *)getCurrntNet
//{
//    NSString *networkType=nil;
//    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    switch ([reachability currentReachabilityStatus]) {
//        case NotReachable:
//            networkType=@"当前网络不可用，请检查您的网络连接。";
//            break;
//        case ReachableViaWWAN:
//            networkType=@"您当前使用的是蜂窝数据";
//            break;
//        case ReachableViaWiFi:
//            networkType=@"您在使用WiFi网络";
//            break;
//    }
//    return networkType;
//}




- (UIActivityIndicatorView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_indicatorView stopAnimating];
        
        
        _indicatorView.frame=CGRectMake(0, 0, 90, 90);
        [self.appDelegate.window addSubview:_indicatorView];
        
        _indicatorView.center=self.appDelegate.window.center;
        
    }
    return _indicatorView;
}

-(AppDelegate *)appDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


+(NSString *)stringDateCellTime:(NSString *)timeString{


    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate1 = [inputFormatter dateFromString:timeString];
    UInt64 recordTime1 = [inputDate1 timeIntervalSince1970]*1000;
    NSLog(@"date = %llu", recordTime1);
    
    //获得系统时间并且转换成0时区时间在转换成毫秒
    NSDate*  senddate=[NSDate date];
    NSDateFormatter* dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *  morelocationString=[dateformatter stringFromDate:senddate];
    NSDate* inputDate2 = [inputFormatter dateFromString:morelocationString];
    UInt64 recordTime2 = [inputDate2 timeIntervalSince1970]*1000;
    NSLog(@"date = %llu", recordTime2);
    
    UInt64 finalTimeDate = recordTime2-recordTime1;
    NSLog(@"date = %llu", finalTimeDate);
    
    NSString* finalStr = [NSString string];
    double finalDouble = finalTimeDate/3600000;
    double finalminute = finalTimeDate/60000;
    
//    /Users/shuzhenguo/chinaPlusSVN/chinaPlus/chinaplus/ThirdLib/Reachability/MacroCommon.m:104:20: Using the result of an assignment as a condition without parentheses
    
    if (finalDouble > (24*30)) {
        
        NSDateFormatter* Matter=[[NSDateFormatter alloc] init];
        [Matter setDateFormat:@"yy"];
        NSLocale *Locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
        [Matter setLocale:Locale];
        UInt64 record = [[NSDate date] timeIntervalSince1970]*1000;
        NSDate *DD = [[NSDate alloc]initWithTimeIntervalSince1970:(record-finalTimeDate)/1000.0];
        NSString *  DDString=[Matter stringFromDate:DD];
        NSString * currTime = [Matter stringFromDate:[NSDate date]];
        
        
        
        
        if ([DDString isEqualToString:currTime]) {
            NSDateFormatter* dateformatter=[[NSDateFormatter alloc] init];
            [dateformatter setDateFormat:@"dd MMM"];
            NSLocale *zh_Locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
            [dateformatter setLocale:zh_Locale];
            UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
            NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:(recordTime-finalTimeDate)/1000.0];
            NSString *  morelocationString=[dateformatter stringFromDate:d];
            finalStr = morelocationString;
            NSLog(@"date: %@", finalStr);
        }else{
            NSDateFormatter* dateformatter=[[NSDateFormatter alloc] init];
            [dateformatter setDateFormat:@"dd MMM yy"];
            NSLocale *zh_Locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
            [dateformatter setLocale:zh_Locale];
            UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
            NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:(recordTime-finalTimeDate)/1000.0];
            NSString *  morelocationString=[dateformatter stringFromDate:d];
            finalStr = morelocationString;
            NSLog(@"date: %@", finalStr);
        }
    }else if (finalDouble>24&&finalDouble<=(24*30)) {
        NSInteger days = finalDouble/24;
        finalStr = [NSString stringWithFormat:@"%ldd",(long)days];
        NSLog(@"date: %@", finalStr);
    }else if (finalDouble<1){
        finalStr = [NSString stringWithFormat:@"%.0fm",finalminute];
        NSLog(@"date: %@", finalStr);
    }else{
        finalStr = [NSString stringWithFormat:@"%.0fh",finalDouble];
        NSLog(@"date: %@", finalStr);
    }
    
    return finalStr;
}



+(NSString *)stringRadioDateCellTime:(NSString *)timeString{
 
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* inputDate1 = [inputFormatter dateFromString:timeString];
    UInt64 recordTime1 = [inputDate1 timeIntervalSince1970];
    NSLog(@"date = %llu", recordTime1);
    
    //获得系统时间并且转换成0时区时间在转换成毫秒
    NSDate*  senddate=[NSDate date];
    NSDateFormatter* dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *  morelocationString=[dateformatter stringFromDate:senddate];
    NSDate* inputDate2 = [inputFormatter dateFromString:morelocationString];
    UInt64 recordTime2 = [inputDate2 timeIntervalSince1970];
    NSLog(@"date = %llu", recordTime2);
    
    UInt64 finalTimeDate = recordTime2-recordTime1;
    NSLog(@"date = %llu", finalTimeDate);
    
    NSString* finalStr = [NSString string];
    double finalDouble = finalTimeDate/3600;
    double finalminute = finalTimeDate/60;
    
    //    /Users/shuzhenguo/chinaPlusSVN/chinaPlus/chinaplus/ThirdLib/Reachability/MacroCommon.m:104:20: Using the result of an assignment as a condition without parentheses
    
    if (finalDouble > (24*30)) {
        
        NSDateFormatter* Matter=[[NSDateFormatter alloc] init];
        [Matter setDateFormat:@"yy"];
        NSLocale *Locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
        [Matter setLocale:Locale];
        UInt64 record = [[NSDate date] timeIntervalSince1970];
        NSDate *DD = [[NSDate alloc]initWithTimeIntervalSince1970:(record-finalTimeDate)];
        NSString *  DDString=[Matter stringFromDate:DD];
        NSString * currTime = [Matter stringFromDate:[NSDate date]];
        
        
        
        
        if ([DDString isEqualToString:currTime]) {
            NSDateFormatter* dateformatter=[[NSDateFormatter alloc] init];
            [dateformatter setDateFormat:@"dd MMM"];
            NSLocale *zh_Locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
            [dateformatter setLocale:zh_Locale];
            UInt64 recordTime = [[NSDate date] timeIntervalSince1970];
            NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:(recordTime-finalTimeDate)];
            NSString *  morelocationString=[dateformatter stringFromDate:d];
            finalStr = morelocationString;
            NSLog(@"date: %@", finalStr);
        }else{
            NSDateFormatter* dateformatter=[[NSDateFormatter alloc] init];
            [dateformatter setDateFormat:@"dd MMM yy"];
            NSLocale *zh_Locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_us"];
            [dateformatter setLocale:zh_Locale];
            UInt64 recordTime = [[NSDate date] timeIntervalSince1970];
            NSDate *d = [[NSDate alloc]initWithTimeIntervalSince1970:(recordTime-finalTimeDate)];
            NSString *  morelocationString=[dateformatter stringFromDate:d];
            finalStr = morelocationString;
            NSLog(@"date: %@", finalStr);
        }
    }else if (finalDouble>24&&finalDouble<=(24*30)) {
        NSInteger days = finalDouble/24;
        finalStr = [NSString stringWithFormat:@"%ldd",(long)days];
        NSLog(@"date: %@", finalStr);
    }else if (finalDouble<1){
        finalStr = [NSString stringWithFormat:@"%.0fm",finalminute];
        NSLog(@"date: %@", finalStr);
    }else{
        finalStr = [NSString stringWithFormat:@"%.0fh",finalDouble];
        NSLog(@"date: %@", finalStr);
    }
    
    return finalStr;

    
}

+(NSString *)dateWithTimeIntervalSinModify:(NSString *)dateStr{
    
    NSString*str=[NSString stringWithFormat:@"%lld",[dateStr longLongValue]/1000];//时间戳
//    NSTimeInterval time=[str doubleValue]+28800;//因为时差问题要加8小时 == 28800 sec
    
    NSTimeInterval time=[str doubleValue];//因为时差问题要加8小时 == 28800 sec

    NSDate*detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    //    NSLog(@"date:%@",[detaildate  description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString*currentDateStr = [dateFormatter stringFromDate:detaildate];
    
    
    return currentDateStr;
    
}


+ (BOOL) isBlankString:(NSString *)string {
    
    
    
    if (string == nil || string == NULL||[string isEqualToString:@""]||[string isEqualToString:@"(null)"]||[string isEqualToString:@"null"]||[string isEqualToString:@"<null>"]||[string isEqualToString:@"nil"]) {
        
        
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        
        
        
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        
        
        
        return YES;
    }
    
    return NO;
}



//截取特殊符号方法
+ (NSString *)decodeFromPercentEscapeString:(NSString *)input
{
    if (input.length) {
        NSMutableString *outputStr = [NSMutableString stringWithString:input];
        [outputStr replaceOccurrencesOfString:@"&ldquo;"
                                   withString:@"“"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&rdquo;"
                                   withString:@"”"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&middot;"
                                   withString:@"-"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&mdash;"
                                   withString:@"-"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&quot;"
                                   withString:@"\""
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&lsquo;"
                                   withString:@"'"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&nbsp;"
                                   withString:@" "
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&amp;"
                                   withString:@"&"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&lt;"
                                   withString:@"<"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&gt;"
                                   withString:@" >"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&qpos;"
                                   withString:@" \' "
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"<br>"
                                   withString:@" "
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        [outputStr replaceOccurrencesOfString:@"&apos;"
                                   withString:@"'"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [outputStr length])];
        return outputStr;
    }
    
    return input;
}



//image等比例缩放方法
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size{
    
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
            
        }
        else{
            
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
        //NSLog(@"scale image fail");
        
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}




@end
