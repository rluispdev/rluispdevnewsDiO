//
//  ViewController.swift
//  rluispdevNews
//
//  Created by Rafael Gonzaga on 4/24/25.
//

import UIKit

class NewsListViewController: UIViewController{
    
    
    @IBOutlet weak var newsListTableView: UITableView!
    
    private var newsList: [NewsModel]? {
        didSet {
            self.newsListTableView.reloadData()
        }
    }
    
    var localDataProvider: NewsListLocalDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.initLocalDataProvider()
    }
    
    private func setupTableView(){
        self.newsListTableView.delegate = self
        self.newsListTableView.dataSource = self
        
    }
    
    
    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewsList()
    }
    
  
}
    

extension NewsListViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row: \(indexPath.row)")
    }
}

extension NewsListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return  UITableViewCell()
    }
}

extension NewsListViewController : NewsListLocalDataProviderProtocol {
    func success(model: Any) {
        self.newsList = model as? [NewsModel]
        
    }
    
    func errorData(_ provide: (any GenericDataProvider)?, error: any Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    
}
