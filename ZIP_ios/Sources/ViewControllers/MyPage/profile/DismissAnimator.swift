//
//  DismissAnimator.swift
//  ZIP_ios
//
//  Created by xiilab on 25/02/2019.
//  Copyright © 2019 park bumwoo. All rights reserved.
//

import UIKit

class DismissAnimator : NSObject {
}

extension DismissAnimator : UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.6
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard
      let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
      let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
      else {
        return
    }
    
    transitionContext.containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
    
    let screenBounds = UIScreen.main.bounds
    let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)
    let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
    
    UIView.animate(
      withDuration: transitionDuration(using: transitionContext),
      animations: {
        fromVC.view.frame = finalFrame
    },
      completion: { _ in
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
    )
  }
}

