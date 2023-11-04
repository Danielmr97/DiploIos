//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by Daniel Mayo on 03/11/23.
//

import Foundation
import UIKit

class CollectionViewController : UIViewController {
    let size = UIScreen.main.bounds.width / 2
    var dataArray = ["Manuel", "Grecia","Alex","Daniel"]
    
    
    @IBOutlet weak var myTextFieldAdd: UITextField!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet{
            collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        }
    }
    @IBAction func myButtonAdd(_ sender: Any) {
        dataArray.append(myTextFieldAdd.text ?? "")
        myTextFieldAdd.text = ""
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

        
        let longPressGesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handleLongPressGesture)
        )
        
        collectionView.addGestureRecognizer(longPressGesture)
    }
    //Poder mover elemento dentro de  un collection view
    @objc private func handleLongPressGesture(_ gesture : UILongPressGestureRecognizer){
        let gestureLocation = gesture.location(in: collectionView)
        switch gesture.state{
            //Cuando inicia el click al moverlo
        case .began :
            guard let targetIndexPath = collectionView.indexPathForItem(at: gestureLocation) else {return}
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
            
        case .changed :
            collectionView.updateInteractiveMovementTargetPosition(gestureLocation)
        
        case .ended :
            collectionView.endInteractiveMovement()
        default :
            collectionView.cancelInteractiveMovement()
        }
    }
}
extension CollectionViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell
        cell?.myTextLabel.text = dataArray[indexPath.row]
        return cell!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
}

extension CollectionViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(item, at: destinationIndexPath.row)
    }
}

extension CollectionViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
           return CGSize(width: size, height: size)
        }else {
           return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        }
    }
}
