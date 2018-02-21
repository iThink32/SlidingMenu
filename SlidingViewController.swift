//
//  DetailViewController.swift
//  FlyOverTest
//
//  Created by N A Shashank on 2/19/18.
//  Copyright © 2018 N A Shashank. All rights reserved.
//

import UIKit


public class SlidingViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var constraintTableViewLeading: NSLayoutConstraint!
    @IBInspectable var slidingViewWidth:CGFloat = 238
    
    var childController:UIViewController?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapGesture)
        self.embedChildController()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.constraintTableViewLeading.constant = 0
        UIView.animate(withDuration: 0.3) {[weak self] in
            self?.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self?.view.layoutIfNeeded()
        }
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func viewTapped() {
        self.constraintTableViewLeading.constant = -slidingViewWidth
        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            self?.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
            self?.view.layoutIfNeeded()
        }) { [weak self](flag) in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    func embedChildController() {
        guard let childController = self.childController else{
            return
        }
        self.addChildViewController(childController)
        self.containerView.addSubview(childController.view)
        self.childController?.view.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = NSLayoutConstraint(item: childController.view, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.containerView, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant:0)
        let widthConstraint = NSLayoutConstraint(item: childController.view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant:slidingViewWidth)
        let topConstraint = NSLayoutConstraint(item: childController.view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.containerView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: childController.view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.containerView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        self.containerView.addConstraints([leadingConstraint,widthConstraint,topConstraint,bottomConstraint])
        childController.didMove(toParentViewController: self)
    }
    
    public class func instance() -> SlidingViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: SlidingViewController.self))
        return storyboard.instantiateViewController(withIdentifier: "SlidingViewController") as! SlidingViewController
        
    }
    
    public func initWith(controller:UIViewController) {
        self.childController = controller
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
