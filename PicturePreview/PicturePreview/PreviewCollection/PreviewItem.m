//
//  PreviewItem.m
//  LiveMall
//
//  Created by BaoBaoDaRen on 2019/7/15.
//  Copyright © 2019 Boris. All rights reserved.
//

#import "PreviewItem.h"
#import "PreviewPage.h"

@interface PreviewItem ()

@property (nonatomic, strong) PreviewPage *imgPage;

@end

@implementation PreviewItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self showUI];
    }
    return self;
}
- (void)showUI
{
    self.imgPage = [[PreviewPage alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.contentView addSubview:self.imgPage];
}

- (void) localImage:(UIImage *)image
{
    [self.imgPage loadImage:image];
}

- (void) webImageUrl:(NSString *)imgUrl
{
    [self.imgPage imageWithUrl:imgUrl];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imgPage.frame = self.contentView.bounds;
}

@end
