//
//  AlarmViewController.swift
//  alarm
//
//  Created by Chris Chares on 6/2/14.
//  Copyright (c) 2014 eunoia. All rights reserved.
//

import UIKit
import MediaPlayer
import CoreLocation

class AlarmCreationViewController: UITableViewController, MPMediaPickerControllerDelegate, MapViewControllerDelegate  {

    /*
    IBOutlets
    */
    @IBOutlet var titleLabel : UITextField
    
    @IBOutlet var mapCell : UITableViewCell
    @IBOutlet var mapCellLabel : UILabel
    
    @IBOutlet var mediaCell : UITableViewCell
    @IBOutlet var mediaImageView : UIImageView

    /*
    Properties
    */
    
    var mediaItem:MPMediaItem?
    var region:CLCircularRegion?
    
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func cancel(_ sender : AnyObject) {
        
        navigationController?.presentingViewController?.dismiss(animated: true, completion: {});
        
    }

    @IBAction func save(_ sender : AnyObject) {
        
        if ( region == nil || mediaItem == nil || (titleLabel.text?.isEmpty)! ) {
            //validation failed
            return
        }
        
        
        var alarm = Alarm(title: titleLabel.text!, region: region!, media: mediaItem!)

        
        navigationController?.presentingViewController?.dismiss(animated: true, completion: {
            
            let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.addAlarm(alarm)
            
        });
    }

    /*
    #pragma mark - UITableViewDelegate
    */

    override func tableView(_ tableView: UITableView!, didSelectRowAt indexPath: IndexPath) {
    
        let cell = tableView.cellForRow(at: indexPath)
        if ( cell == mediaCell ) {
            
            let mediaPicker = MPMediaPickerController(mediaTypes: .music)
            mediaPicker.delegate = self
            mediaPicker.prompt = "Select any song!"
            mediaPicker.allowsPickingMultipleItems = false
            present(mediaPicker, animated: true, completion: {})
            
        }
        
    }
    
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {

        if ( segue!.identifier == "map" ) {
            let mapVC = segue!.destination as! MapViewController;
            mapVC.delegate = self;
        }
    }
    
    /*
    MapViewControllerDelegate
    */
    func returnedRegion(_ region: CLCircularRegion) {
        
        
        self.region = region
        mapCellLabel.text = "Region Selected"
        self.navigationController?.popViewController(animated: true)
    }

    
    /*
    MPMediaPickerControllerDelegate
    */
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems  mediaItems:MPMediaItemCollection) -> Void
    {
        let aMediaItem = mediaItems.items[0] as MPMediaItem
        if (( aMediaItem.artwork ) != nil) {
            mediaImageView.image = aMediaItem.artwork?.image(at: mediaCell.contentView.bounds.size);
            mediaImageView.isHidden = false;
        }
      
        self.mediaItem = aMediaItem;
        //fillData(aMediaItem);
        self.dismiss(animated: true, completion: {});
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        self.dismiss(animated: true, completion: {});
    }
    
}
