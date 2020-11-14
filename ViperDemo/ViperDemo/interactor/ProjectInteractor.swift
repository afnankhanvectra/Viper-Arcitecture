//
//  ProjectInteractor.swift
//  ViperDemo
//
//  Created by Afnan Khan on 11/14/20.
//  Copyright © 2020 Afnan Khan. All rights reserved.
//

import Foundation
import Alamofire

class ProjectInteractor: PresentorToInteractorProtocol{
    var presenter: InteractorToPresentorProtocol?
    
    
    private  let URL = "https://jsonplaceholder.typicode.com/todos"

    func fetchTodoList() {
         
        Alamofire.request(URL).response { response in
            if(response.response?.statusCode == 200){
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode([TodoObject].self, from: data)
                     
                    self.presenter?.todoListFetched(todoList: newsResponse)
                } catch let error {
                    print(error)
                }
            }
            else {
                self.presenter?.todoListFetchedFailed()
            }
        }
        
    }
    

}
