//
//  MockMessage.swift
//  ZIP_ios
//
//  Created by park bumwoo on 2018. 1. 31..
//  Copyright © 2018년 park bumwoo. All rights reserved.
//

import UIKit
import MessageKit

struct MockMessage: MessageType {
  
  var messageId: String
  var sender: Sender
  var sentDate: Date
  var data: MessageData
  
  init(data: MessageData, sender: Sender, messageId: String, date: Date) {
    self.data = data
    self.sender = sender
    self.messageId = messageId
    self.sentDate = date
  }
  
  init(text: String, sender: Sender, messageId: String, date: Date) {
    self.init(data: .text(text), sender: sender, messageId: messageId, date: date)
  }
  
  init(attributedText: NSAttributedString, sender: Sender, messageId: String, date: Date) {
    self.init(data: .attributedText(attributedText), sender: sender, messageId: messageId, date: date)
  }
  
  init(image: UIImage, sender: Sender, messageId: String, date: Date) {
    self.init(data: .photo(image), sender: sender, messageId: messageId, date: date)
  }
  
  init(thumbnail: UIImage, sender: Sender, messageId: String, date: Date) {
    let url = URL(fileURLWithPath: "")
    self.init(data: .video(file: url, thumbnail: thumbnail), sender: sender, messageId: messageId, date: date)
  }
  
  init(emoji: String, sender: Sender, messageId: String, date: Date) {
    self.init(data: .emoji(emoji), sender: sender, messageId: messageId, date: date)
  }
  
}