import Foundation

class ShoppingList {
    var items: [String] = []
    
    func add(item: String) {
        items.append(item)
    }
    
    func remove(item: String) {
        items.removeAll(where: { $0 == item })
    }
}

let list = ShoppingList()
list.add(item: "Bag")
list.add(item: "Jeans")
list.add(item: "Coat")
list.remove(item: "Jeans")
print(list)

