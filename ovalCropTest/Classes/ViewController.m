//
//  ViewController.m
//  ovalCropTest
//
//  Created by abdus on 2/15/13.
//  Copyright (c) 2013 www.abdus.me All rights reserved.
//

#import "ViewController.h"
#include <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark
#pragma mark VD Delegate
- (void)viewDidLoad
{
    [super viewDidLoad];
    [imageView setImage:[UIImage imageNamed:@"president.jpg"]];
}


#pragma mark
#pragma mark Util
- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    
	CGImageRef imgRef = [image CGImage];
    CGImageRef maskRef = [maskImage CGImage];
    CGImageRef actualMask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                              CGImageGetHeight(maskRef),
                                              CGImageGetBitsPerComponent(maskRef),
                                              CGImageGetBitsPerPixel(maskRef),
                                              CGImageGetBytesPerRow(maskRef),
                                              CGImageGetDataProvider(maskRef), NULL, false);
    CGImageRef masked = CGImageCreateWithMask(imgRef, actualMask);
    return [UIImage imageWithCGImage:masked];
    
}



#pragma mark
#pragma mark IBActions
- (IBAction)maskButtonClicked:(id)sender
{
    imageView.image = [self maskImage:imageView.image withMask:[UIImage imageNamed:@"mask"]];
}


#pragma mark
#pragma mark dealloc
- (void)dealloc
{
    [imageView release];
    [super dealloc];
}
@end
