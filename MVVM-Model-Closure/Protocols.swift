//
//  Protocols.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation
import Combine

protocol IngredientApiProtocol {
    func getIngredients(vc : FoodPresenter? , completion : @escaping (_ ingredients : [Ingredient]) -> Void )
}

protocol FoodViewModelProtocol {
    var vc : FoodPresenter? { get set }
    var ingredientPublisher : PassthroughSubject<[Ingredient], Never> { get set }
    func getAllIngredients()
}

protocol FoodPresenter : AnyObject {
    func solidIngredientAction()
    func liquidIngredientAction()
    func spiceIngredientAction()
}
