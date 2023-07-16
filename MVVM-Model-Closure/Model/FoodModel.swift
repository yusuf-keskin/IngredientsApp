//
//  FoodModel.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import Foundation
import UIKit

struct Ingredient {
    var name : String
    var type : String
    var selection : (() -> Void)?
}





