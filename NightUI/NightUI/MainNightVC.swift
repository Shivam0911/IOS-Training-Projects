//
//  MainNightVC.swift
//  NightUI
//
//  Created by MAC on 01/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class MainNightVC: UIViewController {

	//MARK: Outlets
	//===========
	
	@IBOutlet weak var loginScrollView: UIScrollView!
	
	@IBOutlet weak var overButtonView: UIView!
	
	@IBOutlet weak var signInButton: UIButton!
	
	@IBOutlet weak var signUpButton: UIButton!
	
	@IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
	
	var loginViewVC : LoginViewVC? = nil
	
	var signUpVC : SignUpVC? = nil
	
	var currentPage = Int()
	
	//MARK: View Life Cycle
	//=================
	
    override func viewDidLoad() {
	
		super.viewDidLoad()
	
		doSubViewLoad()
	
		loadViewControllers()
	
         }
	
	private func doSubViewLoad()
	{
		NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
			
			guard let userinfo = Notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
				else{ return }
			
			let keyboardHeight = userinfo.cgRectValue.height			
			
			self.scrollViewBottomConstraint.constant = keyboardHeight - 130
			
		})
		
		NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main, using: {(Notification) -> Void in
			
			self.scrollViewBottomConstraint.constant = 0
			
		})
	
	}
	
	private func loadViewControllers(){
	
		loginScrollView.delegate = self
		
		loginScrollView.isPagingEnabled = true
		
		let storyBoardScene = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		//register LoginVC

		loginViewVC = storyBoardScene.instantiateViewController(withIdentifier : "LoginViewVCID") as? LoginViewVC
		
		loginScrollView.addSubview((loginViewVC?.view)!)
		
		addChildViewController(loginViewVC!)
		
		loginViewVC?.didMove(toParentViewController: self)
		
		//register SignUpVC
		
		signUpVC = storyBoardScene.instantiateViewController(withIdentifier : "SignUpVCID") as? SignUpVC
		
		loginScrollView.addSubview((signUpVC?.view)!)
		
		addChildViewController(signUpVC!)
		
		signUpVC?.didMove(toParentViewController: self)
		
		//scrollView Properties Set
		
		loginScrollView.showsHorizontalScrollIndicator = false
		
		loginScrollView.showsHorizontalScrollIndicator = true
		
		//MARK: All Buttons Targets
		
		signInButton.addTarget(self, action: #selector(signInButtonTapped(_ : ) ), for: .touchUpInside)
		
		signUpButton.addTarget(self, action: #selector(signUpButtonTapped(_ : ) ), for: .touchUpInside)
		
		loginViewVC?.signUpButton.addTarget(self, action: #selector(signUpButtonTapped(_ : ) ), for: .touchUpInside)
		
		signUpVC?.signInButton.addTarget(self, action: #selector(signInButtonTapped(_ : ) ), for: .touchUpInside)

	}
	
	override func viewWillLayoutSubviews() {
		
		//change origin x
		
		signUpVC?.view.frame.origin.x =  self.view.bounds.size.width
		
		loginScrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(2), height : loginScrollView.frame.height )
		
		loginScrollView.frame.size.width =  self.view.frame.width
		
		signUpVC?.view.frame.size.width = loginScrollView.frame.size.width
		
		loginViewVC?.view.frame.size.width = loginScrollView.frame.size.width
		
		
	}
	

    override func didReceiveMemoryWarning() {
	
	super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
}

//MARK: UIScrollViewDelegate
//=====================

extension MainNightVC : UIScrollViewDelegate	{
	
	public func scrollViewDidScroll(_ scrollView: UIScrollView)	{
		
		let scrollViewOffset = scrollView.contentOffset.x
		
		let divider =  scrollView.frame.size.width / overButtonView.frame.size.width
		
		self.overButtonView.transform = CGAffineTransform(translationX: scrollViewOffset / divider, y: 0)
				
	}
	
}

//MARK: Button Actions
//================

extension MainNightVC {
	
	public func signInButtonTapped(_ sender : UIButton)	{
	
		UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {() -> Void in
			
			self.loginScrollView.contentOffset.x = 0
			
		}, completion: nil)
	}
	
	public func signUpButtonTapped(_ sender : UIButton)	{
		
		UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {() -> Void in
			
			self.loginScrollView.contentOffset.x = self.loginScrollView.frame.width	
			
		}, completion: nil)
		
	}
	
}



