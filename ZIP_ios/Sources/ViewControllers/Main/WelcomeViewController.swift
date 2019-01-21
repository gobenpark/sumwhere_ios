//
//  회원이 아닐경우 맨처음 보이는 ViewController
//  ZIP_ios
//
//  Created by park bumwoo on 2017. 11. 4..
//  Copyright © 2017년 park bumwoo. All rights reserved.
//

import UIKit

import SnapKit
import Moya
import Firebase
import Security
import FBSDKLoginKit
import SwiftyUserDefaults
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
import RxKeyboard
#endif

class WelcomeViewController: UIViewController{
  
  let disposeBag = DisposeBag()
  let joinVC = JoinViewController()
  lazy var viewModel = LoginViewModel(viewController: self)
  
  lazy var loginView: LoginView = {
    let view = LoginView.loadXib(nibName: "LoginView") as! LoginView
    return view
  }()
  
  override func loadView() {
    super.loadView()
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = loginView
    self.view.hero.id = "loginToDefaultLogin"
    
    loginView.emailButton.rx
      .tap
      .bind(onNext: signIn)
      .disposed(by: disposeBag)

    loginView.kakaoButton.rx
      .controlEvent(.touchUpInside)
      .throttle(0.3, scheduler: MainScheduler.instance)
      .bind(onNext: viewModel.kakaoLogin)
      .disposed(by: disposeBag)

    loginView.faceBookButton.rx
      .tap
      .map {return FBSDKLoginManager()}
      .bind(onNext: viewModel.facebookLogin)
      .disposed(by: disposeBag)
  }
  
  private func signIn(){
    self.navigationController?.pushViewController(DefaultLoginViewController(), animated: true)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}
