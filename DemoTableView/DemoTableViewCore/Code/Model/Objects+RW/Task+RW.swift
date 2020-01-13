//
//  Task+RW.swift
//  DemoTableView
//
//  Created by David Bonnet on 05/03/2018.
//  Copyright © 2018 Harpp. All rights reserved.
//

import Foundation
import RealmSwift

public extension Task {

  static func all() -> Results<Task> {
    let realm = Realm.safeInstance()
    return realm.objects(Task.self)
  }

  static func add(name: String) throws {

    let task = Task()
    task.name = name

    let realm = Realm.safeInstance()
    try realm.write {
      realm.add(task)
    }

  }

  static func add(_ task: Task) throws {

    let realm = Realm.safeInstance()
    try realm.write {
      realm.add(task, update: .modified)
    }

  }

  func delete() throws {

    let realm = Realm.safeInstance()
    try realm.write {
      realm.delete(self)
    }
  }

}
