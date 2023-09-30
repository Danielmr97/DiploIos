//
//  ImageStackViewController.swift
//  1App22deSep
//
//  Created by Daniel Mayo on 29/09/23.
//

import UIKit

class ImageStackViewController: UIViewController {

    var showCat = false
    
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var firtImageView: UIImageView!
    @IBOutlet weak var thirdImageVIew: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if showCat {
            firtImageView.image = UIImage(named: "images-2")
            secondImageView.image = UIImage(named: "images-3")
            thirdImageVIew.image = UIImage(named: "images-4")
        } else {
            firtImageView.image = UIImage(named: "perro-2")
            secondImageView.image = UIImage(named: "perro-1")
            thirdImageVIew.image = UIImage(named: "perro-3")
        }
    }
    

}
