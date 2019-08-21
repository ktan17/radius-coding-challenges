//
//  PokemonViewController.swift
//  PrettyGoodPokedex
//
//  Created by Kevin Tan on 8/20/19.
//  Copyright © 2019 Kevin Tan. All rights reserved.
//

import UIKit

protocol PokemonViewControllerOutputHandler {
    func getPokemonNames()
    func getSprite(request: PokemonDataModels.Sprite.RequestData)
}

class PokemonViewController: UIViewController,
                             UICollectionViewDelegateFlowLayout,
                             UICollectionViewDataSource,
                             UICollectionViewDelegate,
                             PokemonPresenterOutputHandler {
    var interactor: PokemonViewControllerOutputHandler?
    var router: PokemonRouteHandler?
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 22,
                                             left: 22,
                                             bottom: 22,
                                             right: 22)
    
    // Array that will contain the names of all the Pokemon
    private var collectionViewData = [String]()
    
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Initialization
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        let viewController = self
        let interactor = PokemonInteractor()
        let presenter = PokemonPresenter()
        let router = PokemonRouter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        viewController.router = router
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure subviews
        collectionView.backgroundColor = .white
        collectionView.register(PokemonCollectionViewCell.self,
                                forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        
        interactor?.getPokemonNames()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        collectionView.frame = view.bounds
    }
    
    // MARK: - VIP Cycles
    
    func displayPokemonNames(viewData: PokemonDataModels.PokemonNames.ViewData) {
        collectionViewData = viewData.names
        collectionView.reloadData()
    }
    
    func displaySprite(viewData: PokemonDataModels.Sprite.ViewData) {
        viewData.dataSource.setImage(to: viewData.sprite)
    }
    
    // MARK: - UICollectionViewDataSource/UICollectionViewDelegate Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell
        else { fatalError() }
        
        let name = collectionViewData[indexPath.item]
        cell.setName(to: name)
        
        let request = PokemonDataModels.Sprite.RequestData(
            dataSource: cell,
            index: indexPath.item
        )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print("\(collectionViewData[indexPath.item]) was tapped!")
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = view.frame.width - sectionInsets.left * (itemsPerRow + 1)
        let width = totalWidth / itemsPerRow
        
        return CGSize(width: width,
                      height: PokemonCollectionViewCell.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
