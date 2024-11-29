
import UIKit
import Alamofire
import Kingfisher

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
        let publisher: String?
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
    
    private let api = "https://akabab.github.io/superhero-api/api/all.json"
    private var heroes: [Hero] = []
    
    @IBAction func RollHeroButton(_ sender: UIButton) {
        Task {
                if heroes.isEmpty {
                    await fetchHeroesAsync()
                }
                if let randomHero = heroes.randomElement() {
                    animateHeroDisplay(hero: randomHero)
                } else {
                    showErrorAlert(message: "No heroes available to display.")
                }
            }
    }
    
    private func fetchHeroes() {
        AF.request(api).responseDecodable(of: [Hero].self) { response in
            switch response.result {
            case .success(let heroes):
                self.heroes = heroes
            case .failure(let error):
                self.showErrorAlert(message: "Failed to fetch heroes: \(error.localizedDescription)")
            }
        }
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    private func fetchHeroesAsync() async {
        let result = await AF.request(api).serializingDecodable([Hero].self).result
        switch result {
        case .success(let heroes):
            self.heroes = heroes
        case .failure(let error):
            print(error)
        }
    }
    
    private func configureUI(with hero: Hero) {
        heroName.text = hero.name
        heroFullName.text = "Full Name: \(hero.biography.fullName)"
        IntelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
        strengthLabel.text = "Strength: \(hero.powerstats.strength)"
        speedLabel.text = "Speed: \(hero.powerstats.speed)"
        powerLabel.text = "Power: \(hero.powerstats.power)"
        genderLabel.text = "Gender: \(hero.appearance.gender)"
        placeOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth)"
        occupationLabel.text = "Occupation: \(hero.work.occupation)"
        publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "Unknown")" // Значение по умолчанию
        if let url = URL(string: hero.images.sm) {
            heroImage.kf.setImage(with: url)
        }
    }
    
    private func animateHeroDisplay(hero: Hero) {
        UIView.animate(withDuration: 0.3, animations: {
            self.heroImage.alpha = 0
        }) { _ in
            self.configureUI(with: hero)
            UIView.animate(withDuration: 0.3) {
                self.heroImage.alpha = 1
            }
        }
    }
}

