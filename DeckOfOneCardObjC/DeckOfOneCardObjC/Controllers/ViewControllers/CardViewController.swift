//
//  CardViewController.swift
//  DeckOfOneCardObjC
//
//  Created by Clarissa Vinciguerra on 9/29/20.
//

import UIKit

class CardViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - Properties
    var card: CEVCard?
    var image: UIImage?
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        fetchCard()
    }
    // MARK: - HelperFunctions
    func updateViews() {
        guard let card = card, let image = image else { return }
        cardLabel.text = "\(card.value) of \(card.suit)"
        cardImageView.image = image
    }
    
    func fetchCard() {
        CEVCardController.drawANewCard { (card) in
            if let card = card {
                CEVCardController.fetchImage(card) { (image) in
                    DispatchQueue.main.async {
                        self.card = card
                        self.image = image
                        self.updateViews()
                    }
                }
            }
        }
    }
}
