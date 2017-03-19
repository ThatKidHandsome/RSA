//
//  ViewController.m
//  RSATestDemo
//
//  Created by Yoki on 17/3/1.
//  Copyright © 2017年 Yoki. All rights reserved.
//

#import "ViewController.h"
#import <openssl/rsa.h>
#import <openssl/pem.h>
#import "RHRSAEncryptor.h"
#import "NSData+Base64.h"
#import "RHRSAManager.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSString *privateKey;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [self DecodeBackData];
    [self encryptData];
    
}

/* START: 后台调试内容 */
#pragma mark 使用公钥加密数据
- (void)encryptData {
    /*******获取秘钥对*******/
    __weak typeof(self) weakSelf = self;
    [RHRSAManager getKeysWith:^(NSString *publicKey, NSString *privateKey) {
        weakSelf.publicKey = publicKey;
        weakSelf.privateKey = privateKey;
        
    }];
    NSString *originalString = @"这是明文";
    NSString *hexString = [RHRSAManager encryptContent:originalString withPublicKey:self.publicKey];
    NSLog(@"传给后台的16进制数据:%@",hexString);
    /****自测****/
  NSLog(@"16进制字符串解密后:%@",[RHRSAManager decodeContent:hexString withPrivateKey:self.privateKey]);
    
    
}



@end
