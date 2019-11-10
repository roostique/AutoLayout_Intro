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
          imageView.contentMode = .scaleAspectFit
          return imageView
    }()

    let descriptionTextView: UITextView = {

        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Whatever for now", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\nWhatever for now and later", attributes: [NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 15),NSAttributedString.Key.foregroundColor : UIColor.red]))
        
        textView.attributedText = attributedText
        
//        textView.text = "whatever for now"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
//
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(TinderImageView)
        view.addSubview(descriptionTextView)
        setupLayout()
        
    }
    
    private func setupLayout() {
        
        
             let topImageContainerView = UIView()
              view.addSubview(topImageContainerView)
            // enable auto layout
             topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
             topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
             topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
             topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
              topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
             topImageContainerView.addSubview(TinderImageView)
        
        TinderImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        TinderImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        TinderImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
    
             descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
             descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
             descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
             descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        
        

    }
}

