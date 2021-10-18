//
//  HistoryViewController.swift
//  Evaluation Test iOS
//
//  Created by Филяев Илья on 16.10.2021.
//

import UIKit


class HistoryViewController: UIViewController {

    
    @IBOutlet weak var hTableView: UITableView!

    var timer = Timer()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        hTableView.delegate = self
        hTableView.dataSource = self
        viewWillAppear(true)
    }
    
    // MARK: - Updating values

    override func viewWillAppear(_ animated: Bool) {
        hTableView.reloadData()
    }
}







