//
//  MFAdInnerInterstitalView.h
//  iMFAD
//
//  Created by CF-NB on 2019/1/22.
//  Copyright © 2019年 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol MFAdInnerInterstitalViewDelegate <NSObject>

@optional
/**
 請求廣告失敗
 */
- (void)onRequestInnerItstAdFail;

/**
 成功請求廣告
 */
- (void)onRequestInnerItstAdSuccess;

/**
 蓋版廣告點擊後
 */
- (void)onClickInnerItst;


@end

@interface MFAdInnerInterstitalView : UIView
@property(nonatomic, strong) AVPlayer *contentPlayer;
@property (nonatomic, copy) NSString *bannerId;
@property(nonatomic, assign)UIViewController *rootViewController;
@property(nonatomic, assign)id<MFAdInnerInterstitalViewDelegate>delegate;
#pragma mark 取得MFInterstitial物件
- (id)initWithAGpoint:(CGPoint)origin;

#pragma mark 開始取得全版廣告
- (void)requestInnerFullScreenAD;

#pragma mark 設定外部的ScrollView
-(void)setOutSiteScrollview:(UIScrollView *)oscrollview;

#pragma mark 設定是否輸出除錯訊息
- (void)debugInfo:(BOOL)state;

#pragma mark 顯示取得廣告
- (void)show;

#pragma mark 廣告位置調整
- (void) addYAbsoluteErrorValue:(CGFloat)value;
@end
