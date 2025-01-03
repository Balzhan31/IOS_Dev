//
//  ViewController.swift
//  Book Nest
//
//  Created by Балжан Бозбашава on 25.10.2024.
//

import UIKit

struct Book {
    let title: String
    let desc: String
    let imageee: UIImage
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let favouriteBooks: [Book] = [
        Book(title: "Не грусти! Рецепты счастья и лекарство от грусти", desc: "В этой книге собраны надежные, проверенные и простые рецепты счастья из Книги Аллаха и Сунны Его Посланника, упорядоченные, адаптированные и дополненные на основе трудов авторитетных мусульманских ученых. Пусть эта мудрая и светлая книга, ставшая лекарством от уныния и грусти для миллионов читателей по всему миру, вдохновит и тебя.", imageee: #imageLiteral(resourceName: "9")),
        Book(title: "Атомные привычки", desc: "Основная мысль книги «Атомные привычки» — человек не может кардинально измениться за один день. Даже если он сделает несвойственный себе рывок, результаты надолго не задержатся, потому что настоящих изменений не произошло. Чтобы что-либо перестроить в своей жизни, нужно работать над совсем маленькими привычками.", imageee: #imageLiteral(resourceName: "1")),
        Book(title: "Триумфальная арка", desc: "Пронзительная история любви всему наперекор, любви, приносящей боль, но и дарующей бесконечную радость. Место действия - Париж накануне Второй мировой войны. Герой - беженец из Германии, без документов, скрывающийся и от французов, и от нацистов, хирург, спасающий человеческие жизни.", imageee: #imageLiteral(resourceName: "7")),
        Book(title: "Десять негритят", desc: "Детективный роман Агаты Кристи, написанный в 1939 году. В англоязычных странах из-за политкорректности роман издаётся под названием «И никого не стало» (And Then There Were None).", imageee: #imageLiteral(resourceName: "3")),
        Book(title: "Смерть на Ниле", desc: "На роскошном пароходе «Карнак», плывущем по Нилу, убита молодая миллионерша, недавно вышедшая замуж и, как выяснилось, имевшая множество врагов среди пассажиров. Любой мог убить самоуверенную и нагловатую девушку, укравшую жениха у лучшей подруги. ", imageee: #imageLiteral(resourceName: "2")),
        Book(title: "Убийства по алфавиту", desc: "В английском алфавите 26 букв. В подписи преступника, затеявшего с Эркюлем Пуаро игру при помощи писем, всего три буквы, первые, А, B и С. Он планирует совершить убийства в местах, названия которых расположены в алфавитном порядке. Задача Пуаро - разгадать замыслы убийцы и не дать ему совершить задуманные 26 преступлений", imageee: #imageLiteral(resourceName: "8")),
        Book(title: "Миндаль", desc: "Сон Юн Чжэ родился с алекситимией - неспособностью распознавать собственные чувства. Ему неведомы страх, сочувствие и даже симпатия.", imageee: #imageLiteral(resourceName: "6")),
        Book(title: "Тайная история", desc: "Действие происходит в небольшом колледже в Вермонте, куда девятнадцатилетний Ричард Пейпен приезжает изучать древнегреческий язык. Новые друзья Ричарда - четверо молодых людей и одна девушка - умны, раскованны, богаты и так увлечены античной культурой, что рассматривают себя чуть ли не как особую касту ее хранителей.", imageee: #imageLiteral(resourceName: "10")),
        Book(title: "Бремя страстей человеческих", desc: "Главный герой книги — Филип Кэри, хромой сирота, чья судьба прослеживается от несчастливого детства до взрослых лет. Филип мучительно ищет своё призвание и пытается выяснить, в чём же состоит смысл жизни. Ему предстоит испытать немало разочарований и расстаться со многими иллюзиями, прежде чем он сумеет найти свой ответ на этот вопрос.", imageee: #imageLiteral(resourceName: "4")),
        Book(title: "Бумажные города", desc: "Роман повествует о совершеннолетии главного героя Квентина Кью Джейкобсена и его поиске Марго Рот Шпигельман,соседке через дорогу,в которую он был влюблен с самого детства.", imageee: #imageLiteral(resourceName: "5")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }

}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        let book = favouriteBooks[indexPath.row]
        
        cell.configure(with: book)
        
        return cell;
    }
}
