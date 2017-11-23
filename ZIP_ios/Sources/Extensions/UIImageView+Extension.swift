//
//  UIImageView+Extension.swift
//  ZIP_ios
//
//  Created by park bumwoo on 2017. 11. 7..
//  Copyright © 2017년 park bumwoo. All rights reserved.
//

import Foundation


extension UIImageView{
  func addBlurEffect()
  {
    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = self.bounds
    
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
    self.addSubview(blurEffectView)
  }
}