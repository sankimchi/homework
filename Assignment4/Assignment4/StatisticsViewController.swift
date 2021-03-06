//
//  SecondViewController.swift
//  Assignment4
//
//  Created by Kiwook Kim on 7/12/16.
//  Copyright © 2016 sankim. All rights reserved.
//
//icons courtesy of Icon8


import UIKit
class StatisticsViewController: UIViewController {
    
    @IBOutlet var LivingText: UITextField!
    @IBOutlet var BornText: UITextField!
    @IBOutlet var DiedText: UITextField!
    @IBOutlet var EmptyText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sel = #selector(StatisticsViewController.watchForNotifications(_:))
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: sel, name: "Engine rc notification", object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func watchForNotifications(notification:NSNotification)
    {
        var livingC = 0
        var bornC = 0
        var diedC = 0
        var emptyC = 0
        
        let grid = notification.userInfo!["value"] as! GridProtocol
        let cols = grid.cols
        let rows = grid.rows
        
        for r in 0..<rows
        {
            for c in 0..<cols
            {
                if grid[r,c] == .Living
                    {livingC += 1}
                else if grid[r,c] == .Born
                    {bornC += 1}
                else if grid[r,c] == .Died
                    {diedC += 1}
                else if grid[r,c] == .Empty
                    {emptyC += 1}
            }
        }
        
        LivingText.text = String(livingC)
        BornText.text = String(bornC)
        DiedText.text = String(diedC)
        EmptyText.text = String(emptyC)
        
    }
 
}

