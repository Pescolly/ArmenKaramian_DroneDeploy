//
//  Presenter.swift
//  ArmenKaramian_DroneDeploy
//
//  Created by armen karamian on 5/25/21.
//

/*
Clicking on “Go to Page 2” should push “Page 2” on to the UI.
Clicking on “Logout” from either page should present the “Login Screen” as a modal.
Clicking on “Login” should always present “Page 1” even if “Page 2” was where “Logout” was clicked.

*/

import SwiftUI

class Presenter : ViewDelegate
{
	public static let shared = Presenter()
	
	private let router : Router

	init()
	{
		router = Router()
	}
	
	///login screen

	func loginButtonPressed() -> Page1
	{
		print("login button pressed")
		return router.loginButtonPressed()
	}
	
	func getLoginScreenText() -> String
	{
		return Interactor.shared.getLoginScreenText()
	}
	
	func getLoginButtonText() -> String
	{
		return Interactor.shared.getLoginButtonText()
	}

	////////// page 1
	func getPage1Text() -> String
	{
		return Interactor.shared.getPage1Text()
	}
	
	func getPage2ButtonText() -> String
	{
		return Interactor.shared.getPage2ButtonText()
	}

	
	//////// page 2
	func pushPage2Pressed() -> Page2
	{
		print("push page 2 pressed")
		return router.pushPage2Pressed()
	}
		
	func getPage2Text() -> String
	{
		return Interactor.shared.getPage2Text()
	}

	
	//////////logout
	func logoutButtonPressed() -> LoginScreen
	{
		print("logout pressed")
		return router.logoutButtonPressed()
	}

	func getLogoutButtonText() -> String
	{
		return Interactor.shared.getLogoutButtonText()
	}

}
