//
//  ViewController.swift
//  SuperHero
//
//  Created by Балжан Бозбашава on 20.11.2024.
//

import UIKit

struct Hero: Decodable {
    
    let name: String
    let biography: Biography
    let powerstats: PowerStats
    let appearance: Appearance
    let work: Work
    let images: HeroImage

    struct Biography: Decodable {
        let fullName: String
        let placeOfBirth: String
        let publisher: String
    }

    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let power: Int
    }

    struct Appearance: Decodable {
        let gender: String
    }

    struct Work: Decodable {
        let occupation: String
    }

    struct HeroImage: Decodable {
        let sm: String
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroFullName: UILabel!
    @IBOutlet weak var IntelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func RollHeroButton(_ sender: UIButton) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }
    
    private func fetchHero(by id: Int) {

        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error fetching hero data: \(error.localizedDescription)")
                return
            }
        
            guard let data = data else {
                print("No data received")
                return
            }
            self.handleHeroData(data: data)
        }
        task.resume()
    }

    
    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            DispatchQueue.main.async {
                self.updateUI(with: hero)
            }
        } catch {
            print("Error decoding hero data: \(error.localizedDescription)")
        }
    }
    
    private func updateUI(with hero: Hero) {
        heroName.text = hero.name
        heroFullName.text = hero.biography.fullName
        IntelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
        strengthLabel.text = "Strength: \(hero.powerstats.strength)"
        speedLabel.text = "Speed: \(hero.powerstats.speed)"
        powerLabel.text = "Power: \(hero.powerstats.power)"
        genderLabel.text = "Gender: \(hero.appearance.gender)"
        placeOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth)"
        occupationLabel.text = "Occupation: \(hero.work.occupation)"
        publisherLabel.text = "Publisher: \(hero.biography.publisher)"
        
        if let image = getImageFromUrl(string: hero.images.sm) {
                heroImage.image = image
            }
    }
    
    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }
    
    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
    
}

  
