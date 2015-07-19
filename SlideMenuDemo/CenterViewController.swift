//
//  CenterViewController.swift
//  SlideMenuDemo
//
//  Created by qingjiezhao on 7/17/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var creatorLabel: UILabel!
    

    
    var delegate: CenterViewControllerDelegate?
    
    // MARK: Button actions
    
    @IBAction func kittiesTapped(sender: AnyObject) {
        delegate?.toggleLeftPanel?()
    }
    
    
}

extension CenterViewController: SidePanelViewControllerDelegate {
    func animalSelected(animal: Animal) {
        
        println(animal)
        
        var str = animal.title as String
        self.navigationItem.title = str
        
        switch str {
        case "Sleeping Cat":
            println("Sleeping Cat")

            removeMapView()
            removeProfileView()
            loadMapView()

          
        case "Pussy Cat":
            println("Pussy Cat")
           
            removeMapView()
            removeProfileView()
            loadProfileView()
            
        case "Korat Domestic Cat":
            println("Korat Domestic Cat")
           
        default:
            
            break
        }
        
        
        delegate?.collapseSidePanels?()
    }
    
    
    func loadMapView(){
        let v = MapView()
        v.frame = CGRectMake(0, 0, 300, 400)
        self.view.addSubview(v)
    }
    
    func removeMapView(){
        if(view.subviews.count > 0){
            for subview in view.subviews {
                if subview is MapView {
                    println(subview)
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    func loadProfileView(){
        let v = ProfileView()
        v.frame = CGRectMake(0, 0, 300, 400)
        self.view.addSubview(v)
    }
    
    func removeProfileView(){
        if(view.subviews.count > 0){
            for subview in view.subviews {
                if subview is ProfileView {
                    println(subview)
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}