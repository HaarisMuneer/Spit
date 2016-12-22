//
//  MediaPickerViewController.swift
//  Spit
//
//  Created by Haaris Muneer on 12/22/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import MediaPlayer


class MediaPickerViewController: UIViewController, MPMediaPickerControllerDelegate {
    
    var pickMediaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickMediaButton = UIButton(type: .system)
        
        pickMediaButton.setTitle("Open iTunes", for: .normal)
        
        pickMediaButton.addTarget(self, action: #selector(openMediaPicker), for: .touchUpInside)
        
        self.view.addSubview(pickMediaButton)
        
        pickMediaButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openMediaPicker() {
        let mediaPicker = MPMediaPickerController(mediaTypes: .any)
        mediaPicker.delegate = self
        mediaPicker.allowsPickingMultipleItems = false
        mediaPicker.prompt = "Select a song!"
        
        self.present(mediaPicker, animated: true, completion: nil)
        
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        self.dismiss(animated: true, completion: nil)
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
