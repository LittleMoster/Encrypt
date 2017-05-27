//
//  NSString+Encrypt.m
//  数据加密
//
//  Created by cguo on 2017/5/5.
//  Copyright © 2017年 YX. All rights reserved.
//

#import "NSString+Encrypt.h"
#import "MD5Tool.h"
#import "CommonFunc.h"
@implementation NSString (Encrypt)




-(NSString *)MD5FromString
{
    return [MD5Tool MD5FromString:self];
}

-(NSString *)Base64strToString
{
    return [CommonFunc textFromBase64String:self];
}

-(NSString *)StringToBase64
{
     return [CommonFunc base64StringFromText:self];
}
@end
