//
//  SwipingController.swift
//  Intro
//
//  Created by Rustem Supayev on 10/11/2019.
//  Copyright © 2019 Rustem Supayev. All rights reserved.
//

import UIKit


class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let pages = [
    
        Page(imageName: "kaspi1", headerText: "Мой Банк", bodyText: "Информация о картах,кредитах и депозитах"),
        Page(imageName: "kaspi1", headerText: "Платежи", bodyText: "Без комиссий, более 4 000 услуг"),
        Page(imageName: "kaspi1", headerText: "Переводы", bodyText: "Между счетами и с карты на карту"),
        Page(imageName: "kaspi1", headerText: "Магазин", bodyText: "Самый выгодный кредит и рассрочка")

    ]
    
    private let signInButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Вход", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let signUpButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainRed, for: .normal)
        return button
    }()
    
    
    lazy var  pageControl: UIPageControl = {
        
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainRed
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    
    fileprivate func setupBottomControls(){
        
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [pageControl,signInButton, signUpButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.axis = .vertical
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 60),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 150)
            
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        
        collectionView.backgroundColor = .white
        collectionView.register(PageCell .self, forCellWithReuseIdentifier: "cellid")
        
        collectionView.isPagingEnabled = true
    }
    
}
