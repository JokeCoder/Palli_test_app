//
//  BooksPresenter.swift
//  BooksPresenter
//
//  Created by YIM LLC on 06/08/21.
//

import UIKit

class BooksPresenter: ViewToPresenterBooksProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewBooksProtocol?
    var interactor: PresenterToInteractorBooksProtocol?
    var router: PresenterToRouterBooksProtocol?
    
    
    // MARK: Inputs from view
    func viewDidLoad() {
        //we could do some setup for a smooth user experience here
        
    }
    
    func getBookResultsCount() -> Int? {
        return interactor?.booksResults?.count
    }
    
    func getBookResults(index: Int) -> Item? {
        return interactor?.booksResults?[index]
    }
    
    func getBookThumbNails(index: Int, completion: @escaping (UIImage) -> (UIImage)) {
        interactor?.getBookThumbNails(index: index, completion: completion)
    }
    
    func searchTextDidChange(text: String) {
        interactor?.searchFor(text: text)
    }
    
    func didSelectRowAt(index: Int) {
        interactor?.retrieveBook(at: index)
    }
    
}


// MARK: - Outputs to view
extension BooksPresenter: InteractorToPresenterBooksProtocol {
    func booksFetched() {
        view?.showResults()
    }
    
    func booksFetchFailed() {
        view?.showError()
    }
    
    func getBookSuccess(_ book: Item) {
        router?.pushToBookDetail(on: view!, with: book)
    }
    
}
