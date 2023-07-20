//
//  ViewController.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import UIKit
import Combine

class FoodVC: UIViewController {
    
    var model : FoodViewModelProtocol?
    var ingredients = [Ingredient]()
    var cancellables = [AnyCancellable]()

    @IBOutlet weak var foodTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadIngredients()
        model?.getApiData()
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.backgroundColor = .white
    }
    
    private func downloadIngredients() {
        model?.ingredientPublisher
            .receive(on: DispatchQueue.main)
            .sink { _ in

            } receiveValue: { [weak self] value in
                self?.ingredients.append(contentsOf: value)
                DispatchQueue.main.async {
                    self?.foodTableView.reloadData()
                }
            }.store(in: &cancellables)
    }

    func createAlert(title: String, message: String, backgroundColor : UIColor) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        alert.view.tintColor = backgroundColor
        show(alert, sender: nil)
    }
    
    func setBackground(imageName: String) {
        foodTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        view.backgroundColor = UIColor(patternImage: UIImage(named: imageName)!)
    }
}

extension FoodVC : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTableView.dequeueReusableCell(withIdentifier: "FoodCell") as! FoodCell
        let ingredient = ingredients[indexPath.row]
        cell.setupCell(ingredient: ingredient)
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.466481493)
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.370023554, green: 0.370023554, blue: 0.370023554, alpha: 0.466481493)
        cell.selectedBackgroundView = bgColorView
        return cell
    }
}

extension FoodVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = ingredients[indexPath.row]
        guard let selection = cellData.selection else { return }
        selection()
    }
}

extension FoodVC : SolidIngredientProtocol {
    func solidIngredientAction() {
        setBackground(imageName: "solid.jpg")
        createAlert(title: "This is a SOLID ingredient!", message: "You may need a bowl", backgroundColor: UIColor.blue)
    }
}

extension FoodVC : LiquidIngredientProtocol {
    func liquidIngredientAction() {
        setBackground(imageName: "liquid.jpg")
        createAlert(title: "Liquid Ingredient!", message: "Get a glass to measure it", backgroundColor: UIColor.blue)
    }
}

extension FoodVC : SpiceIngredientProtocol {
    func spiceIngredientAction() {
        setBackground(imageName: "spice.jpg")
        createAlert(title: "This is a spice", message: "Don't overuse it", backgroundColor: UIColor.blue)
    }
}



