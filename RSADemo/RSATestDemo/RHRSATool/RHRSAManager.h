//
//  RHRSAManager.h
//  RSATestDemo
//
//  Created by Yoki on 17/3/7.
//  Copyright © 2017年 Yoki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHRSAManager : NSObject

/**
 *  使用公钥加密
 *
 *  @param content    加密内容
 *  @param publickKey 公钥
 *
 *  @return 加密后的十六进制数据
 */
+(NSString *)encryptContent:(NSString *)content withPublicKey:(NSString *)publickKey;
/**
 *  使用私钥解密
 *
 *  @param content    解密内容
 *  @param privateKey 私钥
 *
 *  @return 解密后的字符串
 */
+(NSString *)decodeContent:(NSString *)content withPrivateKey:(NSString *)privateKey;

/**
 *  获取密钥对
 */
+ (void)getKeysWith:(void(^)(NSString *publicKey, NSString *privateKey))block;

@end
