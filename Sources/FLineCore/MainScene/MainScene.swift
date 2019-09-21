public enum MainSceneType: Equatable {
    case mainMenu
    case playing(PlayingState)
}

public struct PlayingState: Equatable {
    let tick: Int = 0
}

