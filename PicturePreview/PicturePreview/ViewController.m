//
//  ViewController.m
//  PicturePreview
//
//  Created by BaoBaoDaRen on 2019/7/24.
//  Copyright © 2019 Boris. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) PreviewList *imgList;

@end


@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationDidChange)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];

    self.currentWidth = self.view.frame.size.width;
    self.currentHeight = self.view.frame.size.height;
    
    self.imgList = [[PreviewList alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    NSArray *imgArr = @[[UIImage imageNamed:@"longimgpic"],[UIImage imageNamed:@"picBg"],[UIImage imageNamed:@"headImg"],[UIImage imageNamed:@"goodPic"],[UIImage imageNamed:@"longimgpic"]];
    [self.imgList refreshImages:imgArr atIndex:0];
    [self.view addSubview:self.imgList];
    
    if (@available(iOS 11.0, *)) {
        self.imgList.colView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
}
- (void)orientationDidChange
{
    NSLog(@"width:%f  =====  height:%f ",self.view.bounds.size.width,self.view.bounds.size.height);
    
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    UIInterfaceOrientation interfaceOrientation = (UIInterfaceOrientation)orientation;
    NSLog(@"orientation:%ld",(long)interfaceOrientation);
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        
        self.imgList.frame = CGRectMake(0, 0, self.currentHeight, self.currentWidth);
    } else if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        
        self.imgList.frame = CGRectMake(0, 0, self.currentWidth, self.currentHeight);
    } else {
        
    }
}

@end
