//
//  MapView.swift
//  SlideMenuDemo
//
//  Created by qingjiezhao on 7/19/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

@IBDesignable class MapView: UIScrollView {
        
        // Our custom view from the XIB file
    var view: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    
    @IBInspectable var image: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
            imageView.image = image
        }
    }
    
    @IBInspectable var title: String? {
        get {
            return titleLabel.text
        }
        set(title) {
            titleLabel.text = title
        }
    }
    
    @IBInspectable var creator: String? {
        get {
            return creatorLabel.text
        }
        set(creator) {
            creatorLabel.text = creator
        }
    }
    
    
    
    @IBInspectable var buttonTitle: String? {
        get {
            return buttonA.titleForState(UIControlState.Normal)
        }
        set(title) {
            buttonA.setTitle(title, forState: UIControlState.Normal)
        }
    }
    
    
    
        @IBAction func btnA(sender: AnyObject) {
            println("map")
        }
        
        override init(frame: CGRect) {
            // 1. setup any properties here
            
            // 2. call super.init(frame:)
            super.init(frame: frame)
            
            // 3. Setup view from .xib file
            xibSetup()
        }
        
        required init(coder aDecoder: NSCoder) {
            // 1. setup any properties here
            
            // 2. call super.init(coder:)
            super.init(coder: aDecoder)
            
            // 3. Setup view from .xib file
            xibSetup()
        }
        
        func xibSetup() {
            view = loadViewFromNib()
            
            // use bounds not frame or it'll be offset
            view.frame = bounds
            
            // Make the view stretch with containing view
            view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
            
            // Adding custom subview on top of our view (over any custom drawing > see note below)
            addSubview(view)
        }
        
        func loadViewFromNib() -> UIScrollView {
            let bundle = NSBundle(forClass: self.dynamicType)
            let nib = UINib(nibName: "MapView", bundle: bundle)
            
            // Assumes UIView is top level and only object in CustomView.xib file
            let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIScrollView
            return view
        }
        
}