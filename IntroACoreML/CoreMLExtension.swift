//
//  CoreMLExtension.swift
//  IntroACoreML
//
//  Created by Riad Korimbacus on 31/05/2018.
//  Copyright © 2018 Riad Korimbacus. All rights reserved.
//

import UIKit
import CoreML
import Vision

extension ViewController {
    
    func requete(data: Data) {
    
        do {
            let coreMLModel = try VNCoreMLModel(for: MobileNet().model)
            let requete = VNCoreMLRequest(model: coreMLModel, completionHandler: reponse)
            let requeteHandler = VNImageRequestHandler(data: data)
            try requeteHandler.perform([requete])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func reponse(_ requete: VNRequest, _ erreur: Error?) {
        
        if let result = requete.results as? [VNClassificationObservation] {
            for res in result {
                print(res.identifier)
                print(Int(res.confidence * 100  ))
            }
        }
        
    }
    
    
}
