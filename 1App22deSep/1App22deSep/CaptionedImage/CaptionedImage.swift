//
//  CaptionedImage.swift
//  1App22deSep
//
//  Created by Daniel Mayo on 13/10/23.
//

import UIKit

class CaptionedImage: UIView {
    
    @IBOutlet weak var captionLabel : UILabel!
    @IBOutlet weak var imageView : UIImageView!
    
    @IBOutlet weak var contentView: UIView!
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView(){
        Bundle.main.loadNibNamed("CaptionedImage", owner: self)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}
