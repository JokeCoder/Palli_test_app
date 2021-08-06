//
//  BookDetailViewController.swift
//  BookDetailViewController
//
//  Created by YIM LLC on 06/08/21.
//

import UIKit


class BookDetailViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        
        presenter?.viewDidLoad()
    }
    

    // MARK: - Properties
    var presenter: ViewToPresenterBookDetailProtocol?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let scrollViewContainer: UIStackView = {
        let view = UIStackView()

        view.axis = .vertical
        view.spacing = 10

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
   
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    var authorsLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
    var descriptionLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    var categoriesLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
}

extension BookDetailViewController: PresenterToViewBookDetailProtocol {
    
    func showImageAndDescription(image: UIImage, title: String, authors: [String], description: String, categories: [String]) {
        print("View receives the response from Presenter and updates itself.")
        imageView.image = image
        titleLabel.text = "The title:   " + title
        authorsLabel.text = "Authors:   " + authors.joined(separator: ",")
        descriptionLabel.text = "Description:   " + description
        categoriesLabel.text = "Categories:   " + categories.joined(separator: ",")
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Couldn't load the book...", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - UI Setup
extension BookDetailViewController {
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(imageView)
        scrollViewContainer.addArrangedSubview(titleLabel)
        scrollViewContainer.addArrangedSubview(authorsLabel)
        scrollViewContainer.addArrangedSubview(descriptionLabel)
        scrollViewContainer.addArrangedSubview(categoriesLabel)
        
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
}
