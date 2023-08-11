//
//  AdMobCustomAdapter.m
//  CFiAdmobSample
//
//  Created by CF-NB on 2023/3/17.
//  Copyright © 2023 clickforce. All rights reserved.
//

#import "AdMobCustomAdapter.h"
#import "AdMobNativeCustomAD.h"


@implementation AdMobCustomAdapter {
    AdMobNativeCustomAD *customAd;
}


#pragma mark GADMediationAdapter implementation

+ (GADVersionNumber)adSDKVersion {
    GADVersionNumber version = {0};
    NSString *ver = [MFNativeAd version];
    NSArray *verSplit = [ver componentsSeparatedByString:@"."];
    if (verSplit.count >= 3) {
        version.majorVersion = [verSplit[0] integerValue];
        version.minorVersion = [verSplit[1] integerValue];
        version.patchVersion = [verSplit[2] integerValue];
    }
    return version;
}

+ (Class<GADAdNetworkExtras>)networkExtrasClass {
    return [AdMobCustomAdapter class];
}

+ (GADVersionNumber)adapterVersion {
    GADVersionNumber version = {0};
    NSString *ver = [MFNativeAd version];
    NSArray *verSplit = [ver componentsSeparatedByString:@"."];
    if (verSplit.count >= 3) {
        version.majorVersion = [verSplit[0] integerValue];
        version.minorVersion = [verSplit[1] integerValue];
        version.patchVersion = [verSplit[2] integerValue] * 100;
    }
    return version;
}

+ (void)setUpWithConfiguration:(GADMediationServerConfiguration *)configuration completionHandler:(GADMediationAdapterSetUpCompletionBlock)completionHandler {
    completionHandler(nil);
}

- (void)loadNativeAdForAdConfiguration:(GADMediationNativeAdConfiguration *)adConfiguration completionHandler:(GADMediationNativeLoadCompletionHandler)completionHandler {
    customAd = [[AdMobNativeCustomAD alloc] init];
    [customAd loadNativeAdForAdConfiguration:adConfiguration completionHandler:completionHandler];
}


@end
