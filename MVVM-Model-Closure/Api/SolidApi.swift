//
//  SolidApi.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation
import Combine

class SolidApi : IngredientApiProtocol {
    
    func getIngredients(vc : FoodPresenter?, completion : @escaping (_ ingredients : [Ingredient]) -> Void ){
        
        let closure = {
            guard let vc = vc else { return }
            vc.solidIngredientAction()
        }
        
        let ingredients : [Ingredient] = [
            Ingredient(name: "Cheese", type: "Solid", selection: closure),
            Ingredient(name: "Carrot", type: "Solid", selection: closure)
        ]
        
        DispatchQueue
            .global(qos: .userInteractive)
            .asyncAfter(deadline:.now() + 0.2) { 
                completion(ingredients)
        }
    }
}
