//
//  ViewController.swift
//  UTubeVue
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check if a video was indeed selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // get a ref to the video that was tapped on
        let selectedItem =  videoList[tableView.indexPathForSelectedRow!.row]
        
        // Detail view controller - Ref
        let destinationVC = segue.destination as! DetailViewController
        
        // Detail View Controller - Set Video
        destinationVC.video = selectedItem
        
    }
    
    // MARK: Video Model Delegate
    func videoRetrieved(_ videos: [Video]) {
        // set the retrieved videos
        self.videoList = videos
        
        // Reload TableView
        tableView.reloadData()
    }

    // MARK: Video TableView Datasource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.UI_TABLE_CELL_VIDEO, for: indexPath) as! VideoTableViewCell
        
        // Configure Cell
        let video = self.videoList[indexPath.row]
        
        cell.setCell(video)
        
        // Return Cell
        return cell
        
    }
    
    // MARK: Video TableView Delegate Methods
    // Customize methods to handle user interaction like tap
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

