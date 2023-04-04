import Foundation

struct Ingredient: Identifiable, Equatable {
    let id: UUID
    let name: String
    let quantity: String

    init(
        id: UUID = UUID(),
        name: String,
        quantity: String
    ) {
        self.id = id
        self.name = name
        self.quantity = quantity
    }
}
