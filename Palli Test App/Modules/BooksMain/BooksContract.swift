//
//  BooksContract.swift
//  BooksContract
//
//  Created by YIM LLC on 06/08/21.
//

import Foundation
import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewBooksProtocol: class {
    func showResults()
    func showError()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterBooksProtocol: class {
    var view: PresenterToViewBooksProtocol? { get set }
    var interactor: PresenterToInteractorBooksProtocol? { get set }
    var router: PresenterToRouterBooksProtocol? { get set }
    
    func viewDidLoad()
    func getBookResultsCount() -> Int?
    func getBookResults(index: Int) -> Item?
    func getBookThumbNails(index: Int, completion: @escaping (UIImage) -> (UIImage))
    func searchTextDidChange(text: String)
    func didSelectRowAt(index: Int)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorBooksProtocol: class {
    var presenter: InteractorToPresenterBooksProtocol? { get set }
    var booksResults: [Item]? { get }
    
    func searchFor(text: String)
    func getBookThumbNails(index: Int, completion: @escaping (UIImage) -> UIImage)
    func retrieveBook(at: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterBooksProtocol: class {
    func booksFetched()
    func booksFetchFailed()
    func getBookSuccess(_ book: Item)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterBooksProtocol: class {
    
    static func createModule() -> UINavigationController
    
    func pushToBookDetail(on view: PresenterToViewBooksProtocol, with book: Item)
}
