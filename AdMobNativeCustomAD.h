#import <Foundation/Foundation.h>
#import <iMFAD/MFNativeAd.h>
#import "CfUnifiedNativeAdMapper.h"
@import GoogleMobileAds;

@interface AdMobNativeCustomAD : NSObject<MFNativeDelegate,GADCustomEventNativeAd,GADMediationNativeAdEventDelegate>
{
    MFNativeAd *cfNative;
    UIImageView *adImageView;
}

@property(nonatomic, assign)id delegate;

@end
