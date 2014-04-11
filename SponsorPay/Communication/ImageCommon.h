//
//  ImageCommon.h
//  SponsorPay
//
//  Created by Faizan Ali on 4/12/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCommon : NSObject

+ (NSString*) getImagesDocumentPath;
+ (UIImage*) getImage:(NSString*)imageName;
+ (BOOL)saveImage:(UIImage*)image withName:(NSString*)imageName;
+ (BOOL)deleteImage:(NSString*)imageName;


@end
