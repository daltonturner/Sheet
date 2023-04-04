import ComposableArchitecture
import Foundation

struct RecipeClient {
  var fetch: (Int) async throws -> String
}

private enum RecipeClientKey: DependencyKey {
  static let liveValue = RecipeClient(
    fetch: { recipe in
      let (data, _) = try await URLSession.shared
        .data(from: .init(string: "")!)
      return String(decoding: data, as: UTF8.self)
    }
  )
}

extension DependencyValues {
  var recipeClient: RecipeClient {
    get { self[RecipeClientKey.self] }
    set { self[RecipeClientKey.self] = newValue }
  }
}
