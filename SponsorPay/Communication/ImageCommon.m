//
//  ImageCommon.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/12/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import "ImageCommon.h"
#import <CommonCrypto/CommonDigest.h>

#define kImagesFolder @"ImagesFolder"
#define kImages @"Images"

@implementation ImageCommon


+ (NSString*)cacheImageName:(NSString*)key {
    const char *str = [key UTF8String];
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), r);
    NSString *filename = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    return filename;
}


+ (NSString*) getImagesDocumentPath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:kImagesFolder]];
    if (![[NSFileManager defaultManager]fileExistsAtPath:path]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"/"]];
    return path;
}

+ (UIImage*) getImage:(NSString*)imageName {
    //imageName = [imageName stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    imageName = [self cacheImageName:imageName];
    NSString *path = [ImageCommon getImagesDocumentPath];
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:kImages]];
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        return [UIImage imageWithContentsOfFile:path];
    }
    return nil;
}

+ (BOOL)saveImage:(UIImage*)image withName:(NSString*)imageName {
    //imageName = [imageName stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    imageName = [self cacheImageName:imageName];
    NSString *path = [ImageCommon getImagesDocumentPath];
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:kImages]];
    if (![[NSFileManager defaultManager]fileExistsAtPath:path]) {
        [[NSFileManager defaultManager]createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
    return [UIImagePNGRepresentation(image) writeToFile:path atomically:NO];
}

+ (BOOL)deleteImage:(NSString*)imageName {
    if (!imageName) {
        return NO;
    }
    //    imageName = [imageName stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    //    imageName = [imageName stringByReplacingOccurrencesOfString:@"*" withString:@"_"];
    //    imageName = [imageName stringByReplacingOccurrencesOfString:@"?" withString:@"_"];
    imageName = [self cacheImageName:imageName];
    NSString *path = [ImageCommon getImagesDocumentPath];
    path = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
    if ([[NSFileManager defaultManager]isDeletableFileAtPath:path]) {
        NSError *error = nil;
        [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
        return YES;
    }
    return NO;
}

@end
