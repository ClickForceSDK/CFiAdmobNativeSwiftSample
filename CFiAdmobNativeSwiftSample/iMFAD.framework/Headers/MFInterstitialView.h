//
//  MFInterstitialView.h
//  iMFAD
//
//  Created by Charles on 2017/8/3.
//  Copyright © 2017年 clickforce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol MFInterstitialViewDelegate <NSObject>

@optional
/**
 請求廣告失敗
 */
- (void)onRequestItstAdFail;

/**
 成功請求廣告
 */
- (void)onRequestItstAdSuccess;

/**
 蓋版廣告點擊後
 */
- (void)onClickItst;

/**
 關閉蓋板廣告後
 */
- (void)onCloseItst;

/**
 選擇無框蓋版廣告，取得蓋版廣告方法

 @param adInterstitialView 蓋版廣告
 */
- (void)onNotCloseBtnItst:(UIView *)adInterstitialView;

@end


@interface MFInterstitialView : UIView
@property(nonatomic, strong) AVPlayer *contentPlayer;
@property (nonatomic, copy) NSString *bannerId;
@property(nonatomic, assign)UIViewController *rootViewController;
@property(nonatomic, assign)id<MFInterstitialViewDelegate>delegate;
- (id)initWithNlbs;
- (id)initWithGpointNlbs:(CGPoint)origin;

#pragma mark 取得MFInterstitial物件
- (id)initWithGpoint:(CGPoint)origin;

#pragma mark 開始取得全版廣告
- (void)requestFullScreenAD;

#pragma mark 顯示取得廣告
- (void)show;

#pragma mark 設定是否輸出除錯訊息
- (void)debugInfo:(BOOL)state;

@end
