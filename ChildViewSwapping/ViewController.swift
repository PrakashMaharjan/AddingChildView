//
//  ViewController.swift
//  ChildViewSwapping
//
//  Created by prakash Maharjan on 11/16/16.
//  Copyright © 2016 Prakash Maharjan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    /*
    var sb = UIStoryboard()
    var firstView = UIViewController()
    var secondView = UIViewController()
    var thirdView = UIViewController()
 */
    var index = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        self.sb = UIStoryboard(name: "Main", bundle: nil)
        //instantiate view to segue with identifier
        self.firstView = self.sb.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
        self.secondView = self.sb.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        self.thirdView = self.sb.instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
        self.containerView.layoutIfNeeded()
        self.containerView.addSubview(firstView.view)
 */
        

        self.updateView()
    }

    override func viewDidAppear(animated: Bool) {
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       @IBAction func firstBtnTapped(sender: AnyObject) {
        /*
        secondView.view.removeFromSuperview()
        thirdView.view.removeFromSuperview()
        containerView.addSubview(firstView.view)
 */
        self.index = 0;
        self.updateView()
   
    }
    
    @IBAction func secondBtnTapped(sender: AnyObject) {
        /*
        firstView.view.removeFromSuperview()
        thirdView.view.removeFromSuperview()
        containerView.addSubview(secondView.view)
 */
        self.index = 1
        self.updateView()
    }
    
    @IBAction func thirdBtnTapped(sender: AnyObject) {
        /*
        firstView.view.removeFromSuperview()
        secondView.view.removeFromSuperview()
        containerView.addSubview(thirdView.view)
 */
        self.index = 2
        self.updateView()
    }
    
    
    
    //viewcontroller setup
    private lazy var firstViewController: FirstViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var secondViewController: SecondViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var thirdViewController: ThirdViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
        
        // Add View Controller as Child View Controller
        // self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private func updateView() {
         self.containerView.layoutIfNeeded()
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
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        // addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        //viewController.view.frame = view.bounds
        viewController.view.frame = CGRectMake(self.containerView.frame.origin.x, self.containerView.frame.origin.y, self.containerView.frame.size.width, self.containerView.frame.size.height);
        //viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        
        // Notify Child View Controller
        // viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        //viewController.willMove(toParentViewController: nil)
        viewController.willMoveToParentViewController(nil)
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }



}

