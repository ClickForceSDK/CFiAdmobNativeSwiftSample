//
//  MFAdMaglev.h
//  iMFAD
//
//  Created by CF-NB on 2019/4/30.
//  Copyright © 2019年 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@protocol MFAdMaglevDelegate <NSObject>
@optional
/**廣告請求成功*/
- (void)onSuccessToMFAdMaglev;

/**廣告請求失敗*/
- (void)onFailToMFAdMaglev;

/**廣告點擊*/
- (void)onClickToMFAdMaglev;

/**廣告關閉*/
- (void)onCloseToMFAdMaglev;

@end

@interface MFAdMaglev : UIView
@property (nonatomic, copy) NSString *bannerId;
@property(nonatomic, assign)id<MFAdMaglevDelegate>delegate;

#pragma mark 回傳SDK版本
+ (NSString *)version;

#pragma mark 開始取得廣告
- (void)requestAd;

#pragma mark 顯示取得廣告
- (void)show;

#pragma mark 設定是否輸出除錯訊息
- (void)debugInfo:(BOOL)state;
@end


