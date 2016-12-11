//
//  ListPersonVC.swift
//  TestMVVM-Parttern
//
//  Created by sok channy on 12/11/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import UIKit

class ListPersonVC: UIViewController {
    
    var model:ListPersonViewModel!
    
    @IBOutlet weak var personTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model =  ListPersonViewModel(PersonContext.shared)
        
        personTableView.delegate = self
        personTableView.dataSource = self
    }
    
    func refresh() {
        model.refresh()
        personTableView.reloadData()
        print(model.items.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refresh()
    }

}

extension ListPersonVC:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCellID", for: indexPath)
        let item = model.items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle

        return cell
    }
}


