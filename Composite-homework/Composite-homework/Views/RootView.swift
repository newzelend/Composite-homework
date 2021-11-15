//
//  RootView.swift
//  Composite-homework
//
//  Created by Grisha Pospelov on 15.11.2021.
//

import SwiftUI

struct RootView: View {
    @StateObject var myTaskTree = Task(name: "задачи", parent: nil)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(myTaskTree.children) { child in
                    ListItemView(task: child)
                }
            }
            .listStyle(.plain)
            .navigationBarTitle(myTaskTree.name).padding()
            .toolbar {
                Button("добавить задачу") {
                    textAlert() { userInput in
                        guard userInput != "" else { return }
                        myTaskTree.add(child: Task(name: userInput, parent: myTaskTree))
                    }
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().preferredColorScheme(.light)
    }
}

