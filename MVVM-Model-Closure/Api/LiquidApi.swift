//
//  LiquidApi.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation

class LiquidApi : IngredientsApiProtocol{
    
    weak var vc : LiquidIngredientProtocol?
    
    func getIngredients(completion : @escaping (_ ingredients : [Ingredient]) -> Void ){
        
        let closure = {[weak vc] in
            guard let vc = vc else { return }
            vc.liquidIngredientAction()
        }
        
        let ingredients : [Ingredient] = [
            Ingredient(name: "Milk", type: "Liquid" , selection: closure),
            Ingredient(name: "Vegetable Oil", type: "Liquid", selection: closure),
            Ingredient(name: "Water", type: "Liquid", selection: closure),
        ]
        
        DispatchQueue
            .global(qos: .userInteractive)
            .asyncAfter(deadline: .now() + 0.8) {
                completion(ingredients)
            }
    }
}
