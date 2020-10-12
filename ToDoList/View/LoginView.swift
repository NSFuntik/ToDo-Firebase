//
//  ContentView.swift
//  ToDoList
//
//  Created by Mikhailov on 10.10.2020.
//

import SwiftUI
import Firebase

struct LoginView: View {
	@State var loginTextField: String = ""
	@State var passwordTextField: String = ""
	@State private var showingSheet = false
	
	var body: some View {
		NavigationView {
			ZStack{
				Color.blue
					.ignoresSafeArea()
				VStack {
					Spacer()
					Text("ToDoList")
						.foregroundColor(.white)
						.font(.largeTitle)
						.fontWeight(.light)
					Spacer()
					VStack {
						TextField("Username", text: $loginTextField)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.foregroundColor(.gray)
						SecureField("Password", text: $passwordTextField)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.foregroundColor(.gray)
					}.padding(.horizontal, 40.0)
					VStack {
						Button(action: {
							guard loginTextField != "", passwordTextField != "" else {
								self.showingSheet.toggle()
								return
							}
						}) {
							NavigationLink(destination: TaskListView()) {
							Text("Sign in")
								.padding(.horizontal, 25.0)
								.padding(.vertical, 5.0)
								.background(Color.red)
								.foregroundColor(.white)
								.cornerRadius(5)
							}
						}.sheet(isPresented: $showingSheet, content: {
							AlertView()
						})
						
						Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
							Text("Sign up")
								.padding(.horizontal, 25.0)
								.foregroundColor(.white)
						})
						
					}
					.padding(.top, 20.0)
					Spacer()
					Spacer()
				}
			}
		}
		.preferredColorScheme(.light)
		
	}
}
struct AlertView: View {
	var body: some View {
		Text("User doesn't exist!")
			.foregroundColor(.red)
			.opacity(0)
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView(loginTextField: "", passwordTextField: "")
		
	}
}
