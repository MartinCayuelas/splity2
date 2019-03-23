//
//  VoyageurDAO.swift
//  ProjetSwift
//
//  Created by Nathan GUILLAUD on 22/03/2019.
//  Copyright © 2019 Nathan GUILLAUD et Martin CAYUELAS. All rights reserved.
//

import Foundation

import CoreData

class VoyageurDAO{
    static let request : NSFetchRequest<Voyageur> = Voyageur.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
 /// Appelé lorsqu'un que l'on supprime un voyageur dans les données persistantes
 /// 
 /// - Parameters: Voyageur
    static func delete(voyageur: Voyageur){
        CoreDataManager.context.delete(voyageur)
    }
    
     /// Appelé pour récuprer tous les voyegeurs dans la base de données
 /// 
 /// - Parameters: none
    static func fetchAll() -> [Voyageur]?{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return nil
        } }
    
    /// number of elements
    static var count: Int{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        
    }
    static func count(forPrenom prenom: String) -> Int{
        self.request.predicate = NSPredicate(format: "prenom == %@", prenom)
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        
    }
    static func search(forPrenom prenom: String) -> [Voyageur]?{
        self.request.predicate = NSPredicate(format: "prenom == %@", prenom)
        do{
            return try CoreDataManager.context.fetch(request) as [Voyageur]
        }
        catch{
            return nil
        }
        
    }
    static func count (forNom nom: String) -> Int{
        self.request.predicate = NSPredicate(format: "nom == %@", nom)
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        
    }
    static func search(forNom nom: String) -> [Voyageur]?{
        self.request.predicate = NSPredicate(format: "nom == %@", nom)
        do{
            return try CoreDataManager.context.fetch(request) as [Voyageur]
        }
        catch{
            return nil
        }
        
    }
    static func count(forPrenom prenom: String, nom: String) -> Int{
        self.request.predicate = NSPredicate(format: "prenom == %@ AND nom == %@", prenom, nom)
        do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    static func search(forPrenom prenom: String, nom: String) -> [Voyageur]?{
        self.request.predicate = NSPredicate(format: "prenom == %@ AND nom == %@", prenom, nom)
        do{
            return try CoreDataManager.context.fetch(request) as [Voyageur]
        }
        catch{
            return nil
        } }

    static func count(voyageur: Voyageur) -> Int{

            self.request.predicate = NSPredicate(format: "prenom == %@ AND nom == %@",
                                                 voyageur.prenom, voyageur.nom as CVarArg)
 do{
            return try CoreDataManager.context.count(for: self.request)
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        
    }
    
    static func search(forVoyageur voyageur: Voyageur) -> Voyageur?{
            self.request.predicate = NSPredicate(format: "prenom == %@ AND nom == %@",
                                                 voyageur.prenom, voyageur.nom as CVarArg)
        do{
            let result = try CoreDataManager.context.fetch(request) as [Voyageur]
            guard result.count != 0 else { return nil }
            guard result.count == 1 else { fatalError("duplicate entries") }
            return result[0]
        }
        catch{
            return nil
        }
        
    }
}
