//
//  CharactorCell.swift
//  ZIP_ios
//
//  Created by xiilab on 2018. 8. 6..
//  Copyright © 2018년 park bumwoo. All rights reserved.
//

class InterestCell: UICollectionViewCell{
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.BMJUA(size: 30)
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(titleLabel)
    contentView.layer.borderColor = UIColor.black.cgColor
    contentView.layer.borderWidth = 1
    contentView.layer.cornerRadius = 5
    contentView.layer.masksToBounds = true
    
    titleLabel.snp.makeConstraints { (make) in
      make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}