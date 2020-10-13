//
//  Task.swift
//  ToDoList
//
//  Created by Mikhailov on 11.10.2020.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
	@DocumentID var id: String? 
	var title: String
	var isCompleted: Bool
	@ServerTimestamp var createdTime: Timestamp?
	var userId: String?
}

#if DEBUG
let testDataTask = [
	Task(title: "Implement the UI", isCompleted: true),
	Task(title: "Connect to UI", isCompleted: false),
	Task(title: "????", isCompleted: false),
	Task(title: "Profit!!", isCompleted: false)
]
#endif
