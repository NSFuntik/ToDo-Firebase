//
//  ListView.swift
//  ToDoList
//
//  Created by Mikhailov on 10.10.2020.
//

import SwiftUI

struct TaskListView: View {
	let tasks = testDataTask
	
	var body: some View {
		NavigationView{
			VStack(alignment: .leading) {
				List(tasks) { task in
					TaslCell(task: task)
				}.listStyle(InsetListStyle())
				Button(action: {}) {
					HStack {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.frame(width: 20, height: 20)
						Text("Add New Task")
					}
				}
				.padding()
			}
			.navigationTitle("Tasks")
		}
	}
}

struct TaskListView_Previews: PreviewProvider {
	static var previews: some View {
		TaskListView()
	}
}

struct TaslCell: View {
	let task: Task
	var body: some View {
		HStack{
			Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
				.resizable()
				.frame(width: 20, height: 20)
			Text(task.title)
		}
	}
}
