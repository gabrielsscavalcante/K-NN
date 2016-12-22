//
//  IrisTableViewCell.swift
//  KNN
//
//  Created by Gabriel Cavalcante on 21/12/16.
//  Copyright © 2016 Gabriel Cavalcante. All rights reserved.
//

import UIKit

class IrisTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIris: UIImageView!
    @IBOutlet weak var sepalLength: UILabel!
    @IBOutlet weak var sepalWidth: UILabel!
    @IBOutlet weak var petalLength: UILabel!
    @IBOutlet weak var petalWidth: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initIris(iris: Iris) {
        imageIris.layer.cornerRadius = 5
        imageIris.clipsToBounds = true
        
        imageIris.image = UIImage(named: iris.type)
        id.text = "ID: \(iris.id)"
        type.text = "Type: \(iris.type)"
        sepalLength.text = "\(iris.sepalLength)"
        sepalWidth.text = "\(iris.sepalWidth)"
        petalWidth.text = "\(iris.petalWidth)"
        petalLength.text = "\(iris.petalLength)"
    }

}
