//
//  ViewController.m
//  Demo_ChineseToPinYin
//
//  Created by Ihefe_Hanrovey on 16/8/30.
//  Copyright © 2016年 Ihefe_Hanrovey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *string_before = @"江一燕";
    NSString *string_after = @"";
    string_after = [self transformChineseToPinyin:string_before];
    
    NSLog(@"转换前-----%@    转换后-----%@",string_before,string_after);
}

// 汉字转拼音
- (NSString *)transformChineseToPinyin:(NSString *)chinese{
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [chinese mutableCopy];
    
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    
    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    //返回最近结果
    return pinyin;
    
}

@end
