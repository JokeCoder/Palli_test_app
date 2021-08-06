//
//  BookDetailContract.swift
//  BookDetailContract
//
//  Created by YIM LLC on 06/08/21.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewBookDetailProtocol: class {
    
    func showImageAndDescription(image: UIImage, title: String, authors: [String], description: String, categories: [String])
    func showError()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterBookDetailProtocol: class {
    
    var view: PresenterToViewBookDetailProtocol? { get set }
    var interactor: PresenterToInteractorBookDetailProtocol? { get set }
    var router: PresenterToRouterBookDetailProtocol? { get set }

    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorBookDetailProtocol: class {
    
    var presenter: InteractorToPresenterBookDetailProtocol? { get set }
    var book: Item? { get set }

    func getBookImage()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterBookDetailProtocol: class {
    func getImageFromURLSuccess(image: UIImage, title: String, authors: [String], description: String, categories: [String])
    func fetchFailed()
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterBookDetailProtocol: class {
    
    static func createModule(with book: Item) -> UIViewController
}
