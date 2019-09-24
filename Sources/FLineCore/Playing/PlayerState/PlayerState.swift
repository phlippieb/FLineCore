public struct PlayerState: Equatable {
   public var navigation = Navigation()
}

public struct Navigation: Equatable {
   public var location = Location(x: 0, y: 0)
   public var bearing = Bearing(degrees: 0)

   /// Where the player is headed. Nil if not navigating.
   public var targetLocation: Location?
}

public struct Location: Equatable {
   let x: Float
   let y: Float
}

public struct Bearing: Equatable {
   /// Degrees from North (so East is 90)
   let degrees: Float
}
