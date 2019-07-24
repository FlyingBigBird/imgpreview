//
//  PreviewPage.h
//  LiveMall
//
//  Created by BaoBaoDaRen on 2019/7/15.
//  Copyright © 2019 Boris. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PreviewPage : UIView

// 放大缩小scrollView
@property (nonatomic, strong) UIScrollView *scrollView;

// 将imageView放在containerView避免位置偏差...
@property (nonatomic, strong) UIView *conView;

// 展示图片...
@property (nonatomic, strong) UIImageView *imgView;

// 获取图片...
@property (nonatomic, strong) UIImage *currentImg;

@property (nonatomic, assign) CGRect portraitFrame;
@property (nonatomic, assign) CGRect landscapeFrame;

@property (nonatomic, assign) CGSize imgSize;

typedef void (^SignalTapBlock)(void);
@property (nonatomic, copy) SignalTapBlock callTap;

//@property (nonatomic, assign) ClientOrientationMask deviceDirection;



- (void) loadImage:(UIImage *)image;

- (void) imageWithUrl:(NSString *)imgUrl;

@end


NS_ASSUME_NONNULL_END
