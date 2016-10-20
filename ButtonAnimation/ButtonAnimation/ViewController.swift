//
//  ViewController.swift
//  ButtonAnimation
//
//  Created by YUMIKO HARAGUCHI on 2016/10/20.
//  Copyright © 2016年 YUMIKO HARAGUCHI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: AnimateButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.buttonDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: button delegate
extension ViewController : ButtonDelegate{
    
    func ButtonTapEvent(button: UIButton, isCancel: Bool) {
        if isCancel {
            label.text = "ボタンタップキャンセル"
        } else {
            label.text = "ボタンタップ！"
        }
    }
}
