//
//  CfUnifiedNativeAdMapper.h
//  adMobNative
//
//  Created by CF-NB on 2019/8/30.
//  Copyright © 2019年 CF-NB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iMFAD/iMFAD.h>
@import GoogleMobileAds;
NS_ASSUME_NONNULL_BEGIN

@interface CfUnifiedNativeAdMapper : NSObject<GADMediatedUnifiedNativeAd,GADMediationNativeAd>
@property(nonatomic, strong) MFNativeAd *ClickforceNative;
@property(nonatomic, strong) UIView *ClickforceAdImageView;

- (null_unspecified instancetype)init NS_UNAVAILABLE;

- (nullable instancetype) initWithMFNativeAd:(nonnull MFNativeAd *)cfNative adImageView:(nullable UIImageView *)adimage NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
