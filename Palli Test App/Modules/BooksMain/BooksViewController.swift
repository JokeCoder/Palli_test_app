//
//  BooksViewController.swift
//  BooksViewController
//
//  Created by YIM LLC on 06/08/21.
//

import Foundation
import UIKit

class BooksViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterBooksProtocol?
    private let searchController = UISearchController(searchResultsController: nil)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "BooksTableViewCell", bundle: nil), forCellReuseIdentifier: "BooksTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSearchBar()
    }
    
    // MARK: - Actions
    
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search books"
        searchController.obscuresBackgroundDuringPresentation = false;
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
}

// MARK: - UITableView Delegate & Data Source
extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getBookResultsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BooksTableViewCell", for: indexPath) as? BooksTableViewCell else { return UITableViewCell() }
        
        let row = indexPath.row
        let books = presenter?.getBookResults(index: row)
        
        _ = presenter?.getBookThumbNails(index: row, completion: { image in
            print("Image in the closure is \(image)")
            cell.thumbNail.image = image
            return image
        })
        
        
        
        guard let title = books?.volumeInfo?.title, let publisher = books?.volumeInfo?.publisher else {
            return cell
        }
        cell.configure(bookTitle: title, bookPublisher: publisher)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
    }
}


extension BooksViewController: PresenterToViewBooksProtocol {
    func showResults() {
        tableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem occured while fetching the books", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
}

//MARK: - Search bar delegate
extension BooksViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchTextDidChange(text: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.removeAll()
    }
    
    
}


// MARK: - UI Setup
extension BooksViewController {
    func setupUI() {
        overrideUserInterfaceStyle = .light
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true

        self.navigationItem.title = "Search your book here"
    }
}
