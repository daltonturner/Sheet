import Foundation

struct Recipe: Identifiable, Equatable {
    let id: UUID
    let name: String
    let description: String
    let imageUrl: String?
    let ingredients: [Ingredient]
    let steps: [String]

    init(
        id: UUID = UUID(),
        name: String,
        description: String,
        imageUrl: String? = nil,
        ingredients: [Ingredient],
        steps: [String]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.ingredients = ingredients
        self.steps = steps
    }
}

