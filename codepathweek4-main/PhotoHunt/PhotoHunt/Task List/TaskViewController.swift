//
//  TaskViewController.swift
//  PhotoHunt
//
//  Created by kelechi Nnorom on 3/17/23.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource {
    
    var tasks = [Task]() {
        didSet {
            emptyStateLabel.isHidden = !tasks.isEmpty
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            fatalError("Unable to dequeue Task Cell")
        }

        cell.configure(with: tasks[indexPath.row])

        return cell
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.tableHeaderView = UIView()
        tableView.rowHeight = 60
        tableView.dataSource = self
        tasks = Task.mockedTasks
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // This will reload data in order to reflect any changes made to a task after returning from the detail screen.
        tableView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let detailViewController = segue.destination as? TaskDetailViewController,
                // Get the index path for the current selected table view row.
               let selectedIndexPath = tableView.indexPathForSelectedRow {

                // Get the task associated with the slected index path
                let task = tasks[selectedIndexPath.row]

                // Set the selected task on the detail view controller.

                detailViewController.task = task
            }
        }
    }
    
    

}
