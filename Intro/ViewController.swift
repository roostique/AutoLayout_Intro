//
//  ViewController.swift
//  Intro
//
//  Created by Rustem Supayev on 10/11/2019.
//  Copyright © 2019 Rustem Supayev. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var mainRed = UIColor(red: 254/255, green: 60/255, blue: 114/255, alpha: 1)
}

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

    
    private let previousButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainRed, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainRed, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 3
        pc.currentPageIndicatorTintColor = .mainRed
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(descriptionTextView)
        setupBottomControls()
        setupLayout()
        
    }
    
    fileprivate func setupBottomControls(){
        
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            
            ])
    }
    
    private func setupLayout() {
        
             let topImageContainerView = UIView()
            view.addSubview(topImageContainerView)
        
             topImageContainerView.translatesAutoresizingMaskIntoConstraints = false // enable auto layout
        
             topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
             topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
             topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
              topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
             topImageContainerView.addSubview(TinderImageView)
        
        NSLayoutConstraint.activate([
            
        TinderImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
        TinderImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
        TinderImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
        
             descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
             descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
             descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        

    }
}

