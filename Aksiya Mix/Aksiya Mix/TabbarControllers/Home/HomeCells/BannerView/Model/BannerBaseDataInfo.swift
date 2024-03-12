//
//  BannerBaseDataInfo.swift
//  BannerDemo
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/4/24.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

import UIKit

enum BannerImageInfoType:String {

    case bannerImageInfoTypeLocality = "bannerImageInfoTypeLocality"

    case bannerImageInfoTypeNetIamge = "bannerImageInfoTypeNetIamge"

    case bannerImageInfoTypeGIFImage = "bannerImageInfoTypeGIFImage"

    case bannerImageWithVideo = "bannerImageWithVideo"
}

class BannerBaseDataInfo: NSObject {
    
    public var type:BannerImageInfoType?
    
    public var image:UIImage?
    
    public var bannerImageType:BannerViewImageType = .bannerViewImageTypeMix
    
    public var imageUrl:String? {
        willSet {
            guard let imageName = newValue else {
                return
            }
            switch bannerImageType {
            case .bannerViewImageTypeGIFAndNet:
                if BannerTool.default.bannerIsGifWithURL(imageName) {
                    self.image = BannerTool.default.bannerGetGifImage(imageName)
                    self.type = .bannerImageInfoTypeGIFImage
                    return
                }
                self.type = .bannerImageInfoTypeNetIamge
                break
            case .bannerViewImageWithVideo:
                 let url = URL(string: newValue!)
                 if ZYPlayerTool.playerHaveTracksWithURL(url!) {
                    self.image = ZYPlayerTool.playerFristImageWithURL(url!)
                    self.type = .bannerImageWithVideo
                    return
                 }
                 self.type = .bannerImageInfoTypeNetIamge
                break
            case .bannerViewImageTypeLocality:
                self.type = .bannerImageInfoTypeLocality
                self.image = UIImage(named: imageName)
                break
            case .bannerViewImageTypeNetIamge:
                 self.type = .bannerImageInfoTypeNetIamge
                break
            case .bannerViewImageTypeGIFImage:
                self.image = BannerTool.default.bannerGetGifImage(imageName)
                self.type = .bannerImageInfoTypeGIFImage
                break
            default:
                if BannerTool.default.bannerImageIsLocation(imageName) {
                    self.type = .bannerImageInfoTypeLocality
                    self.image = UIImage(named: imageName)
                    return
                }else if BannerTool.default.bannerIsGifWithURL(imageName)  {
                   self.image = BannerTool.default.bannerGetGifImage(imageName)
                    self.type = .bannerImageInfoTypeGIFImage
                    return
                }
                self.type = .bannerImageInfoTypeNetIamge
            }
            
        }
    }
 
}
