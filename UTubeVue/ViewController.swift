//
//  ViewController.swift
//  UTubeVue
//
//  Created by Jamshed Qureshi on 2021-03-14.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, VideoModelDelegate{
        
    @IBOutlet weak var tableView: UITableView!
    
    var videoModel = VideoModel()
    var videoList = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        // Set TableView Datasource and Delegate
        tableView.dataSource = self
        tableView.delegate = self
    
        // Set VideoModel Delegate
        videoModel.delegate = self
        
        videoModel.getVideoList()
        
    }
    
    // MARK: Video Model Delegate
    func videoRetrieved(_ videos: [Video]) {
        // set the retrieved videos
        self.videoList = videos
        
        // Reload TableView
        tableView.reloadData()
    }

    // MARK: TableView Datasource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.UI_TABLE_CELL_VIDEO, for: indexPath)
        
        // Configure Cell
        let title = self.videoList[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // Return Cell
        return cell
        
    }
    
    // MARK: TableView Delegate Methods
    // Customize methods to handle user interaction like tap
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

