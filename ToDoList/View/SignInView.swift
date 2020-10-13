//
//  SignInView.swift
//  ToDoList
//
//  Created by Mikhailov on 13.10.2020.
//

import SwiftUI

struct SignInView: View {
	
	@Environment(\.presentationMode) var presentationMode
	@State var coordinator: SignInWithAppleCoordinator?
	
	var body: some View {
		VStack {
			Text("Thanks for using ToDo List.")
			Text("Please sign in here.")
			SignInWithAppleButton()
				.frame(width: 250, height: 45)
				.onTapGesture {
					self.coordinator = SignInWithAppleCoordinator()
					if let coordinator = self.coordinator {
						coordinator.startSignInWithAppleFlow {
							print("You're seccessfully signed in.")
							self.presentationMode.wrappedValue.dismiss()
						}
					}
				}
		}
	}
}

struct SignInView_Previews: PreviewProvider {
	static var previews: some View {
		SignInView()
	}
}
