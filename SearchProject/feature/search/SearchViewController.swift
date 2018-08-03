//
//  ViewController.swift
//  SearchProject
//
//  Created by Satrio Wicaksono on 01/08/2018.
//  Copyright © 2018 Satrio Wicaksono. All rights reserved.
//

import UIKit
import Kingfisher

class SearchViewController: BaseViewController<SearchPresenter>, SearchDelegate,
UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var cvItem: UICollectionView!
    var refresher = UIRefreshControl()
    var listItem = Array<ItemModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        initParams()
        cvItem.refreshControl = initRefresher()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestSearch(params: Params.instance())
    }
    
    func didSuccessSearch(items: [ItemModel]) {
        listItem.append(contentsOf: items)
        cvItem.reloadData()
        if refresher.isRefreshing {
            refresher.endRefreshing()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = listItem[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemViewCell", for: indexPath) as! ItemViewCell
        setItemList(cell: cell, item: item)
        loadMore(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2, height: 220)
    }
    
    func taskDidBegin() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func taskDidFinish() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func taskDidError(message: String) {
        showError(title: "Error", message: message)
    }
    
    private func initPresenter(){
        presenter = SearchPresenter(view: self)
    }
    
    private func initParams() {
        Params.instance().q = "Samsung"
        Params.instance().pMin = ConstantUtil.MIN_VALUE_DEFAULT.description
        Params.instance().pMax = ConstantUtil.MAX_VALUE_DEFAULT.description
        Params.instance().wholesale = true
        Params.instance().official = true
        Params.instance().fshop = "2"
        Params.instance().start = "0"
        Params.instance().rows = "10"
    }
    
    private func initRefresher() -> UIRefreshControl{
        refresher.addTarget(self, action: #selector(didRefresh), for: .valueChanged)
        return refresher
    }
    
    @objc func didRefresh() {
        listItem.removeAll()
        cvItem.reloadData()
        Params.instance().start = 0.description
        presenter.search(params: Params.instance())
    }
    
    private func requestSearch(params: Params) {
        presenter.search(params: params)
    }
    
    private func loadMore(indexPath: IndexPath){
        if indexPath.row == listItem.count - 1 {
            Params.instance().start = listItem.count.description
            presenter.search(params: Params.instance())
        }
    }
    
    private func setItemList(cell: ItemViewCell, item: ItemModel) {
        cell.ivItem.kf.setImage(with: URL(string: item.imageUri))
        cell.lblPrice.text = item.price
        cell.lblTitle.text = item.name
    }
    
    @IBAction func onFilterClicked(_ sender: Any) {
        let viewController = getViewController(storyboardName: "Main", identifier: "NavigationFilterStoryboard")
        navigationController?.present(viewController, animated: true, completion: nil)
    }
}

