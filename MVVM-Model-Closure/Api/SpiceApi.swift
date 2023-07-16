//
//  SpiceApi.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation

class SpiceApi : IngredientApiProtocol {
    
    func getIngredients(vc : FoodPresenter? , completion : @escaping (_ ingredients : [Ingredient]) -> Void ){
        
        let closure = {
            guard let vc = vc else { return }
            vc.spiceIngredientAction()
        }
        
        let ingredients : [Ingredient] = [
            Ingredient(name: "Pepper", type: "Spice", selection: closure),
            Ingredient(name: "Salt", type: "Spice", selection: closure)
        ]
        
        DispatchQueue
            .global(qos: .userInteractive)
            .asyncAfter(deadline: .now() + 0.4) {
                completion(ingredients)
        }
    }
}
