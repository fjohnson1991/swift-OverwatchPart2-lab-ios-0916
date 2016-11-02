//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by Felicity Johnson on 10/21/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heroScrollView: UIScrollView!

    
    var game = Game()
    var heroType: HeroType! {
        didSet {
            
            game.heroType = heroType
            updateStackViewWithHeroes()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.heroScrollView.delegate = self
        
    }
    
    
    func updateStackViewWithHeroes() {
        
        let heroArray = game.heroesForType()
        for hero in heroArray {
            if hero.heroType == game.heroType {
                characterStackView.addArrangedSubview(UIImageView(image: hero.image))
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        heroType = .offense
        characterStackViewWidthConstraint.constant = 1863.33333333333

    }
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        characterStackViewWidthConstraint.constant = 0
        switch sender.selectedSegmentIndex {
        case 0:
            heroType = .offense
        case 1:
            heroType = .defense
        case 2:
            heroType = .tank
        case 3:
            heroType = .support
            
        default:
            break
        }

        
        for view in characterStackView.arrangedSubviews {
            characterStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        updateStackViewWithHeroes()
        cellConfig()
    }
    
    func cellConfig() {
        let stackViewWidth = containerView.bounds.width
        let widthCount = CGFloat(game.heroesForType().count - 1)
        characterStackViewWidthConstraint.constant = (stackViewWidth * widthCount)
    }

}
