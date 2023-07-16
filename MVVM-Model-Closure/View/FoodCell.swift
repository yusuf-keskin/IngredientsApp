//
//  Cell.swift
//  MVVM-Model-Closure
//
//  Created by YUSUF KESKİN on 2.07.2023.
//

import UIKit

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(ingredient : Ingredient) {
        title.text = ingredient.name
        subtitle.text = ingredient.type
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = ""
        subtitle.text = ""
    }

}
