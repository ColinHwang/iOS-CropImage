//
//  UIImage+CropImage.h
//  iOS-CropImage
//
//  Created by colin on 16/7/3.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIImageCropStyle) {  // CropStylt   裁切类型
    UIImageCropStyleLeft = 0,                   // Left-Part   左半部分
    UIImageCropStyleRight,                      // Right-Part  右半部分
    UIImageCropStyleCenter,                     // Center-Part 中间部分
    UIImageCropStyleTop,                        // Top-Part    上半部分
    UIImageCropStyleBottom,                     // Bottom-Part 下半部分
};

@interface UIImage (CropImage)

/**
 *  Returns a new image which is cropped to a foursquare image. The rect of original image should be rectangle. The content of new image is the center-part of the original. The width of foursquare image is base on the width of orignal image.
 */
- (UIImage *)imageByCropToSquare;

/**
 *  Returns a new image which is cropped by specified style. The rect of original image should be rectangle.
 *
 *  @param style  Cropped style.
 */
- (UIImage *)imageByCropStyle:(UIImageCropStyle)style;

/**
 *  Returns a new image which is cropped from this image in a speicial rect. The new image is under Pixel.
 *
 *  @param rect  Cropped rect.
 */
- (UIImage *)imageByCropToRect:(CGRect)rect;

/**
 *  Returns a new image which is cropped from this image in a speicial rect and scale.
 *
 *  @param rect  Cropped rect.
 *  @param scale Scale(It determines the new image is under Pixel or Dot)
 */
- (UIImage *)imageByCropToRect:(CGRect)rect scale:(BOOL)scale;

@end
