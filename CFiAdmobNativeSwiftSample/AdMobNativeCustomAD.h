//
//  AdMobNativeCustomAD.h
//  CFiAdmobNativeSample
//
//  Created by CF-NB on 2023/8/6.
//  Copyright © 2023 CF-NB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iMFAD/iMFAD.h>
@import GoogleMobileAds;

@interface AdMobNativeCustomAD : NSObject
- (void)loadNativeAdForAdConfiguration:(GADMediationNativeAdConfiguration *)adConfiguration
                     completionHandler:(GADMediationNativeLoadCompletionHandler) adHandler;
@end
