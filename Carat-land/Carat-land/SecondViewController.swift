//
//  SecondViewController.swift
//  Carat-land
//
//  Created by Балжан Бозбашава on 06.11.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var reliseLabel: UILabel!
    @IBOutlet private weak var descc: UILabel!
    
    //Include a back buOon to return to the main list.
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var buttonPressed: UIButton!
    private var inputModel: Cartoon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coverImage.image = inputModel?.image
        titleLabel.text = inputModel?.title
        reliseLabel.text = inputModel?.relisedate
        descc.text = inputModel?.desc
        // Do any additional setup after loading the view.
    }
    
    func configure(with model: Cartoon?) {
        self.inputModel = model
    }
    
}
