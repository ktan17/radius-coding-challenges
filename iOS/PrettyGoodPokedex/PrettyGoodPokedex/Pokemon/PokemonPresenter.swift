//
//  PokemonPresenter.swift
//  PrettyGoodPokedex
//
//  Created by Kevin Tan on 8/20/19.
//  Copyright © 2019 Kevin Tan. All rights reserved.
//

protocol PokemonPresenterOutputHandler: class {
    func displayPokemonNames(viewData: PokemonDataModels.PokemonNames.ViewData)
    func displaySprite(viewData: PokemonDataModels.Sprite.ViewData)
}

class PokemonPresenter: PokemonInteractorOutputHandler {
    weak var viewController: PokemonPresenterOutputHandler?

    func presentPokemonNames(response: PokemonDataModels.PokemonNames.ResponseData) {
        let viewData = PokemonDataModels.PokemonNames.ViewData(
            names: response.names
        )
        viewController?.displayPokemonNames(viewData: viewData)
    }
    
    func presentSprite(response: PokemonDataModels.Sprite.ResponseData) {
        let viewData = PokemonDataModels.Sprite.ViewData(
            dataSource: response.dataSource,
            sprite: response.sprite
        )
        viewController?.displaySprite(viewData: viewData)
    }
}
