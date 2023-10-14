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
            firtCaptionedImageView.imageView.image = UIImage(named: "images-2")
            secondCaptionedImageView.imageView.image = UIImage(named: "images-3")
            thirdCaptionedImageVIew.imageView.image = UIImage(named: "images-4")
        } else {
            firtCaptionedImageView.imageView.image = UIImage(named: "perro-2")
            secondCaptionedImageView.imageView.image = UIImage(named: "perro-1")
            thirdCaptionedImageVIew.imageView.image = UIImage(named: "perro-3")
        }
    }
    

}
