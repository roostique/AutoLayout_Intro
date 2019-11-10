//
//  PageCell.swift
//  Intro
//
//  Created by Rustem Supayev on 10/11/2019.
//  Copyright © 2019 Rustem Supayev. All rights reserved.
//

import UIKit


class PageCell: UICollectionViewCell {
    
    var page: Page? {
        
        didSet{
            guard let unwrappedPage = page else { return }
            
            TinderImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22)])
            
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 14),NSAttributedString.Key.foregroundColor : UIColor.red]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
    
        }
    }
    
    private let TinderImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "tinder1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Whatever for now", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\nWhatever for now and later", attributes: [NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 15),NSAttributedString.Key.foregroundColor : UIColor.red]))
        
        textView.attributedText = attributedText
        
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()

    
    override init(frame: CGRect) {
         super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(TinderImageView)
        addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            
            TinderImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            TinderImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            TinderImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            ])
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
