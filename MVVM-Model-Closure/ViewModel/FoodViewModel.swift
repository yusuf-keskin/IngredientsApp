//
//  FoodviewModel.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation
import Combine

class FoodViewModel : FoodViewModelProtocol {
    
    var ingredientPublisher = PassthroughSubject<[Ingredient], Never>()
    var apis = [IngredientsApiProtocol]()
    
    func getApiData(){
        apis.forEach { api in
            api.getIngredients { [weak self] ingredients in
                self?.ingredientPublisher.send(ingredients)
            }
        }
    }
}

