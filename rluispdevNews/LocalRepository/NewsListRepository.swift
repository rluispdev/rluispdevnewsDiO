//
//  NewsListRepository.swift
//  rluispdevNews
//
//  Created by Rafael Gonzaga on 4/28/25.
//

import Foundation

enum NewsListError: Error {
    case fileNotFound
}

class NewsListRepository {
    static var shared: NewsListRepository = {
        let instance = NewsListRepository()
        return instance
    }()
    
    private init() {}
    
    func getNewsList(completion: ([NewsModel]?, Error?) -> Void){
        if let path = Bundle.main.path(forResource: "NewList", ofType: "json"){
            do {
                let url = URL(fileURLWithPath: path)
               let data =  try Data(contentsOf: url, options: .mappedIfSafe)
                
                let decoder = JSONDecoder()
                let newsModelList = try decoder.decode([NewsModel].self, from: data)
                completion(newsModelList, nil)
            } catch{
                completion(nil, error)
            }
            }else{
                completion(nil, NewsListError.fileNotFound)
            }
        }
    }

