#import "AdMobNativeCustomAD.h"
#import <iMFAD/MFBannerView.h>
#import "CfUnifiedNativeAdMapper.h"


@implementation AdMobNativeCustomAD
{
    CfUnifiedNativeAdMapper *cfN;
}

@synthesize delegate;

- (void)requestNativeAdWithParameter:(nonnull NSString *)serverParameter
                             request:(nonnull GADCustomEventRequest *)request
                             adTypes:(nonnull NSArray *)adTypes
                             options:(nonnull NSArray *)options
                  rootViewController:(nonnull UIViewController *)rootViewController
{
    cfNative = [[MFNativeAd alloc] init];
    cfNative.bannerId = serverParameter;
    [cfNative debugInfo:YES];
    cfNative.delegate = self;
    [cfNative requestAd];
    
    
}

- (BOOL)handlesUserClicks {
    return YES;
}


- (BOOL)handlesUserImpressions {
    return NO;
}


- (void)onMFNativeAdDidLoad:(MFNativeAd *)nativeAd
{
    NSLog(@"onMFNativeAdDidLoad");
    adImageView = [[UIImageView alloc] init];
    [nativeAd.coverImg loadImageAsyncWithBlock:^(UIImage * _Nullable image) {
        adImageView.image = image;
    }];
    
    cfN = [[CfUnifiedNativeAdMapper alloc] initWithMFNativeAd:nativeAd adImageView:adImageView];
    
    [self.delegate customEventNativeAd:self didReceiveMediatedUnifiedNativeAd:cfN];
}

- (void)onMFNativeAdClick:(MFNativeAd *)nativeAd
{
    NSLog(@"onMFNativeAdClick");
    [GADMediatedNativeAdNotificationSource mediatedNativeAdDidRecordClick:cfN];
    [GADMediatedNativeAdNotificationSource mediatedNativeAdWillLeaveApplication:cfN];
}

- (void)onMFNativeAdRequestFail
{
    [self.delegate customEventNativeAd:self didFailToLoadWithError:[[NSError alloc] initWithDomain:kGADErrorDomain code:kGADErrorNoFill userInfo:nil]];
    NSLog(@"onMFNativeAdRequestFail");
}


@end
