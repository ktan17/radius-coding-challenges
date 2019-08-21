//
//  PokemonRouter.swift
//  PrettyGoodPokedex
//
//  Created by Kevin Tan on 8/20/19.
//  Copyright © 2019 Kevin Tan. All rights reserved.
//

// The Router is (currently) unused for this scene, no need to do anything here.

protocol PokemonRouteHandler: class {
    var dataStore: PokemonDataStore? { get set }
}

class PokemonRouter: PokemonRouteHandler {
    weak var viewController: PokemonViewController?
    var dataStore: PokemonDataStore?
    
}
