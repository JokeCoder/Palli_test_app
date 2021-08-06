//
//  BooksDetailRouter.swift
//  BooksDetailRouter
//
//  Created by YIM LLC on 06/08/21.
//

import UIKit


class BookDetailRouter: PresenterToRouterBookDetailProtocol {
    
    // MARK: Static methods
    static func createModule(with book: Item) -> UIViewController {
        print("QuoteDetailRouter creates the QuoteDetail module.")
        let viewController = BookDetailViewController()
        
        let presenter: ViewToPresenterBookDetailProtocol & InteractorToPresenterBookDetailProtocol = BookDetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = BookDetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = BookDetailInteractor()
        viewController.presenter?.interactor?.book = book
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
