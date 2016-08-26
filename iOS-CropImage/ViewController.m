//
//  ViewController.m
//  iOS-CropImage
//
//  Created by colin on 16/7/3.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+CropImage.h"

@interface ViewController ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *button;

@end

@implementation ViewController

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *imageView = [UIImageView new];
        
        [imageView setBackgroundColor:[UIColor lightGrayColor]];
        [imageView setContentMode:UIViewContentModeCenter];
        [imageView setImage:[UIImage imageNamed:@"demo.png"]];
        
        [self.view addSubview:imageView];
        self.imageView = imageView;
    }
    return _imageView;
}

- (UIButton *)button
{
    if (!_button)
    {
        UIButton *button = [UIButton new];
        
        [button setBackgroundColor:[UIColor cyanColor]];
        [button setTitle:@"Crop Image" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(cropImage) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        self.button = button;
    }
    return _button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.button.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 44, [UIScreen mainScreen].bounds.size.width, 44);
    
    self.imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
}

- (void)cropImage
{
    UIImage *image = [UIImage imageNamed:@"demo"];
    
    image = [image imageByCropToSquare];
//    image = [image imageByCropStyle:UIImageCropStyleTop];
//    image = [image imageByCropStyle:UIImageCropStyleBottom];
//    image = [image imageByCropStyle:UIImageCropStyleLeft];
//    image = [image imageByCropStyle:UIImageCropStyleRight];
//    image = [image imageByCropToRect:CGRectMake(0, 0, 100, 100)];
//    image = [image imageByCropToRect:CGRectMake(0, 0, 100, 100) scale:NO];
    
    [self.imageView setImage:image];
}

@end
