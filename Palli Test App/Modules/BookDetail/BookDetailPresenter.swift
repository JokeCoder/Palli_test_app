//
//  BookDetailPresenter.swift
//  BookDetailPresenter
//
//  Created by YIM LLC on 06/08/21.
//

import UIKit

import Foundation

class BookDetailPresenter: ViewToPresenterBookDetailProtocol {

    // MARK: Properties
    weak var view: PresenterToViewBookDetailProtocol?
    var interactor: PresenterToInteractorBookDetailProtocol?
    var router: PresenterToRouterBookDetailProtocol?
    
    func viewDidLoad() {
        print("Presenter is being notified that the View was loaded.")
        interactor?.getBookImage()
    }
    
}

extension BookDetailPresenter: InteractorToPresenterBookDetailProtocol {
    
    func getImageFromURLSuccess(image: UIImage, title: String, authors: [String], description: String, categories: [String]) {
        print("The image is \(image)")
        view?.showImageAndDescription(image: image, title: title, authors: authors, description: description, categories: categories)
    }
    
    func fetchFailed() {
        view?.showError()
    }
}
