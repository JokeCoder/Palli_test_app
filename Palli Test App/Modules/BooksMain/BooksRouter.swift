//
//  BooksRouter.swift
//  BooksRouter
//
//  Created by YIM LLC on 06/08/21.
//

import UIKit

class BooksRouter: PresenterToRouterBooksProtocol {
    
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("BooksRouter creates the Books module.")
        let viewController = BooksViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterBooksProtocol & InteractorToPresenterBooksProtocol = BooksPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = BooksRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = BooksInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    
    // MARK: - Navigation
    func pushToBookDetail(on view: PresenterToViewBooksProtocol, with book: Item) {
        print("QuotesRouter is instructed to push QuoteDetailViewController onto the navigation stack.")
        let bookDetailViewController = BookDetailRouter.createModule(with: book)
            
        let viewController = view as! BooksViewController
        viewController.navigationController?
            .pushViewController(bookDetailViewController, animated: true)
    }
    
    
}
