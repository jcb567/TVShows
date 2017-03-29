//
//  TVViewController.swift
//  TVShows
//
//  Created by Jake Cameron Booth on 29/03/2017.
//  Copyright © 2017 Jake Cameron Booth. All rights reserved.
//

import UIKit

class TVViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var tvImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }

    
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        tvImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
        //remember to dismiss the imagePicker - this brings the photo back to the app.
    }
   
    
    @IBAction func cameraTapped(_ sender: Any) {
    }

    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let show = Show(context: context)
        show.title = titleTextField.text
        show.image = UIImagePNGRepresentation(tvImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    
}
