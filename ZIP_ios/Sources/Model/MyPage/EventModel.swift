//
//  EventModel.swift
//  ZIP_ios
//
//  Created by park bumwoo on 13/01/2019.
//  Copyright © 2019 park bumwoo. All rights reserved.
//

import IGListKit

class EventSectionModel: ListDiffable{
  func diffIdentifier() -> NSObjectProtocol {
    return data.id as NSNumber
  }
  
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard let object = object as? EventSectionModel else {return false}
    return self.data.id == object.data.id
  }
  
  var isOpen = false
  let data: EventModel
  
  init(data: EventModel) {
    self.data = data
  }
}

struct EventModel: Codable{
  let id: Int
  let imageURL: String
  let title: String
  let text: String
  let createAt: String
  let updateAt: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case imageURL = "image_url"
    case title
    case text
    case createAt = "create_at"
    case updateAt = "update_at"
  }
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    imageURL = try container.decode(String.self, forKey: .imageURL)
    title = try container.decode(String.self, forKey: .title)
    text = try container.decode(String.self, forKey: .text)
    createAt = try container.decode(String.self, forKey: .createAt)
    updateAt = try container.decode(String.self, forKey: .updateAt)
  }
}