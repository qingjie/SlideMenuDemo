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
        imageView.image = animal.image
        //titleLabel.text = animal.title
        var str = animal.title as String
        titleLabel.text = str
        creatorLabel.text = animal.creator
        
        switch str {
        case "Sleeping Cat":
            println("Sleeping Cat")
            //Show Sleeping Cat ViewController
        case "Pussy Cat":
            println("Pussy Cat")
            //Show Pussy Cat ViewController
        case "Korat Domestic Cat":
            println("Korat Domestic Cat")
            //Show Korat Domestic Cat ViewController
        default:break
        }
        
        
        delegate?.collapseSidePanels?()
    }
    
    
    
    
  
    
    
}
