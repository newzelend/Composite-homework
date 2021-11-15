//
//  SubView.swift
//  Composite-homework
//
//  Created by Grisha Pospelov on 15.11.2021.
//

import SwiftUI

struct SubView: View {
    @StateObject var task: Task
    
    var body: some View {
            List {
                ForEach(task.children) { child in
                    ListItemView(task: child)
                }
            }
            .listStyle(.plain)
            .navigationBarTitle(task.name).padding()
            .toolbar {
                Button("Add subtask") {
                    textAlert() { userInput in
                        guard userInput != "" else { return }
                        task.add(child: Task(name: userInput, parent: task))
                    }
                }
            }
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(task: previewTask).preferredColorScheme(.dark)
    }
}
