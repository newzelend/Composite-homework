//
//  CompositePattern.swift
//  Composite-homework
//
//  Created by Grisha Pospelov on 15.11.2021.
//

import Foundation
import SwiftUI

protocol TaskComposite {
    var parent: TaskComposite? { get }
    var children: [Task] { get set }
    var name: String { get }
    
    func add(child: Task)
}

class Task: TaskComposite, Identifiable, ObservableObject {
    var parent: TaskComposite?
    @Published var children: [Task] = []
    var name: String
    
    init(name: String, parent: TaskComposite?) {
        self.name = name
        self.parent = parent
    }
    
    func add(child: Task) {
        children.append(child)
    }
}

let previewTask = Task(name: "For preview purpose only", parent: nil)
