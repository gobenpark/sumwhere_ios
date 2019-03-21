//
//  MatchTypeViewController.swift
//  ZIP_ios
//
//  Created by park bumwoo on 19/01/2019.
//  Copyright © 2019 park bumwoo. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

final class MatchTypeViewController: UIViewController{
  private let disposeBag = DisposeBag()
  
  private let API = AuthManager.instance
    .provider
    .request(.MatchType)
    .filterSuccessfulStatusCodes()
    .map(ResultModel<[MatchType]>.self)
    .map{$0.result}
    .asObservable()
    .unwrap()
    .materialize()
    .share()
  
  let dataSources = RxCollectionViewSectionedReloadDataSource<GenericSectionModel<MatchType>>(configureCell: {ds,cv,idx,item in
    let cell = cv.dequeueReusableCell(withReuseIdentifier: String(describing: MatchTypeCell.self), for: idx) as! MatchTypeCell
    cell.item = item
    return cell
  })
  
  let submitAction = PublishRelay<Int>()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(MatchTypeCell.self, forCellWithReuseIdentifier: String(describing: MatchTypeCell.self))
    collectionView.backgroundColor = .white
    collectionView.allowsSelection = true
    collectionView.allowsMultipleSelection = false
    collectionView.alwaysBounceVertical = true
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.topItem?.title = String()
    view.addSubview(collectionView)
    
    
    tripRegisterContainer.register(InputTrip.self) { _ in
      InputTrip()
    }
    
    tripRegisterContainer.register(CountryWithTrip.self) { r in
      CountryWithTrip(country: r.resolve(Country.self)!,tripPlace: r.resolve(CountryTripPlace.self)!)
    }

    self.navigationController?.navigationBar.topItem?.title = String()
    collectionView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    API.elements()
      .map{[GenericSectionModel<MatchType>(items: $0)]}
      .bind(to: collectionView.rx.items(dataSource: dataSources))
      .disposed(by: disposeBag)
    
    API.errors()
      .subscribeNext(weak: self) { (weakSelf) -> (Error) -> Void in
        return {err in
          log.error(err)
        }
    }.disposed(by: disposeBag)
    
    collectionView.rx
      .modelSelected(MatchType.self)
      .subscribeNext(weak: self) { (weakSelf) -> (MatchType) -> Void in
        return {type in
          tripRegisterContainer.register(MatchType.self, factory: { _ in type })
          weakSelf.navigationController?.pushViewController(SelectCountryViewController(), animated: true)
        }
    }.disposed(by: disposeBag)
  }
}

