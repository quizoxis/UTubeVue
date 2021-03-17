//
//  DetailViewController.swift
//  UTubeVue
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDatePublished: UILabel!
    @IBOutlet weak var webviewContent: WKWebView!
    @IBOutlet weak var textviewDetails: UITextView!
    
    var video:Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        // Reset fields
        labelTitle.text = ""
        labelDatePublished.text = ""
        textviewDetails.text = ""
        
        // Check video
        guard video != nil else {
            return
        }
        
        // create the embed url
        let embedUrl = Constants.YOUTUBE_EMBED_URL + video!.videoId
        
        // load it into the webview
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webviewContent.load(request)
        
        // set the title
        labelTitle.text = video!.title
        
        
        // set the date
        labelDatePublished.text = DateTimeUtil.formatDate(date: video!.published)
        
        // set the description
        textviewDetails.text = video!.description
        
        
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
