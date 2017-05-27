//
//  NSString+Encrypt.h
//  数据加密
//
//  Created by cguo on 2017/5/5.
//  Copyright © 2017年 YX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)


-(NSString *)MD5FromString;

-(NSString *)Base64strToString;

-(NSString *)StringToBase64;


@end
