//
//  VideoTableViewCell.swift
//  UTubeVue
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageViewThumbnail: UIImageView!
    
    @IBOutlet weak var labelVideoTitle: UILabel!
    
    @IBOutlet weak var labelDatePublished: UILabel!
    
    
    var moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var video:Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v:Video) {
        
        self.video = v
        
        // Check if we have a video
        guard self.video != nil else {
            return
        }
        
        // Set Title and pub date
        self.labelVideoTitle.text = video?.title
        
        self.labelDatePublished.text = DateTimeUtil.formatDate(date: video!.published)
            
        
        // Set video thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Grab cache image if available
        if let cacheData = ThumbnailCacheController(moc: self.moc).getThumbnail(url: self.video!.thumbnail) {
            // set the thumbnail
            self.imageViewThumbnail.image = UIImage(data: cacheData)
            return
        }
    
        
        // download the thumbnail
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            
            if error == nil && data != nil {
                
                
                // Save image data in the thumbnail cache store
                ThumbnailCacheController(moc: self.moc).setThumbnail(url: url!.absoluteString, data: data)
                
                
                // check the downloaded url matches the video thumbnail
                // url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    return
                }
                
                // create the image object
                let image = UIImage(data: data!)
                
                
                // set the imageview
                DispatchQueue.main.async {
                    self.imageViewThumbnail.image = image
                }
                
            }
        }
        // execute data task
        dataTask.resume()
        
    }
}
