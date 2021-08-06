//
//  BooksInteractor.swift
//  BooksInteractor
//
//  Created by YIM LLC on 06/08/21.
//

import Foundation
import Alamofire
import AlamofireImage

class BooksInteractor: PresenterToInteractorBooksProtocol {
    
    // MARK: - Properties
    weak var presenter: InteractorToPresenterBooksProtocol?
    var booksResults: [Item]?
    
    
    // MARK: - Methods
    func searchFor(text: String) {
        let parameters: Parameters = [
            "q": text
        ]
        AF.request(APIManager.shared.baseURL,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding(destination: .queryString))
            .response { response in
                
                if (response.response?.statusCode == 200) {
                    guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        let newsResponse = try decoder.decode(Books.self, from: data)
                        guard let books = newsResponse.items else { return }
                        self.booksResults = books
                        
                        
                        //I almost cried here, cuz i was getting 10 items when total items were more than 450, LOL
                        print("Total items: \(newsResponse.totalItems ?? 0)")
                        print(self.booksResults?.count ?? 0)
                        self.presenter?.booksFetched()
                    } catch let error {
                        print(error)
                    }
                }
                else {
                    self.presenter?.booksFetchFailed()
                }
            }
    }
    
    func retrieveBook(at index: Int) {
        guard let books = self.booksResults, books.indices.contains(index) else {
            self.presenter?.booksFetchFailed()
            return
        }
        
        print("The retrieved book is \(books[index])")
        self.presenter?.getBookSuccess(self.booksResults![index])
    }
    
    func getBookThumbNails(index: Int, completion: @escaping (UIImage) -> UIImage) {
        
        guard let url = self.booksResults?[index].volumeInfo?.imageLinks?.smallThumbnail else { return }
        print("URL to download image for cell at \(index) is \(url)")
//        print("Books results is: \(self.booksResults)")
        
        //try another version
        AF.request(url, method: .get).responseImage { response in
            
            print("Image Response \(response)")
            
            if let image = response.value {
                print("image downloaded: \(image)")
                completion(image)
            } else {
                self.presenter?.booksFetchFailed()
                print("Image is nil")
        }
        
        
        
//        Alamofire.request(url, method: .get)
//            .responseData { responseData in
//
//                switch responseData.result {
//                case .success(let responseData):
//                    print("Response Data is \(responseData)")
//                    //the loop is here...
//                    ///it is not here
//                    //self.smallThumbNailImage?[index] = UIImage(data: responseData, scale:1)!
//                    self.presenter?.liveNewsFetched()
//                case .failure(let error):
//                    print("error--->",error)
//                }
//            print("Response data is \(responseData)")
//
//            guard let imageData = responseData.data else {
//                return
//            }
//            print("Image data \(imageData)")
//
//            guard let image = UIImage(data: imageData) else {
//                return
//            }
//
//            print("Image \(image)")
//            self.smallThumbNailImage?[index] = image
//        }
        }
    }
}


//class KingfisherService {
//
//    static let shared = { KingfisherService() }()
//
//    func loadImageFrom(urlString: String,
//                       success: @escaping (Data) -> (),
//                       failure: @escaping (KingfisherError) -> ()) {
//
//
//
//        guard let url = URL(string: urlString) else {
//            return
//        }
//
//        ImageDownloader.default.downloadImage(with: url, options: nil, progressBlock: nil) { result in
//            switch result {
//            case .success(let value):
//                print("Data: \(value.originalData)")
//                success(value.originalData)
//            case .failure(let error):
//                print("Error: \(error)")
//                failure(error)
//            }
//        }
//
//    }
//}

