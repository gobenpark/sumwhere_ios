//
//  ChatListViewModel.swift
//  ZIP_ios
//
//  Created by xiilab on 18/01/2019.
//  Copyright © 2019 park bumwoo. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
import RxDataSources
#endif

struct ChatListViewModel {
  var header: String
  var items: [Item]
}
extension ChatListViewModel: SectionModelType {
  typealias Item = Conversation
  
  init(original: ChatListViewModel, items: [Item]) {
    self = original
    self.items = items
  }
}
