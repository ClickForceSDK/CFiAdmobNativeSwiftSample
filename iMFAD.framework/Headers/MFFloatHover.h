//
//  MFFloatHover.h
//  iMFAD
//
//  Created by CF-NB on 2019/10/25.
//  Copyright © 2019 Charles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol MFFloatHoverDelegate <NSObject>
@optional
/**廣告請求成功*/
-(void)onSuccessToMFFloatHover;

/**廣告請求失敗*/
-(void)onFailToMFFloatHover;

/**廣告點擊*/
-(void)onClickToMFFloatHover;

/**廣告關閉*/
-(void)onCloseToMFFloatHover;

@end

@interface MFFloatHover : UIView
@property(nonatomic, copy) NSString *bannerId;
@property(nonatomic, assign)id<MFFloatHoverDelegate>delegate;

#pragma mark 回傳SDK版本
+ (NSString *)version;

#pragma mark 開始取得廣告
- (void)requestAd;

#pragma mark 顯示取得廣告
- (void)show;

#pragma mark 設定是否輸出除錯訊息
- (void)debugInfo:(BOOL)state;

#pragma mark 設定看以滑動的View
- (void)setScrollview:(UIView *) sc;

@end
