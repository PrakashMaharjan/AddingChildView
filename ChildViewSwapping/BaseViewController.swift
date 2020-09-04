//
//  BaseViewController.swift
//  AddingChildViews
//
//  Created by prakash Maharjan on 1/17/17.
//  Copyright © 2017 Prakash Maharjan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var view1Button: UIButton!
    @IBOutlet weak var view2Button: UIButton!
    @IBOutlet weak var view3Button: UIButton!
    
    var index = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "Child View Demo"
        self.view1Button.setTitleColor(.red, for: .normal)
        self.view2Button.setTitleColor(.lightGray, for: .normal)
        self.view3Button.setTitleColor(.lightGray, for: .normal)
        setupView()
        
    }
    
    @IBAction func view1Tapped(_ sender: AnyObject) {
        self.index = 0
        self.view1Button.setTitleColor(.red, for: .normal)
        self.view2Button.setTitleColor(.lightGray, for: .normal)
        self.view3Button.setTitleColor(.lightGray, for: .normal)
        self.setupView()
    }
    
    @IBAction func view2Tapped(_ sender: AnyObject) {
        self.index = 1
        self.view1Button.setTitleColor(.lightGray, for: .normal)
        self.view2Button.setTitleColor(.green, for: .normal)
        self.view3Button.setTitleColor(.lightGray, for: .normal)
        self.setupView()
    }
    
    
    @IBAction func view3Tapped(_ sender: AnyObject) {
        self.index = 2
        self.view1Button.setTitleColor(.lightGray, for: .normal)
        self.view2Button.setTitleColor(.lightGray, for: .normal)
        self.view3Button.setTitleColor(.blue, for: .normal)
        self.setupView()
    }
    
    
    // MARK: - View Methods
    
    fileprivate func setupView() {
        
        
        updateView()
    }
    
    fileprivate func updateView() {
        if index == 0 {
            remove(asChildViewController: secondViewController)
            remove(asChildViewController: thirdViewController)
            add(asChildViewController: firstViewController)
        } else if index == 1{
            remove(asChildViewController: firstViewController)
            remove(asChildViewController: thirdViewController)
            add(asChildViewController: secondViewController)
        }
        else{
            remove(asChildViewController: firstViewController)
            remove(asChildViewController: secondViewController)
            add(asChildViewController: thirdViewController)
        }
    }
    
    fileprivate lazy var firstViewController: ViewController1 = {
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController1") as! ViewController1
        //viewController.view.frame = CGRectMake(0, 135, 375 , 500)
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
        
        
    }()
    
    fileprivate lazy var secondViewController: ViewController2 = {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        //viewController.view.frame = CGRectMake(0, 135, 375 , 500)
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    fileprivate lazy var thirdViewController: ViewController3 = {
        // Load Storyboard
        //let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        //viewController.view.frame = CGRectMake(0, 135, 375 , 500)
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    fileprivate func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        // viewController.view.frame = view.bounds
        viewController.view.frame = CGRect(x: 0, y: 150, width: self.view.frame.size.width, height: self.view.frame.size.height - 150)
        
        viewController.view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        
        // Notify Child View Controller
        
        viewController.didMove(toParent: self)
    }
    
    fileprivate func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

