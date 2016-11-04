//
//  ViewController.swift
//  TesseractOCRTest
//
//  Created by mino on 2016. 11. 5..
//  Copyright © 2016년 mino. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tesseract = G8Tesseract(language: "eng+kor") {
            tesseract.delegate = self
            //tesseract.charWhitelist = "0123456789"
            tesseract.image = UIImage(named: "screen_eng")?.g8_blackAndWhite()
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
        }
    }

    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress)%")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

