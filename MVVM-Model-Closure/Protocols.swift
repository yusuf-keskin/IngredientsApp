//
//  Protocols.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation
import Combine

protocol FoodViewModelProtocol {
    var ingredientPublisher : PassthroughSubject<[Ingredient], Never> {get set}
    var apis : [IngredientsApiProtocol] {get set}
    func getApiData()
}

protocol IngredientsApiProtocol {
    func getIngredients(completion : @escaping (_ ingredients : [Ingredient]) -> Void )
}

protocol SolidIngredientProtocol: AnyObject {
    func solidIngredientAction()
}

protocol LiquidIngredientProtocol: AnyObject {
    func liquidIngredientAction()
}

protocol SpiceIngredientProtocol: AnyObject {
    func spiceIngredientAction()
}

protocol SauceIngredientProtocol : AnyObject {
    func sauceIngredientAction()
}

