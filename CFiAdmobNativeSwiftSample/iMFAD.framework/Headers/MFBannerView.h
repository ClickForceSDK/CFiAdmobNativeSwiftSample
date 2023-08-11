#import <UIKit/UIKit.h>

typedef enum {
	Alignment_Left ,
    Alignment_Center,
    Alignment_Right
} Alignment;



#pragma mark MFAdSize
typedef struct  MFAdSize {
    CGSize size;
    NSUInteger  type;
}MFAdSize;

extern MFAdSize const MFAdSizeFullScreen;           // 全版畫面廣告
extern MFAdSize const MFAdSize320X50;               // use for 320 * 50
extern MFAdSize const MFAdSize468X60;           // use for 468 * 60 for iPad
extern MFAdSize const MFAdSize728X90;          // use for 728 * 90 for iPad
extern MFAdSize const MFAdSize300X250;      // use for 300 * 250
extern MFAdSize const MFAdSize300X100;      // use for 300 * 100
extern MFAdSize const MFAdSize200X40;      // use for 300 * 100
extern MFAdSize const MFAdSize320X100;
extern MFAdSize const MFAdSize336X280;     // use for 336 * 280




// 回傳 MFAdSize 的 CGSize
CGSize MFCGSizeFromGADAdSize(MFAdSize size);


@class MFBannerView;
@protocol MFBannerDelegate <NSObject>

@optional

/**
 請求廣告失敗
 */
- (void)requestAdFail;

/**
 成功請求廣告
 */
- (void)requestAdSuccess;

/**
 點擊廣告後
 */
- (void)onClickAd;
@end


@interface MFBannerView : UIView

@property (nonatomic, copy) NSString *bannerId;
@property(nonatomic, assign)UIViewController *rootViewController;
@property(nonatomic, assign)id<MFBannerDelegate> delegate;


#pragma mark 回傳SDK版本
+ (NSString *)version;

#pragma mark 設定是否輸出除錯訊息
- (void)debugInfo:(BOOL)state;

#pragma mark 取得MFBanner物件
- (id)initWithAdSize:(MFAdSize)size origin:(CGPoint)origin;

#pragma mark 取得MFBanner物件 位置預設為(0,0)
- (id)initWithAdSize:(MFAdSize)size;

#pragma mark 開始取得廣告
- (void)requestAd;

#pragma mark 顯示取得廣告
- (void)show;

#pragma mark 設定廣告是否自動更新
- (void)setAdAutoRefresh:(BOOL)state;


#pragma mark - 設定背景顏色
- (void)setBannerBackgroudColor:(UIColor *)color;

#pragma mark - 設定對齊方式
- (void)setBannerAlignment:(int)alignment;

#pragma mark - 如果Ad有設定在Scrollview上
-(void)setScrollviewName:(UIView *)uscro;

#pragma mark - 關閉目前呈現的廣告，但不會將Banner從Superview中移除
- (void)close;


@end
