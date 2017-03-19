//
//  RHRSAManager.m
//  RSATestDemo
//
//  Created by Yoki on 17/3/7.
//  Copyright © 2017年 Yoki. All rights reserved.
//

#import "RHRSAManager.h"
#import "RHRSAEncryptor.h"
#import "NSData+Base64.h"

@implementation RHRSAManager

+ (NSString *)encryptContent:(NSString *)password withPublicKey:(NSString *)publickKey {
    NSString *passwordStr = [RHRSAEncryptor encryptString:password publicKey:publickKey];
    NSData *pwdData = [[NSData alloc] initWithBase64EncodedString:passwordStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *pwdHexString = [RHRSAEncryptor convertDataToHexStr:pwdData];
    return pwdHexString;
}

+ (NSString *)decodeContent:(NSString *)content withPrivateKey:(NSString *)privateKey {
    NSString *token = [RHRSAEncryptor decryptString:[[RHRSAEncryptor convertHexStrToData:content] base64EncodedString] privateKey:privateKey];
    return token;
}

+ (void)getKeysWith:(void(^)(NSString *publicKey, NSString *privateKey))block {
    [RHRSAEncryptor keyWith:^(NSString *publicKey, NSString *privateKey) {
        block (publicKey,privateKey);
    }];
    
}

@end
