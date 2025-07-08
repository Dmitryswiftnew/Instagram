//
//  FeedViewController.swift
//  Instagram
//
//  Created by Dmitry on 27.06.25.
//

import UIKit
import SnapKit



class FeedViewController: UIViewController {
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        initialize()
    }
    
    // MARK: - Private properties
    
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "cat2")!, username: "user123", isAddButtonVisiable: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "cat2")!, username: "user123", isAddButtonVisiable: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "cat2")!, username: "user123", isAddButtonVisiable: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "cat2")!, username: "user123", isAddButtonVisiable: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "cat2")!, username: "user123", isAddButtonVisiable: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "cat2")!, username: "user123", isAddButtonVisiable: false, isNewStory: false)
        ]),
        .post(FeedPostItemInfo(userImage: UIImage(named: "cat2")!, userName: "Some_catsvill", postSubtitle: "Sponsored", postImage: UIImage(named: "cat2")!, numbersOfLikes: 123, comment: CommentShortInfo(username: "Another_name", commentText: "Hello World"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "cat2")!, userName: "Some_catsvill", postSubtitle: "Sponsored", postImage: UIImage(named: "cat2")!, numbersOfLikes: 123, comment: CommentShortInfo(username: "Another_name", commentText: "Hello World"))),
        .post(FeedPostItemInfo(userImage: UIImage(named: "cat2")!, userName: "Some_catsvill", postSubtitle: "Sponsored", postImage: UIImage(named: "cat2")!, numbersOfLikes: 123, comment: CommentShortInfo(username: "Another_name", commentText: "Hello World")))
    ]
    
    
}

// MARK: - Private methods

private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtomItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
    }
    
    func makeLeftBarButtomItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    

    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarButtonItem, addBarButtonItem]
    }
    
    @objc func didTapPlusButton() {
        print("Add")
    }
    
    @objc func didTapDirectButton() {
        print("Direct")
        
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Favorites")
        }
        
        return UIMenu(title: "", children: [subsItem, favsItem]) // проверить tittle
    }
    
}


// MARK: - UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
            
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
    
    
}
