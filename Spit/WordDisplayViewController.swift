//
//  WordDisplayViewController.swift
//  Spit
//
//  Created by Haaris Muneer on 8/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation
import CoreData
import MediaPlayer

class WordDisplayViewController: UIViewController {
    
    var wordDisplayLabel: UILabel!
    var tableView: UITableView!
    var controlStackView: UIStackView!
    var frequencyLabel: UILabel!
    var frequencyControl: UISegmentedControl!
    var unitLabel: UILabel!
    var stopButton: UIButton!
    var playlist:[NSManagedObject] = []
    var navBar: UINavigationBar!
    var addSongButton: UIBarButtonItem!
    let audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpViews()
        
    }
    
    func setUpViews() {
        wordDisplayLabel = UILabel()
        self.view.addSubview(wordDisplayLabel)
        wordDisplayLabel.text = "Hello"
        wordDisplayLabel.adjustsFontSizeToFitWidth = true
        wordDisplayLabel.textAlignment = .center
        wordDisplayLabel.font = UIFont(name: "LemonMilk", size: 80)
        
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "songCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        frequencyLabel = UILabel()
        frequencyLabel.text = "I want a new word every..."
        
        frequencyControl = UISegmentedControl(items: ["2", "4", "8"])
        
        unitLabel = UILabel()
        unitLabel.text = "seconds"
        
        stopButton = UIButton(type: .system)
        stopButton.setTitle("Stop", for: UIControlState())
        
        controlStackView = UIStackView(arrangedSubviews: [frequencyLabel, frequencyControl, unitLabel, stopButton])
        controlStackView.alignment = .center
        controlStackView.distribution = .equalSpacing
        controlStackView.axis = .vertical
        self.view.addSubview(controlStackView)
        
        navBar = UINavigationBar()
        self.view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Spit!")
        addSongButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(openMediaPicker))
        navItem.leftBarButtonItem = addSongButton
        navBar.setItems([navItem], animated: true)
        
        self.setUpConstraints()
    }
    

    func setUpConstraints() {
       
        wordDisplayLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.view).multipliedBy(0.9)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(70)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.width.equalTo(self.view)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.height.equalTo(self.view).multipliedBy(0.35)
        }
        
        controlStackView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.width.equalTo(self.view)
            make.bottom.equalTo(self.tableView.snp.top).offset(-10)
            make.top.equalTo(self.wordDisplayLabel.snp.bottom).offset(10)
        }
        
        navBar.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(44)
        }
    }

}

extension WordDisplayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "songCell")
        
        let song = playlist[indexPath.row]
//        let text = song.value(forKey: "artist") as? String + " - " + song.value(forKeyPath: "title") as? String
        cell.textLabel?.text = song.value(forKey: "title") as? String
        cell.detailTextLabel?.text = "sup"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension WordDisplayViewController: MPMediaPickerControllerDelegate {
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
}

