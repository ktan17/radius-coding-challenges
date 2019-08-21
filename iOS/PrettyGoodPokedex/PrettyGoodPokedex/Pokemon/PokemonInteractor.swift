//
//  PokemonInteractor.swift
//  PrettyGoodPokedex
//
//  Created by Kevin Tan on 8/20/19.
//  Copyright © 2019 Kevin Tan. All rights reserved.
//

import Alamofire

protocol PokemonInteractorOutputHandler {
    func presentPokemonNames(response: PokemonDataModels.PokemonNames.ResponseData)
    func presentSprite(response: PokemonDataModels.Sprite.ResponseData)
}

protocol PokemonDataStore {
    
}

class PokemonInteractor: PokemonViewControllerOutputHandler, PokemonDataStore {
    var presenter: PokemonInteractorOutputHandler?

    func getPokemonNames() {
        Alamofire
            .request("https://pokeapi.co/api/v2/pokemon/?limit=151",
                     method: .get,
                     parameters: nil,
                     encoding: JSONEncoding.default,
                     headers: nil)
            .responseJSON { [weak self] (response) in
            guard
                response.result.isSuccess,
                let data = response.result.value as? [String : Any],
                let results = data["results"] as? [[String : Any]]
            else {
                // No error handling, but don't worry about that :)
                return
            }
                
            let pokemonNames = results.compactMap { $0["name"] as? String }
                
            let response = PokemonDataModels.PokemonNames.ResponseData(
                names: pokemonNames
            )
            self?.presenter?.presentPokemonNames(response: response)
        }
    }
    
    func getSprite(request: PokemonDataModels.Sprite.RequestData) {
        let id = request.index + 1
        let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
        
        Alamofire
            .request(url,
                     method: .get,
                     parameters: nil,
                     encoding: JSONEncoding.default,
                     headers: nil)
            .response { (response) in
            guard let data = response.data else {
                // No error handling, but don't worry about that :)
                return
            }
            
            let sprite = UIImage(data: data)
            
        }
    }
}
