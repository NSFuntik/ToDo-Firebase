//
//  ListView.swift
//  ToDoList
//
//  Created by Mikhailov on 10.10.2020.
//

import SwiftUI

struct TaskListView: View {
	@ObservedObject var taskListVM = TaskListViewModel()
	
	let tasks = testDataTask
	
	@State var presentAddNewItem = false
	@State var showSingInForm = false
	
	var body: some View {
		NavigationView{
			VStack(alignment: .leading) {
				List {
					ForEach(taskListVM.taskCellViewModels) { taskCellVM in
						TaslCell(taskCellVM: taskCellVM)
					}
					if presentAddNewItem {
						TaslCell(taskCellVM: TaskCellViewModel(task: Task(title: "", isCompleted: false))) { task in
							self.taskListVM.addTask(task: task)
							self.presentAddNewItem.toggle()
						}
					}
				}.listStyle(InsetListStyle())
				Button(action: { self.presentAddNewItem.toggle() }) {
					HStack {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.frame(width: 20, height: 20)
						Text("Add New Task")
					}
				}
				.padding()
			}
			.sheet(isPresented: $showSingInForm) {
				SignInView()
			}
			.navigationBarItems(trailing:
				Button(action: { self.showSingInForm.toggle() }, label: { Image(systemName: "person.circle") })
			)
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
	@ObservedObject var taskCellVM: TaskCellViewModel
	var onCommit: (Task) -> (Void) = { _ in }
	
	var body: some View {
		HStack{
			Image(systemName: taskCellVM.task.isCompleted ? "checkmark.circle.fill" : "circle")
				.resizable()
				.frame(width: 20, height: 20)
				.onTapGesture {
					self.taskCellVM.task.isCompleted.toggle()
				}
			TextField("Enter the task title", text: $taskCellVM.task.title, onCommit: {
				self.onCommit(self.taskCellVM.task)
			})
		}
	}
}
