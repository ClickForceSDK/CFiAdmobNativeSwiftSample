//
//  ViewController.swift
//  CFiAdmobNativeSwiftSample
//
//  Created by CF-NB on 2023/8/11.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADNativeAdDelegate{
    
    
    var ClickforceTestAdUnit = "ca-app-pub-7236340530869760/9573036878"
    var nativeAdview = GADNativeAdView()
    var iconView = UIImageView()
    var Adtittle = UILabel()
    var Advertiser = UILabel()
    var Adbody = UILabel()
    var mediaView = GADMediaView()
    var Adbutton = UIButton()
    var heightConstraint: NSLayoutConstraint?
    var adLoader:GADAdLoader!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nativeAdview.removeFromSuperview()
        self.setAdview()
        
        let videoOptions = GADVideoOptions()
        videoOptions.startMuted = true
        
        adLoader = GADAdLoader(adUnitID: ClickforceTestAdUnit,
                                   rootViewController: self,
                                   adTypes: [GADAdLoaderAdType.native],
                                   options: [videoOptions])
        adLoader.delegate = self
        
        let req = GADRequest()
//        req.testDevices = ["14c30346989d0fac6da79e0c7d580cd7"]
//        req.testDevices = [""]
        adLoader.load(req)
        
    }

    public func setAdview(){
        nativeAdview.frame = CGRect(x: 0, y: 50, width: 359, height: 300)
        
        iconView.frame = CGRect(x: 15, y: 15, width: 40, height: 40)
        Adtittle.frame = CGRect(x: 57, y: 15, width: 285, height: 20)
        Advertiser.frame = CGRect(x: 57, y: 38, width: 285, height: 17)
        Adbody.frame = CGRect(x: 15, y: 63, width: 330, height: 33)
        mediaView.frame = CGRect(x: 65, y: 102, width: 250, height: 150)
        Adbutton.frame = CGRect(x: 260, y: 260, width: 80, height: 34)
        Adbutton.isUserInteractionEnabled = false
        
        nativeAdview.addSubview(Adtittle)
        nativeAdview.addSubview(iconView)
        nativeAdview.addSubview(Advertiser)
        nativeAdview.addSubview(Adbody)
        nativeAdview.addSubview(mediaView)
        nativeAdview.addSubview(Adbutton)
        self.view.addSubview(nativeAdview)
        
        nativeAdview.headlineView = Adtittle;
        nativeAdview.iconView = iconView;
        nativeAdview.advertiserView = Advertiser;
        nativeAdview.bodyView = Adbody;
        nativeAdview.mediaView = mediaView;
        nativeAdview.callToActionView = Adbutton;
    }
}

extension ViewController:GADAdLoaderDelegate{
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        print("Native load error: ", error);
    }
    
}
extension ViewController: GADNativeAdLoaderDelegate {
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        let native = nativeAdview
        
        heightConstraint?.isActive = true
        
        native.nativeAd = nativeAd;
        
        nativeAd.delegate = self;
        
        (native.headlineView as? UILabel)?.text = nativeAd.headline
        native.headlineView?.isHidden = nativeAd.headline == nil
        
        native.mediaView?.mediaContent = nativeAd.mediaContent;
        
        (native.bodyView as? UILabel)?.text = nativeAd.body
        native.bodyView?.isHidden = nativeAd.body == nil
        
        (native.iconView as? UIImageView)?.image = nativeAd.icon?.image
        native.iconView?.isHidden = nativeAd.icon == nil
        
        (native.advertiserView as? UILabel)?.text = nativeAd.advertiser
        native.advertiserView?.isHidden = nativeAd.advertiser == nil
        
        (native.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for:.normal)
        (native.callToActionView as? UIButton)?.setTitleColor(.blue, for: .normal)
        native.callToActionView?.isHidden = nativeAd.callToAction == nil
        
        print("Native adapter class name:", nativeAd.responseInfo.adNetworkClassName);//Check the value of adNetworkClassName
        
    }
    func nativeAdDidRecordImpression(_ nativeAd: GADNativeAd) {
        print("nativeAdDidRecordImpression")
    }
    
    func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
        print("nativeAdDidRecordClick")
    }
    
    
}

