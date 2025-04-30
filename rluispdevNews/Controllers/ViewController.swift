//
//  ViewController.swift
//  rluispdevNews
//
//  Created by Rafael Gonzaga on 4/24/25.
//

import UIKit

class ViewController: UIViewController, NewsListLocalDataProviderProtocol {
  
    
    var localDataProvider: NewsListLocalDataProvider?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLocalDataProvider()
    }
    
    private func initLocalDataProvider() {
        self.localDataProvider = NewsListLocalDataProvider()
        self.localDataProvider?.delegate = self
        self.localDataProvider?.getNewsList()
    }

    func success(model: Any) {
        print("Model: \(model)")
    }
    
    func errorData(_ provide: (any GenericDataProvider)?, error: any Error) {
        print("Error: \(error.localizedDescription)")
    }
}

