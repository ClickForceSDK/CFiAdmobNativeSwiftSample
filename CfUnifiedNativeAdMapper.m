//
//  CfUnifiedNativeAdMapper.m
//  adMobNative
//
//  Created by CF-NB on 2019/8/30.
//  Copyright © 2019年 CF-NB. All rights reserved.
//

#import "CfUnifiedNativeAdMapper.h"

@implementation CfUnifiedNativeAdMapper

- (instancetype)initWithMFNativeAd:(MFNativeAd *)cfNative adImageView:(UIImageView *)adimage
{
    if (!cfNative) {
        return nil;
    }
    self = [super init];
    
    _ClickforceNative = cfNative;
    _ClickforceAdImageView = adimage;
    
    return self;
}

- (BOOL)hasVideoContent {
    
    return _ClickforceAdImageView != nil;
    
}

- (UIView *)mediaView
{
    return _ClickforceAdImageView;
}

- (NSString *)headline
{
    return _ClickforceNative.title;
}

- (NSString *)body
{
    return _ClickforceNative.content;
}

- (NSString *)advertiser
{
    return _ClickforceNative.advertiser;
}

- (NSString *)callToAction
{
    return _ClickforceNative.buttonTitle;
}

- (void)didRenderInView:(UIView *)view clickableAssetViews:(NSDictionary<GADUnifiedNativeAssetIdentifier,UIView *> *)clickableAssetViews nonclickableAssetViews:(NSDictionary<GADUnifiedNativeAssetIdentifier,UIView *> *)nonclickableAssetViews viewController:(UIViewController *)viewController
{
    [_ClickforceNative registerElementsView:view clickView:[clickableAssetViews allValues] controllervw:viewController];//set all view click.
//    [_ClickforceNative registerElementsView:view clickView:@[view] controllervw:viewController];//set some view click.
}

- (void)didRecordImpression
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
