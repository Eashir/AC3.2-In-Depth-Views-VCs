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
    var drawCardButton: UIButton = UIButton(type: UIButtonType.system)
    var cardView: UIView = UIView()
    var cardLabel: UILabel = UILabel()
    var value = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.isHidden = false
        cardView.backgroundColor = .lightGray
        cardView.layer.borderWidth = 1
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.cornerRadius = 8.0
        cardView.clipsToBounds = true
        
        print("\n\n\n>>>>View DID LOAD \n\n\n")
        self.view.backgroundColor = .white
        
        print("Button frame, viewDidLoad, post adding constraints: \(drawCardButton.frame)")
        
        self.view.addSubview(drawCardButton)
        self.view.addSubview(cardView)
        self.view.addSubview(cardLabel)
        
        
        self.drawCardButton.translatesAutoresizingMaskIntoConstraints = false
        self.cardView.translatesAutoresizingMaskIntoConstraints = false
        self.cardLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cardLabel.text = String(value)
        self.drawCardButton.setTitle("Draw Card", for: .normal)
        
        
        let cardLabelConstraints = [
            cardLabel.topAnchor.constraint(equalTo: cardView.topAnchor),
            cardLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor)
        ]
        
        let drawCardButtonConstraints = [
            drawCardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            drawCardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        
        let cardViewConstraints = [
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 500.0),
            cardView.widthAnchor.constraint(equalToConstant: 300.0)
        ]
        
        let _ = [ cardLabelConstraints, drawCardButtonConstraints, cardViewConstraints].map{ $0.map{ $0.isActive = true } }
        
        
        self.drawCardButton.addTarget(self, action: #selector(didPressDrawCardButton(sender:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("\n\n\n>>>>Did LAYOUT SUBVIEWS \n\n\n")
        print("Button frame, didLayoutSubviews, constraints: \(drawCardButton.frame)")
    }
    func didPressDrawCardButton(sender: UIButton) {
        print("Did press button")
        
        //1. Create our destination VC
        let randomLovelyViewController = ViewController()
        randomLovelyViewController.view.backgroundColor = randomColor()
        
        
        value += 1
        cardLabel.text = String(value)
        //2. Move to the destination VC
        //This will push a new VC modally
        //self.present(greenViewController, animated: true, completion: nil)
        
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

