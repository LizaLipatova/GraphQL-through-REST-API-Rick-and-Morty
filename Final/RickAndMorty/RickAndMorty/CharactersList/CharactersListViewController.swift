//
//  CharactersListViewController.swift
//  RickAndMorty
//
//  Created by Yelyzaveta Lipatova on 03.08.2023.
//

import UIKit
import Combine

class CharactersListViewController: UIViewController {
    
    private enum Config {
        static let rowHeight: CGFloat = 130
        static let layoutMargins: NSDirectionalEdgeInsets = .init(top: 20, leading: 20, bottom: 30, trailing: 20)
    }
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()
        
    var viewModel: CharactersListViewModel?
    private var subjectCancellables: [AnyCancellable] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTitle()
        setupAutoLayout()
        
        viewModel?.charactersListLoadedSubject.sink(receiveValue: { [weak self] in
            self?.tableView.reloadData()
        })
        .store(in: &subjectCancellables)
    }
    
    private func setupAutoLayout() {
        view.directionalLayoutMargins = Config.layoutMargins
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func setupTitle() {
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Rick & Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension CharactersListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return Config.rowHeight }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { viewModel?.characters.count ?? 0 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        cell.character = viewModel?.characters[indexPath.row]
        
        return cell
    }
}
