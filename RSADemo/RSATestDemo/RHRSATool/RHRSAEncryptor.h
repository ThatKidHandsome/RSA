//
//  RHRSAEncryptor.h
//  RSATestDemo
//
//  Created by Yoki on 17/3/2.
//  Copyright © 2017年 Yoki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHRSAEncryptor : NSObject
/**
 *  加密方法
 *
 *  @param str   需要加密的字符串
 *  @param path  '.der'格式的公钥文件路径
 */
+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;
/**
 *  解密方法
 *
 *  @param str       需要解密的字符串
 *  @param path      '.p12'格式的私钥文件路径
 *  @param password  私钥文件密码
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;
/**
 *  加密方法
 *
 *  @param str    需要加密的字符串
 *  @param pubKey 公钥字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
/**
 *  解密方法
 *
 *  @param str     需要解密的字符串
 *  @param privKey 私钥字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

/**
 *  十六进制字符串转换成NSData
 */
+ (NSData *)convertHexStrToData:(NSString *)str ;
/**
 *  将NSData转换成十六进制的字符串
 */
+ (NSString *)convertDataToHexStr:(NSData *)data;
/**
 *  生成密钥对
 */
+ (void)keyWith:(void(^)(NSString *publicKey, NSString *privateKey))block;

@end
