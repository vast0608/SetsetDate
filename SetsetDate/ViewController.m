//
//  ViewController.m
//  SetsetDate
//
//  Created by 上海烨历网络科技有限公司 on 2017/6/21.
//  Copyright © 2017年 上海烨历网络科技有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //2017-06-21T11:08:16+08:00


    //NSLog(@"---%@",[self timeStr:@"2017-06-21T11:08:18+08:00"]);
    NSString *str1 = [self timeChangeTimestampStr:@"2017-06-21T11:08:16+08:00"];
    NSString *str2 = [self timeChangeTimestampStr:@"2017-06-21T11:08:17+08:00"];
    NSString *str3 = [self timeChangeTimestampStr:@"2017-06-21T11:08:18+08:00"];
    NSArray *arr = @[str1,str2,str3];
    
    
    
    //冒泡排序
    NSMutableArray * array = [NSMutableArray arrayWithArray:arr];
    //选择
    
    for (int  i =0; i<[array count]-1; i++) {
        
        for (int j = i+1; j<[array count]; j++) {
            
            if ([array[i] intValue]>[array[j] intValue]) {
                
                //交换
                
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
                
            }
            
        }
        
    }
    
    NSString *time = [self timestampChangeTimeStr:array[0]];
    
    NSLog(@"最小时间为：%@",time);
    
    
    
    
    
    
    
}
//时间转时间戳
-(NSString *)timeChangeTimestampStr:(NSString *)timeChangeTimestampStr{

    NSString *time1= [timeChangeTimestampStr substringWithRange:NSMakeRange(0,10)];
    NSString *time2= [timeChangeTimestampStr substringWithRange:NSMakeRange(11,8)];
    NSString *time = [NSString stringWithFormat:@"%@ %@",time1,time2];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:time];
    NSTimeInterval timeLines=[date timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", timeLines]; //转为字符型
    
    return timeString;
}
//时间戳转时间
-(NSString *)timestampChangeTimeStr:(NSString *)timestampChangeTimeStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timestampChangeTimeStr integerValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}



@end
