//
//  AdMobNativeCustomAD.m
//  CFiAdmobNativeSample
//
//  Created by CF-NB on 2023/8/6.
//  Copyright © 2023 CF-NB. All rights reserved.
//

#import "AdMobNativeCustomAD.h"
#include <stdatomic.h>
#import <iMFAD/MFNativeAd.h>
#import <Foundation/Foundation.h>

@interface AdMobNativeCustomAD()<MFNativeDelegate, GADMediationNativeAd>{
    MFNativeAd *cfNative;
    UIImageView *adImageView;
    
    GADMediationNativeLoadCompletionHandler _loadCompletionHandler;
    id<GADMediationNativeAdEventDelegate> _adEventDelegate;
    
}

@end

@implementation AdMobNativeCustomAD

- (void)loadNativeAdForAdConfiguration:(GADMediationNativeAdConfiguration *)adConfiguration completionHandler:(GADMediationNativeLoadCompletionHandler)adHandler {
    __block atomic_flag completionHandlerCalled = ATOMIC_FLAG_INIT;
    __block GADMediationNativeLoadCompletionHandler originalCompletionHandler = [adHandler copy];

    _loadCompletionHandler = ^id<GADMediationNativeAdEventDelegate>(_Nullable id<GADMediationNativeAd> ad, NSError *_Nullable error) {
        // Only allow completion handler to be called once.
        if (atomic_flag_test_and_set(&completionHandlerCalled)) {
          return nil;
        }

        id<GADMediationNativeAdEventDelegate> delegate = nil;
        if (originalCompletionHandler) {
          // Call original handler and hold on to its return value.
          delegate = originalCompletionHandler(ad, error);
        }

        // Release reference to handler. Objects retained by the handler will also
        // be released.
        originalCompletionHandler = nil;

        return delegate;
    };
    
    NSString *zoneId = adConfiguration.credentials.settings[@"parameter"];
    NSLog(@"Clickforce zoneId: %@", zoneId);
    
    cfNative = [[MFNativeAd alloc] init];
    cfNative.bannerId = zoneId;
    [cfNative debugInfo:YES];
    cfNative.delegate = self;
    [cfNative requestAd];
}

#pragma GADMediationNativeAd
- (BOOL)hasVideoContent {
    return adImageView != nil;
}

- (UIView *)mediaView {
    return adImageView;
}

- (NSString *)headline {
    return cfNative.title;
}

- (NSString *)body {
    return cfNative.content;
}

- (NSString *)advertiser {
    return cfNative.advertiser;
}

- (NSString *)callToAction {
    return cfNative.buttonTitle;
}

- (BOOL)handlesUserClicks {
    return YES;
}


- (BOOL)handlesUserImpressions {
    return NO;
}

- (void)didRenderInView:(UIView *)view clickableAssetViews:(NSDictionary<GADNativeAssetIdentifier,UIView *> *)clickableAssetViews nonclickableAssetViews:(NSDictionary<GADNativeAssetIdentifier,UIView *> *)nonclickableAssetViews viewController:(UIViewController *)viewController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [cfNative registerElementsView:view clickView:[clickableAssetViews allValues] controllervw:viewController];//set all view click.
//    [_ClickforceNative registerElementsView:view clickView:@[view] controllervw:viewController];//set some view click.
}

- (void)didRecordImpression
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

#pragma MFNative
- (void)onMFNativeAdDidLoad:(MFNativeAd *)nativeAd {
    if(nativeAd.coverImg == nil) {
        _loadCompletionHandler(nil, [[NSError alloc] initWithDomain:GADErrorDomain code:GADErrorMediationDataError userInfo:nil]);
    } else {
        adImageView = [[UIImageView alloc] init];
        [nativeAd.coverImg loadImageAsyncWithBlock:^(UIImage * _Nullable image) {
            adImageView.image = image;
        }];
        _loadCompletionHandler(self, nil);
    }
}

- (void)onMFNativeAdRequestFail {
    NSError *error = [[NSError alloc] initWithDomain:GADErrorDomain code:GADErrorNoFill userInfo:nil];
      _adEventDelegate = _loadCompletionHandler(nil, error);
}

- (void)onMFNativeAdClick:(MFNativeAd *)nativeAd {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [GADMediatedUnifiedNativeAdNotificationSource mediatedNativeAdDidRecordClick:self];
}

@end
