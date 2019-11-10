//
//  SwipingControllerExtension.swift
//  Intro
//
//  Created by Rustem Supayev on 10/11/2019.
//  Copyright © 2019 Rustem Supayev. All rights reserved.
//

import UIKit

extension SwipingController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                
                self.collectionView?.contentOffset = .zero
                
            } else
            {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }) { (_) in
        }
    }
    
}
