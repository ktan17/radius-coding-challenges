//
//  PokemonDataModels.swift
//  PrettyGoodPokedex
//
//  Created by Kevin Tan on 8/20/19.
//  Copyright © 2019 Kevin Tan. All rights reserved.
//

import UIKit

enum PokemonDataModels {

    enum PokemonNames {
        
        // No RequestData
        
        struct ResponseData {
            let names: [String]
        }
        
        struct ViewData {
            let names: [String]
        }
        
    }
    
    enum Sprite {
        
        struct RequestData {
            let dataSource: PokemonCollectionViewDataSource
            let index: Int
        }
        
        struct ResponseData {
            let dataSource: PokemonCollectionViewDataSource
            let sprite: UIImage?
        }
        
        struct ViewData {
            let dataSource: PokemonCollectionViewDataSource
            let sprite: UIImage?
        }
        
    }
    
}
