//
//  FoodviewModel.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation
import Combine

class FoodViewModel : FoodViewModelProtocol {
    
    weak var vc : FoodPresenter?
    
    var ingredientPublisher = PassthroughSubject<[Ingredient], Never>()
    let apis : [IngredientApiProtocol]
        
    init(apis: [IngredientApiProtocol]){
        self.apis = apis
    }
        
    func getAllIngredients(){
        guard !apis.isEmpty else { return }
   
        apis.forEach {api in
            api.getIngredients(vc: self.vc) {[weak self] ingredients in
                print(ingredients)
                self?.ingredientPublisher.send(ingredients)
            }
        }
    }    
}
