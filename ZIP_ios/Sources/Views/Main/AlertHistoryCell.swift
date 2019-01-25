//
//  AlertHistoryCell.swift
//  ZIP_ios
//
//  Created by xiilab on 25/01/2019.
//  Copyright © 2019 park bumwoo. All rights reserved.
//

final class AlertHistoryCell: UICollectionViewCell{
  
  
  private var didUpdateConstraint = false
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.font = UIFont.AppleSDGothicNeoRegular(size: 14)
    return label
  }()
  
  private let dateLabel: UILabel = {
    let label = UILabel()
    
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(dateLabel)
    setNeedsUpdateConstraints()
  }
  
  override func updateConstraints() {
    if !didUpdateConstraint{
      
      imageView.snp.makeConstraints { (make) in
        make.height.width.equalTo(29)
        make.centerY.equalToSuperview()
        make.left.equalToSuperview().inset(24)
      }
      
      titleLabel.snp.makeConstraints { (make) in
        make.top.equalTo(imageView)
        make.left.equalTo(imageView.snp.right).offset(11)
      }
      
      dateLabel.snp.makeConstraints { (make) in
        make.left.equalTo(titleLabel)
        make.top.equalTo(titleLabel.snp.bottom).offset(4)
      }
      
      didUpdateConstraint = true
    }
    super.updateConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

