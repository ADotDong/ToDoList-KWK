//
//  AddToDoViewController.swift
//  ToDoList v2
//
//  Created by Qunfeng Dong on 6/23/20.
//  Copyright © 2020 Amy Dong. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    //that ToDo array lives on another class
    var previousVC = ToDoTableViewController()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            // we are creating a new ToDoCD object here, naming it toDo
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)

            // if the titleTextField has text, we will call that text titleText
            if let titleText = titleTextField.text {
                // we will take the titleText and assign that value to toDo.name
                // this .name and .important came from the attributes you typed in on the Core Data page!
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            
        }
            try? context.save()
            navigationController?.popViewController(animated:true)

        //Add the new ToDo to the array and update/reload the Table View:
//        previousVC.toDos.append(toDo)
//        previousVC.tableView.reloadData()
        
        //Only thing left to do now for this part is have it automatically pop back to the Table View when the user taps Add. We just need to call a single function after we update/reload the Table View.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
