//
//  Realm+Safe.swift
//  DemoTableViewCore
//
//  Copyright © 2020 Harpp. All rights reserved.
//

import RealmSwift

public extension Realm {

  static func safeInstance() -> Realm {
    do {
      return try Realm()
    } catch {
      fatalError("\(error)")
    }
  }
}
