//
//  ViewController.swift
//  IPV4Demo
//
//  Created by Harly on 2018/3/28.
//  Copyright © 2018年 Harly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextFiled: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func tappedResult(_ sender: UIButton)
    {
        let txt = inputTextFiled.text ?? ""
        
        do
        {
            resultLabel.text = try "\(txt.caculate())"
        }
        catch
        {
            let demoError = error as! DemoError
            resultLabel.text = demoError.errorDescription()
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

