//
//  ViewController.m
//  数据加密
//
//  Created by cguo on 2017/5/4.
//  Copyright © 2017年 YX. All rights reserved.
//

#import "ViewController.h"
#import "CommonFunc.h"
#import "NSString+Encrypt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    NSString *str=@"我们的看到撒打款收款";
    NSString *baseStr=[CommonFunc base64StringFromText:str];
    NSLog(@"%@",baseStr);
    
    NSLog(@"%@",[str MD5FromString]);
    
    [self base64];
    [self md5];
    [self AES];
    [self DES];
    [self RSA];
}

- (void)base64 {
    NSLog(@"base64编码-->\n%@",[@"A" base64EncodeString]);
    NSLog(@"base64解码-->\n%@",[@"QQ==" base64DecodeString]);
}

#pragma mark - 哈希(散列)函数
- (void)md5 {
    // MD5
    NSLog(@"MD5加密-->%@",[@"123LN34*" md5String]);
    // MD5-->598eb1a985449913bfb54ed6e0a58510
    
    // (明文+加盐)MD5
    NSLog(@"(明文+加盐)MD5-->\n%@",[[@"123LN" stringByAppendingString:salt] md5String]);
    
    // 先加密+乱序
    NSLog(@"先加密+乱序-->\n%@",[@"123LN" hmacMD5StringWithKey:@"iOShangzhou"]);
    
    // sha1对字符串加密
    NSLog(@"sha1对字符串加密-->\n%@",[@"123LN" sha1String]);
    
    // sha256对字符串加密
    NSLog(@"sha256对字符串加密-->\n%@",[@"123LN" sha256String]);
    
    // sha512对字符串加密
    NSLog(@"sha512对字符串加密-->\n%@",[@"123LN" sha1String]);
}

-(void)AES
{
    // encryWithPublicKey
    NSString *str = [AES encrypt:@"LN123" keyString:@"SDTUJZLI"];
    NSLog(@"AES公钥加密数据-->\n%@",str);
    
    // decryWithPriviteKey
    NSString *str1 = [AES decrypt:str keyString:@"SDTUJZLI"];
    NSLog(@"AES私钥解密数据-->\n%@",str1);
}


-(void)DES
{
    NSString *str = [DES3Util encryptUseDES:@"LN123" keyString:@"syh"];
    NSLog(@"DES公钥加密数据-->\n%@",str);
    
    NSString *str1 = [DES3Util decryptUseDES:str keyString:@"syh"];
    NSLog(@"DES私钥解密数据-->\n%@",str1);
}

//---------------------------我是分割线------------------------------//
//
-(void)RSA
{
    NSString *str = [RSAUtil encryptString: @"LN" publicKey:RSA_Public_key];
    NSLog(@"RSA公钥加密数据-->\n%@",str);
    
    NSString *str1 = [RSAUtil decryptString:str privateKey:RSA_Privite_key];
    NSLog(@"RSA私钥解密数据-->\n%@",str1);
}

/**
 注意：
 RSA 这里用模拟器的话需要配置一下
 选 TARGETS-->Capabilities-->Keychain Sharing 打开就OK
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
