//
//  SolidApi.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation

class SolidApi : IngredientsApiProtocol {
    
    weak var vc : SolidIngredientProtocol?
    
    func getIngredients(completion : @escaping (_ ingredients : [Ingredient]) -> Void ){
        
        let closure = { [weak vc] in
            guard let vc = vc else { return }
            vc.solidIngredientAction()
        }
        
        let ingredients : [Ingredient] = [
            Ingredient(name: "Cheese", type: "Solid", selection: closure),
            Ingredient(name: "Carrot", type: "Solid", selection: closure)
        ]
        
        DispatchQueue
            .global(qos: .userInteractive)
            .asyncAfter(deadline: .now() + 0.4) {
                completion(ingredients)
        }
    }
}
