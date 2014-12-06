//
//  GlueViewController.swift
//  Glue
//
//  Created by Dominique d'Argent on 10/11/14.
//  Copyright (c) 2014 Dominique d'Argent. All rights reserved.
//

import UIKit


/// GlueViewController can be used in a storyboard to glue it together with another one.
/// You do not need to write any code at all, everything can be linked directly in the
/// storyboard files.
@IBDesignable public class GlueViewController: UIViewController {
    /// The name of the storyboard which contains the view controller to be glued.
    /// When |nil| the current storyboard will be used.
    /// This property can be set directly in the storyboard file.
    @IBInspectable public var storyboardName: String?
    
    /// The storyboard ID of the view controller to be glued.
    /// When |nil| the initial view controller of the specified storyboard will be used.
    /// This property can be set directly in the storyboard file.
    @IBInspectable public var viewControllerIdentifier: String?
    
    lazy private var gluedStoryboard: UIStoryboard? = self.loadGluedStoryboard()
    
    /// The glued view controller. Can be used in prepareForSegue(segue:, sender:) to pass
    /// data.
    lazy public var gluedViewController: UIViewController? = self.loadGluedViewController()
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if let glued = gluedViewController {
            // add glued view controller as child view controller
            addChildViewController(glued)
            view.addSubview(glued.view)
            glued.didMoveToParentViewController(self)
        }
    }
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        // check if we are in a tab bar controller
        if let tab = tabBarController {
            if let viewControllers = tab.viewControllers as NSArray? {
                // check if we're a tab
                let index = viewControllers.indexOfObject(self)
                if index != NSNotFound {
                    if let glued = gluedViewController {
                        // copy tab bar item over to glued view controller
                        glued.tabBarItem = tabBarItem
                        
                        // replace this view controller with glued controller
                        var newViewControllers = NSMutableArray(array: viewControllers)
                        newViewControllers.replaceObjectAtIndex(index, withObject: glued)
                        
                        // update tab bar
                        tab.setViewControllers(newViewControllers, animated: false)
                    }
                }
            }
        }
    }
}


// MARK: - Private

private extension GlueViewController {
    func loadGluedStoryboard() -> UIStoryboard? {
        if let name = storyboardName {
            return UIStoryboard(name: name, bundle: nil)
        }
        
        return self.storyboard
    }
    
    func loadGluedViewController() -> UIViewController? {
        if let storyboard = gluedStoryboard {
            if let identifier = viewControllerIdentifier {
                return storyboard.instantiateViewControllerWithIdentifier(identifier) as? UIViewController
            }
            else {
                return storyboard.instantiateInitialViewController() as? UIViewController
            }
        }
        
        return nil
    }
}
