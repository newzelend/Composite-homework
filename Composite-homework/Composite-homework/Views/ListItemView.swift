//
//  ListItemView.swift
//  Composite-homework
//
//  Created by Grisha Pospelov on 15.11.2021.
//

import SwiftUI

struct ListItemView: View {
    @ObservedObject var task: Task
    
    var body: some View {
        NavigationLink(destination: SubView(task: task)) {
            VStack(alignment: .leading) {
                Text(task.name).font(.title)
                Text("Subtasks: \(task.children.count)").foregroundColor(.secondary)
            }.padding()
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(task: previewTask).preferredColorScheme(.dark)
    }
}
