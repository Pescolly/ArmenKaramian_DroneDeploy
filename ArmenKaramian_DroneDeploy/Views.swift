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
	func getLoginScreenText() -> String
	func getLoginButtonText() -> String
	
	func getPage1Text() -> String
	func pushPage2Pressed() -> Page2
	func getPage2ButtonText() -> String
	
	func getPage2Text() -> String
	func logoutButtonPressed() -> LoginScreen
	func getLogoutButtonText() -> String
}



struct LoginScreen: View
{
	@State private var page1OnScreen = false
	public var delegate : ViewDelegate
	
	init(presenter : Presenter)
	{
		delegate = presenter
	}
		
    var body: some View
	{
		VStack
		{
			Text(delegate.getLoginScreenText())
				.padding()
				.foregroundColor(.black)

			Button(delegate.getLoginButtonText()) {
				page1OnScreen.toggle()
			}
			.fullScreenCover(isPresented: $page1OnScreen) {
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
	@State private var page2OnScreen = false
	@State private var loginOnScreen = false
	
	public var delegate : ViewDelegate
	
	init(presenter : Presenter)
	{
		delegate = presenter
	}
	
	var body: some View
	{
		NavigationView
		{
			VStack(alignment: .center, spacing: 10)
			{
				HStack
				{
					Button(delegate.getLogoutButtonText()){
						loginOnScreen.toggle()
					 }
					 .fullScreenCover(isPresented: $loginOnScreen) {
						 delegate.logoutButtonPressed()
					 }
					 .frame(width: 100, height: 30, alignment: .center)
					 .background(Color.blue)
					 .cornerRadius(40)
					 .foregroundColor(Color.white)
					.padding(10)
					
				}
				.frame(maxWidth: .infinity, alignment: .trailing)
				
				Spacer(minLength: 100)
				
				Text("Welcome to Page 1")
					.foregroundColor(.black)
				
				Spacer(minLength: 100)
				
				NavigationLink(
					destination: delegate.pushPage2Pressed(),
					isActive: $page2OnScreen,
					label: {
						Text(delegate.getPage2ButtonText())
							.frame(width:200 , height: 30, alignment: .center)
							.background(Color.blue)
							.cornerRadius(40)
							.foregroundColor(Color.white)
					})
				Spacer(minLength: 400)
			}
//			.frame(maxWidth: .infinity, maxHeight: .infinity)
		}
	}
}

struct Page2: View
{
	public var delegate : ViewDelegate
	@State private var loginOnScreen = false
	
	init(presenter : Presenter)
	{
		delegate = presenter
	}
	
	var body: some View
	{
		VStack
		{
			HStack
			{
				Button(delegate.getLogoutButtonText()){
					loginOnScreen.toggle()
				 }
				 .fullScreenCover(isPresented: $loginOnScreen) {
					 delegate.logoutButtonPressed()
				 }
				 .frame(width: 100, height: 30, alignment: .center)
				 .background(Color.blue)
				 .cornerRadius(40)
				 .foregroundColor(Color.white)
				.padding(10)
			}
			.frame(maxWidth: .infinity, alignment: .trailing)
			
			Spacer(minLength: 300)
			
			Text(delegate.getPage2Text())
				.foregroundColor(.black)

			Spacer(minLength: 360)
		}
	}
}


/////////////////


struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
	{
//		LoginScreen(presenter: <#Presenter#>)
		Page1(presenter: Presenter.shared)
//		Page2()
    }
}
