//
//  ViewController.swift
//  ViperDemo
//
//  Created by Afnan Khan on 11/14/20.
//  Copyright © 2020 Afnan Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView      :         UITableView!
    @IBOutlet var getDataButton      :    UIButton!
    
    var presenter: ViewToPresentroProtocol?

    var todos : [TodoObject] = [TodoObject]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProjectRouter.createModule(forViewController: self)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    
   @IBAction func getButtonButtonClicked(_ sender: UIButton) {
 
    presenter?.getTodoList()
   }
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

         let todo = todos[indexPath.row]
        cell?.textLabel?.text = "Title : \(todo.title)"
        cell?.detailTextLabel?.text = "User Id : \(todo.userId) ID : \(todo.id)"

        return cell!
    }
    
    
}


 
extension ViewController :  PresentorToViewProtocol {
    func showTodoList(todoList: [TodoObject]) {
         todos = todoList
    }
    
    func showError() {
         
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Todo list", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
