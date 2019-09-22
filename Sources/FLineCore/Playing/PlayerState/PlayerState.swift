public struct PlayerState: Equatable {
   public var navigation = Navigation()
}

public struct Navigation: Equatable {
   public var location = Location(x: 0, y: 0)
}

public struct Location: Equatable {
   let x: Float
   let y: Float
}
