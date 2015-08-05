//
//  TableSwipeViewController.swift
//  Test_Animation_01
//
//  Created by Jeremy Juel on 7/2/15.
//  Copyright (c) 2015 Jeremy Juel. All rights reserved.
//

import UIKit

class TableSwipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SwipeTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    var swipeCells = [SwipeItem]()
    var numCells = 20
    
    //var swipeBGVC = SwipeBGViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(SwipeTableViewCell.self, forCellReuseIdentifier: "cell")
        
        //tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.rowHeight = 50.0
        
        if swipeCells.count > 0 {
            return
        }
        
        for (var i = 0; i < numCells; i++) {
            swipeCells.append(SwipeItem(text: "Times I've seen a ghost: \(i)", state: 0))
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swipeCells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SwipeTableViewCell
        let item = swipeCells[indexPath.row]
        cell.delegate = self
        cell.swipeItem = item
        cell.selectionStyle = .None
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.text = item.text
        return cell
    }

    func colorForIndex(index: Int) -> UIColor {
        let itemCount = swipeCells.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
            //cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    
    // This is a protocol method set up in the SwipeTableViewCell class, implemented through the delegate at the top of this class
    func swipeItemDeleted(swipeItem: SwipeItem) {
        let index = (swipeCells as NSArray).indexOfObject(swipeItem)
        if index == NSNotFound { return }
        
        swipeCells.removeAtIndex(index)
        
        tableView.beginUpdates()
        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
        tableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
        tableView.endUpdates()
    }
    
    func createSwipeBG(swipeItem: SwipeItem) {
        let index = (swipeCells as NSArray).indexOfObject(swipeItem)
        if index == NSNotFound { return }
        
        let newBG = UIView(frame: CGRectMake(0, 0, view.bounds.width, view.bounds.height + tableView.contentOffset.y))
        newBG.backgroundColor = UIColor.clearColor()
        newBG.alpha = 0.0
        tableView.addSubview(newBG)
        tableView.bringSubviewToFront(newBG)
        
        
        let cellIndexPath = NSIndexPath(forItem: index, inSection: 0)
        let newCell = tableView.cellForRowAtIndexPath(cellIndexPath)
        tableView.addSubview(newCell!)
        tableView.bringSubviewToFront(newCell!)
    }
    
    func swipeBGChangeColor(color: CGColor) {
        var viewToChangeColor:UIView = tableView.subviews[tableView.subviews.count-2] as! UIView
        viewToChangeColor.backgroundColor = UIColor(CGColor: color)
        viewToChangeColor.alpha = 1.0
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: nil, animations: {
            viewToChangeColor.alpha = 1.0
        }, completion: nil)
        
    }
    
    func removeSwipeBG(swipeItem: SwipeItem) {
        //tableView.subviews.last!.removeFromSuperview()
        var viewToRemove:UIView = tableView.subviews[tableView.subviews.count-2] as! UIView
        
        viewToRemove.alpha = 1.0
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: nil, animations: {
            viewToRemove.alpha = 0.0
        }, completion: nil)
        
        viewToRemove.removeFromSuperview()
    }
    
    
}
