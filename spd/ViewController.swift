//
//  ViewController.swift
//  spd
//
//  Created by Stanley Malec on 17/09/16.
//  Copyright © 2016 htn-ios. All rights reserved.
//

import UIKit
//import Alamofire
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //@IBOutlet weak var loadingINdicator: STSpotLoadView!
        let imagePicker = UIImagePickerController()
    let SOS = SOSHTTPSessionManager.shared()
    @IBOutlet weak var uploadIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var uploadButtonView: UIView!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var selectViewUnderline: UIView!
    @IBOutlet weak var scanImageView: UIImageView!
 
    @IBAction func OnStartUpload(_ sender: AnyObject) {
        UploadRequest()
        //        imageUploadRequest(imageView: scanImageView, param: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        print("YESE")
        
        scanImageView.isHidden = false
        uploadButtonView.isHidden = false
        selectViewUnderline.isHidden = true
        selectButton.isHidden = true 
        scanImageView.contentMode = .scaleAspectFit
        scanImageView.image = image
        print("slecetcted: \(image.description)")
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //info[UIImagePickerControllerOriginalImage] as? UIImage
        scanImageView.isHidden = false
        uploadButtonView.isHidden = false
        selectViewUnderline.isHidden = true
        selectButton.isHidden = true
        scanImageView.contentMode = .scaleAspectFit
        scanImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func SelectImage(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Select source", message: "", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default, handler: { (action) -> Void in
            self.openCameraButton()
        })
        let photos = UIAlertAction(title: "Photos", style: .default) { (action) -> Void in
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .photoLibrary
            //present(self.imagePicker, animated: true, completion: nil)
            //present(self.imagePicker, animated: true, completion: nil)
            self.show(self.imagePicker, sender: nil)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) -> Void in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(camera)
        alertController.addAction(photos)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func openCameraButton() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            //var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
        uploadButtonView.layer.cornerRadius = 10
        uploadButtonView.layer.opacity = 0.9
        uploadButtonView.isHidden = true
        scanImageView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func UploadRequest(){
        uploadButton.setTitle("", for: .normal)
        uploadIndicatorView.startAnimating()
        SOS?.uploadImage(scanImageView.image!, completion: { (error, response) in
            if (error != nil) {
                self.uploadIndicatorView.stopAnimating()
                print("error")
            } else {
                self.SOS?.note = response as! SOSNote!
                self.DoneUploaded()
            }
            
        })
        
        
        
        //let imageData = UIImagePNGRepresentation(self.scanImageView.image!)
       
        
        //save the file in some cache.
        //X-SOSAuthorizatio
        
      //////
        //HERE
        ///////

    }
    func DoneUploaded(){
        performSegue(withIdentifier: "show", sender: self)
    }
    
    func OnUploaded() {
        self.uploadIndicatorView.stopAnimating()
        //self.loadingINdicator.stopAnimation()
        self.uploadButton.setTitle("Done!", for: .normal)
        print("<>end")
        
    }
    
    
}



