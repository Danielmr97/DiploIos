//
//  ImageStackViewController.swift
//  1App22deSep
//
//  Created by Daniel Mayo on 29/09/23.
//

import UIKit

class ImageStackViewController: UIViewController {

    var showCat = false
    
    @IBOutlet weak var secondCaptionedImageView: CaptionedImage!
    @IBOutlet weak var firtCaptionedImageView: CaptionedImage!
    @IBOutlet weak var thirdCaptionedImageVIew: CaptionedImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        if showCat {
            firtCaptionedImageView.setContent(image: "images-2", caption: "images-2")
            secondCaptionedImageView.setContent(image: "images-3", caption: "images-3")
            thirdCaptionedImageVIew.setContent(image: "images-4", caption: "images-4")
        } else {
            firtCaptionedImageView.setContent(image: "perro-2", caption: "perro-2")
            secondCaptionedImageView.setContent(image: "perro-1", caption: "perro-1")
            thirdCaptionedImageVIew.setContent(image: "perro-3", caption: "perro-3")
        }
    }
    

}
