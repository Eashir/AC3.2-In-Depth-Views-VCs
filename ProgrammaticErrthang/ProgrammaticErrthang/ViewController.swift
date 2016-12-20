//
//  ViewController.swift
//  ProgrammaticErrthang
//
//  Created by Eashir Arafat on 12/20/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Makes and keeps reference to button itself, so like outlet
    var segueButton: UIButton = UIButton(type: UIButtonType.system)
    var randomLazyView: LazyView = LazyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\n\n\n>>>>View DID LOAD \n\n\n")
        self.view.backgroundColor = .blue
        
        print("Button frame, viewDidLoad, post adding constraints: \(segueButton.frame)")
        
        self.view.addSubview(segueButton)
        self.view.addSubview(randomLazyView)
        self.segueButton.translatesAutoresizingMaskIntoConstraints = false
        self.segueButton.setTitle("PRESS ME", for: .normal)
        //Always need 2 constraints x & y
        //Button intrinsic size is text plus a bqxit of padding on each side
        let _ = [segueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            segueButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ].map { $0.isActive = true }
        
        self.segueButton.addTarget(self, action: #selector(didPressSegueButton(sender:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("\n\n\n>>>>Did LAYOUT SUBVIEWS \n\n\n")
        print("Button frame, didLayoutSubviews, constraints: \(segueButton.frame)")
    }
    func didPressSegueButton(sender: UIButton) {
        print("Did press button")
        
        //1. Create our destination VC
        let randomLovelyViewController = ViewController()
        randomLovelyViewController.view.backgroundColor = self.randomColor()
        
        //2. Move to the destination VC
        //This will push a new VC modally
        //self.present(greenViewController, anim ted: true, completion: nil)
        
        //but we want the nacVC to manage our VCs!
        if let navVC = self.navigationController {
            print("NavVC found")
            navVC.pushViewController(randomLovelyViewController, animated: true)
        }
        //Pressing button pushs a VC to the stack
        //Pressing back pops the VC off the stack
    }
    
    func randomColor() -> UIColor {
    let r = CGFloat(arc4random_uniform(254))
    let g = CGFloat(arc4random_uniform(254))
    let b = CGFloat(arc4random_uniform(254))
    
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\n\n\n>>>>View WILL APPEAR \n\n\n")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n\n\n>>>>View DID APPEAR \n\n\n")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\n\n\n>>>>View WILL DISAPPEAR \n\n\n")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\n\n\n>>>>View DID DISAPPEAR \n\n\n")
    }
    
    

    


}

