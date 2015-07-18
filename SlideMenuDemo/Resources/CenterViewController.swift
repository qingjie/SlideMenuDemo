//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
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

    let containerView = UIView(frame: CGRectMake(100, 50, 100, 100))
    let containerView1 = UIView(frame: CGRectMake(100, 50, 100, 100))
    
    
    var tmpViews1 = Array<UIView>()
    var tmpViews2 = Array<UIView>()
    var tmpViews3 = Array<UIView>()
    var tmpViews4 = Array<UIView>()
    var tmpViews5 = Array<UIView>()
    
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
//            unloadView()
//            loadView1("Sleeping Cat")
            removeCV()
            addContainerView()
        case "Pussy Cat":
            println("Pussy Cat")
            //unloadView()
            //loadView2()
            removeCV()
            addContainerView1()
        case "Korat Domestic Cat":
            println("Korat Domestic Cat")
           // unloadView()
            //loadView3()
        default:break
    }
    
    
    delegate?.collapseSidePanels?()
  }
    
    
    
    
    func addContainerView(){
        let label1 = UILabel(frame: CGRectMake(100, 200, 200, 30))
        label1.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        label1.textColor = UIColor.redColor()
        label1.textAlignment = NSTextAlignment.Left
        label1.text = "qingjie"
        
        containerView.backgroundColor = UIColor.blueColor()
        
        
        containerView.addSubview(label1)
        tmpViews4.append(containerView)
        self.view.addSubview(containerView)
    }
    
    func addContainerView1(){
        let label2 = UILabel(frame: CGRectMake(100, 200, 200, 30))
        label2.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        label2.textColor = UIColor.greenColor()
        label2.textAlignment = NSTextAlignment.Left
        label2.text = "zhao"
        
        containerView1.backgroundColor = UIColor.greenColor()
        
        containerView1.addSubview(label2)
        tmpViews5.append(containerView1)
        self.view.addSubview(containerView1)
    }
    
    func removeCV(){
        removeContainerView()
        removeContainerView1()
    }
    
    func removeContainerView(){
          println(tmpViews4.count)
        if(tmpViews4.count > 0){
            for subview in tmpViews4 {
                println(subview)
                subview.removeFromSuperview()
            }
            //containerView.removeFromSuperview()
        }
        
        
    }
    
    func removeContainerView1(){
        if(tmpViews5.count > 0){
            for subview in tmpViews5 {
                println(subview)
                subview.removeFromSuperview()
            }
        }
        //containerView1.removeFromSuperview()
    
    }
    
    
    func removeSubV(){
        for subview in self.view.subviews {
            if !(subview is UILayoutSupport) {
                print(subview)
                subview.removeFromSuperview()
            }
        }
    }
    
    func removeSubLable(){
        for subview in view.subviews {
            if subview is UILabel {
                println(subview)
                subview.removeFromSuperview()
            }
        }
    }
    
    func unloadView(){
        unloadView1()
        unloadView2()
        unloadView3()
        
    }
    
    func loadView1(string:String){
        
        var DynamicView=UIView(frame: CGRectMake(100, 200, 200, 200))
        DynamicView.backgroundColor=UIColor.greenColor()
        DynamicView.layer.cornerRadius=25
        DynamicView.layer.borderWidth=2
        tmpViews1.append(DynamicView)
        
        let label1 = UILabel(frame: CGRectMake(100, 200, 200, 30))
        label1.backgroundColor = UIColor(white: 0.3, alpha: 0.3)
        label1.textColor = UIColor.redColor()
        label1.textAlignment = NSTextAlignment.Left
        label1.text = "Syracuse" + string
        DynamicView.addSubview(label1)
        tmpViews1.append(label1)
        self.view.addSubview(DynamicView)
    }
    
    func unloadView1(){
        if(tmpViews1.count > 0){
            for subview in tmpViews1 {
                println(subview)
                subview.removeFromSuperview()
            }
        }
    }
    
    func loadView2(){
        
        var sliderDemo = UISlider(frame:CGRectMake(20, 260, 280, 20))
        sliderDemo.minimumValue = 0
        sliderDemo.maximumValue = 100
        sliderDemo.continuous = true
        sliderDemo.tintColor = UIColor.orangeColor()
        sliderDemo.value = 50
        sliderDemo.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        tmpViews3.append(sliderDemo)
        self.view.addSubview(sliderDemo)
    }
    
    func unloadView2(){
        if(tmpViews2.count > 0){
            for subview in tmpViews2 {
                println(subview)
                subview.removeFromSuperview()
            }
        }
    }
    
    
    func sliderValueDidChange(sender:UISlider!)
    {
        println("value--\(sender.value)")
    }
    
    func loadView3(){
        var switchDemo=UISwitch(frame:CGRectMake(150, 300, 0, 0));
        switchDemo.on = true
        switchDemo.setOn(true, animated: false);
        switchDemo.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged);
        tmpViews3.append(switchDemo)
        self.view.addSubview(switchDemo);
    }
    
    func unloadView3(){
        if(tmpViews3.count > 0){
            for subview in tmpViews3 {
                println(subview)
                subview.removeFromSuperview()
            }
        }
    }
    
    func switchValueDidChange(sender:UISwitch!)
    {
        if (sender.on == true){
            println("on")
        }
        else{
            println("off")
        }
    }
    

    
}