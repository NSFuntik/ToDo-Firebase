//
//  SignInWithAppleButton.swift
//  ToDoList
//
//  Created by Mikhailov on 13.10.2020.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {
	
	func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
		return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
	}
	
	func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
	}
}
