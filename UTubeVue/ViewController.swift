//
//  ViewController.swift
//  UTubeVue
//
//  Created by Jamshed Qureshi on 2021-03-14.
//

import UIKit

class ViewController: UIViewController {

    var videoModel = VideoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        videoModel.getVideoList()
        
        
    }


}

