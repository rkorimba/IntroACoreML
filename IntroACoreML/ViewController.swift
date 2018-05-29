//
//  ViewController.swift
//  IntroACoreML
//
//  Created by Riad Korimbacus on 29/05/2018.
//  Copyright © 2018 Riad Korimbacus. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var cameraVue: UIView!
    @IBOutlet weak var photoChoisieImageView: UIImageView!
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var rotationBouton: UIButton!
    @IBOutlet weak var librairie: UIButton!
    
    var captureSession: AVCaptureSession?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?
    var position = AVCaptureDevice.Position.back
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceCamera()
        rotationBouton.layer.cornerRadius = 5
        librairie.layer.cornerRadius = 5
        imagePicker.delegate = self
    }

    @IBAction func librairieAction(_ sender: Any) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func rotationAction(_ sender: Any) {
    
        switch position {
        case .front: position = .back
        case .back: position = .front
        case .unspecified: position = .back
        }
        miseEnPlaceCamera()
    }
    
}
