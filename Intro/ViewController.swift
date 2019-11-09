//
//  ViewController.swift
//  Intro
//
//  Created by Rustem Supayev on 10/11/2019.
//  Copyright © 2019 Rustem Supayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //let`s avoid polluting viewDidLoad
    //{} is reffered as closure or anonymus function
    let TinderImageView: UIImageView = {
          let imageView = UIImageView(image: #imageLiteral(resourceName: "tinder1"))
          imageView.translatesAutoresizingMaskIntoConstraints = false
          return imageView
    }()

    let descriptionTextView: UITextView = {
       
        let textView = UITextView()
        textView.text = "whatever for now"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(TinderImageView)
        view.addSubview(descriptionTextView)
        setupLayout()
        
    }
    
    private func setupLayout() {
    
             TinderImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
             TinderImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
             TinderImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
             TinderImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    
             descriptionTextView.topAnchor.constraint(equalTo: TinderImageView.bottomAnchor, constant: 100).isActive = true
             descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
             descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
             descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }
}

