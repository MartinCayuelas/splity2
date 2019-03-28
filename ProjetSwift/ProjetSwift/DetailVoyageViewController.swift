//
//  DetailVoyageController.swift
//  ProjetSwift
//
//  Created by Martin Cayuelas on 18/03/2019.
//  Copyright © 2019 Nathan GUILLAUD et Martin CAYUELAS. All rights reserved.
//

import Foundation
import UIKit

class DetailVoyageViewController: UIViewController{
    
    @IBOutlet weak var imageVoyage: UIImageView!
    @IBOutlet weak var titreVoyage: UILabel!
    
    var voyageSelected : Voyage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let avoyage = self.voyageSelected {
            self.titreVoyage
                .text = avoyage.titre
         self.imageVoyage.image =  UIImage(named: avoyage.photo)
            
        } else {
            self.titreVoyage.text = ""
           
        }
        
    }
    
    //Pour donner le voyage sélectionné à la page suivante (liste des dépenses)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destController = segue.destination as? DepensesViewController {
            destController.voyageSelected = self.voyageSelected
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
