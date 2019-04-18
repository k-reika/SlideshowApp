//
//  ResultViewController.swift
//  SlideshowApp2
//
//  Created by 菊池 玲花 on 2019/04/18.
//  Copyright © 2019 reika.kikuchi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var image: UIImage!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBAction func TapretrunButton(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.image = self.image
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
