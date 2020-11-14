//
//  PojectRouter.swift
//  ViperDemo
//
//  Created by Afnan Khan on 11/14/20.
//  Copyright © 2020 Afnan Khan. All rights reserved.
//

import Foundation
import UIKit

class ProjectRouter : PresentorToRouteProtocol {
    
    static func createModule(forViewController view: UIViewController) {
        
        let presenter: ViewToPresentroProtocol & InteractorToPresentorProtocol = ProjectPresentor()
                   let interactor: PresentorToInteractorProtocol = ProjectInteractor()
                   let router: PresentorToRouteProtocol = ProjectRouter()
                   
                   (view as! ViewController).presenter = presenter
               
               presenter.view = view as? PresentorToViewProtocol
                   presenter.router = router
                   presenter.interactor = interactor
                   interactor.presenter = presenter
        
        
    }
    

    
}
