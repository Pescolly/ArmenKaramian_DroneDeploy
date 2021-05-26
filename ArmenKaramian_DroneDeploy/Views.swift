//
//  ContentView.swift
//  ArmenKaramian_DroneDeploy
//
//  Created by armen karamian on 5/25/21.
//

import SwiftUI

protocol ViewDelegate
{
	func loginButtonPressed() -> Page1
	func pushPage2Pressed() -> Page2
	func logoutButtonPressed()
}

struct LoginScreen: View
{
	@State public var navigationOnScreen = false
	
	public var delegate : ViewDelegate
	private let _loginText : String
	private let _loginButtonText : String
	
	init(presenter : Presenter, loginText : String, loginButtonText : String)
	{
		delegate = presenter
		_loginText = loginText
		_loginButtonText = loginButtonText
		presenter.setLoginScreen(_login: self)
	}
		
    var body: some View
	{
		VStack
		{
			Text(_loginText)
				.padding()
				.foregroundColor(.black)

			Button(_loginButtonText) {
				navigationOnScreen.toggle()
			}
			.fullScreenCover(isPresented: $navigationOnScreen) {
				delegate.loginButtonPressed()
			}
			.frame(width: 200, height: 30, alignment: .center)
			.background(Color.blue)
			.cornerRadius(40)
			.foregroundColor(Color.white)
		}
    }
}

struct Page1: View
{
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State public var page2OnScreen = false
	
	public var delegate : ViewDelegate
	public var _logoutButtonText : String, _page1Text : String, _page2ButtonText : String

	private let navigation : NavigationView?
	
	
	init(presenter : Presenter, logoutButtonText : String, page1Text : String, page2ButtonText : String)
	{
		delegate = presenter
		_logoutButtonText = logoutButtonText
		_page1Text = page1Text
		_page2ButtonText = page2ButtonText
		
		navigation = {
			VStack
			{
				Button(_logoutButtonText){
					
				 }
				 .frame(width: 200, height: 30, alignment: .center)
				 .background(Color.blue)
				 .cornerRadius(40)
				 .foregroundColor(Color.white)

				
				Text(_page1Text)
		
				NavigationLink(
					destination: delegate.pushPage2Pressed(),
					isActive: $page2OnScreen,
					label: {
						Text(_page2ButtonText)
							.frame(width:200 , height: 30, alignment: .center)
							.background(Color.blue)
							.cornerRadius(40)
							.foregroundColor(Color.white)
					}
				)
			}
		}

	}
	
	var body: some View
	{
		navigation
	}
}

struct Page2: View
{
	public var delegate : ViewDelegate
	var _logout : String, _text : String
	
	init(presenter : Presenter, logout : String, text : String)
	{
		delegate = presenter
		_logout = logout
		_text = text
	}
	
	var body: some View
	{
		Button(_logout){
			let p = delegate as? Presenter
			p?.logout = true
		 }
		 .frame(width: 200, height: 30, alignment: .center)
		 .background(Color.blue)
		 .cornerRadius(40)
		 .foregroundColor(Color.white)
		
		Text(_text)
	}
}


/////////////////


//struct ContentView_Previews: PreviewProvider
//{
//    static var previews: some View
//	{
//		LoginScreen(presenter: <#Presenter#>)
//		Page1()
//		Page2()
//    }
//}
