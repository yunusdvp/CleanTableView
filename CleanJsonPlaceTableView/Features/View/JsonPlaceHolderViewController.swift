//
//  JsonPlaceHolderViewController.swift
//  CleanJsonPlaceTableView
//
//  Created by Yunus Emre ÖZŞAHİN on 14.05.2024.
//

import UIKit

class JsonPlaceHolderViewController: UIViewController
{
    @IBOutlet weak var tableViewJsonPlaceHolder: UITableView!

    private let jsonTableView: JsonTableView = JsonTableView()
    private let jsonService: JsonPlaceHolderProtocol = JsonPlaceHolderService()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewJsonPlaceHolder.dataSource = jsonTableView
        tableViewJsonPlaceHolder.delegate = jsonTableView
        jsonTableView.delegate = self
        initService()

    }
    func initService() {
        jsonService.fetchAllPosts { [weak self] (models) in
            self?.jsonTableView.update(items: models)
            self?.tableViewJsonPlaceHolder.reloadData()

        } onFail: { (data) in
            print(data ?? "")
        }
    }


}

extension JsonPlaceHolderViewController: JsonTableViewOutput {
    func onSelected(item: PostModel) {
        print(item.body ?? "")
    }


}
