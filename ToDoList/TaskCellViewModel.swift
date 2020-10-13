//
//  TaskCellViewModel.swift
//  ToDoList
//
//  Created by Mikhailov on 11.10.2020.
//

import Foundation
import Combine
class TaskCellViewModel: ObservableObject, Identifiable {
	@Published var taskRepository = TaskRepository()
	@Published var task: Task
	
	var id: String = ""
	@Published var competionStateIconName = ""
	
	private var cancellables = Set<AnyCancellable>()
	
	init(task: Task) {
		self.task = task
		
		$task
			.map { task in
				task.isCompleted ? "checkmark.circle.fill" : "circle"
			}
			.assign(to: \.competionStateIconName, on: self)
			.store(in: &cancellables)
		$task
			.compactMap { task in
				task.id
			}
			.assign(to: \.id, on: self)
			.store(in: &cancellables)
		
		$task
			.dropFirst()
			.debounce(for: 0.8, scheduler: RunLoop.main)
			.sink { task in
				self.taskRepository.updateTask(task)
			}
			.store(in: &cancellables)
	}
}
