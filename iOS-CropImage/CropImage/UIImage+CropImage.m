//
//  UIImage+CropImage.m
//  iOS-CropImage
//
//  Created by colin on 16/7/3.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "UIImage+CropImage.h"

@implementation UIImage (CropImage)

- (UIImage *)imageByCropToSquare
{
    return [self imageByCropStyle:UIImageCropStyleCenter];
}

- (UIImage *)imageByCropStyle:(UIImageCropStyle)style
{
    CGFloat cropX = 0, cropY = 0, cropWidth = self.size.width, cropHeight = self.size.height;
    
    if (style == UIImageCropStyleLeft)
    {
        cropWidth /= 2;
    }
    else if (style == UIImageCropStyleRight)
    {
        cropWidth /= 2;
        cropX = cropWidth;
    }
    else if (style == UIImageCropStyleCenter)
    {
        if (cropWidth > cropHeight)
        {
            cropX = (cropWidth - cropHeight)/2;
            cropWidth = cropHeight;
        }
        else if (cropWidth < cropHeight)
        {
            cropY = (cropHeight - cropWidth)/2;
            cropHeight = cropWidth;
        }
    }
    else if (style == UIImageCropStyleTop)
    {
        cropHeight /= 2;
    }
    else if (style == UIImageCropStyleBottom)
    {
        cropHeight /= 2;
        cropY = cropHeight;
    }
    
    return [self imageByCropToRect:CGRectMake(cropX, cropY, cropWidth, cropHeight)];
}

- (UIImage *)imageByCropToRect:(CGRect)rect
{
    return [self imageByCropToRect:rect scale:YES];
}

- (UIImage *)imageByCropToRect:(CGRect)rect scale:(BOOL)scale
{
    if (scale)
    {
        rect.origin.x *= self.scale; // Point -> Px
        rect.origin.y *= self.scale;
        rect.size.width *= self.scale;
        rect.size.height *= self.scale;
    }
    if (rect.size.width <= 0 || rect.size.height <= 0) return nil;
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return image;
}



@end
