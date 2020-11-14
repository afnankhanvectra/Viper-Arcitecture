//
//  ProjectPresentor.swift
//  ViperDemo
//
//  Created by Afnan Khan on 11/14/20.
//  Copyright © 2020 Afnan Khan. All rights reserved.
//

import Foundation

class ProjectPresentor : ViewToPresentroProtocol {
    
    var view: PresentorToViewProtocol?
    
    var interactor: PresentorToInteractorProtocol?
    
    var router: PresentorToRouteProtocol?
    
    func getTodoList() {
        interactor?.fetchTodoList()
    }
    

}


extension ProjectPresentor :  InteractorToPresentorProtocol{
    
    func todoListFetched(todoList: [TodoObject]) {
        view?.showTodoList(todoList: todoList)
    }
    
    func todoListFetchedFailed() {
        view?.showError()
    }
    

}
