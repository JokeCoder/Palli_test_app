//
//  BookDetailInteractor.swift
//  BookDetailInteractor
//
//  Created by YIM LLC on 06/08/21.
//

import Foundation
import Alamofire
import AlamofireImage


class BookDetailInteractor: PresenterToInteractorBookDetailProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterBookDetailProtocol?
    
    var book: Item?
    
    
    func getBookImage() {
        print("The book is \(book)")
        guard let url = self.book?.volumeInfo?.imageLinks?.thumbnail else { return }
        print("URL to download image for cell at is \(url)")
        
        AF.request(url, method: .get).responseImage { response in
            
            print("Image Response \(response)")
            
            if let image = response.value, let title = self.book?.volumeInfo?.title, let authors = self.book?.volumeInfo?.authors, let description = self.book?.volumeInfo?.description, let categories = self.book?.volumeInfo?.categories {
                print("image downloaded: \(image)")
                
                self.presenter?.getImageFromURLSuccess(image: image, title: title, authors: authors, description: description, categories: categories)
            } else {
                print("Image is nil")
                self.presenter?.fetchFailed()
            }
        }
        
    }
}
