//
//  CompleteToDoViewController.swift
//  ToDoList v2
//
//  Created by Qunfeng Dong on 6/23/20.
//  Copyright © 2020 Amy Dong. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    //We should now be able to make the segue, but our ToDo doesn’t show up. Let's fix that!
    //First, we need to add two properties on our CompleteToDoViewController class so that we can reference the (previous) ToDoTableViewController.
    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCD?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //In CompleteToDoViewController.swift, we need to add some code to our viewDidLoad function to grab the name of the ToDo and assign it to the text of our titleLabel
        titleLabel.text = selectedToDo?.name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        //Let’s now add some code to our completeTapped function that will delete a selected ToDo from Core Data (remember… we first need to write that same line of code that will allow us to access Core Data) and pop us back to the ToDo List.
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
          if let theToDo = selectedToDo {
            context.delete(theToDo)
            navigationController?.popViewController(animated: true)
          }
        }
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
