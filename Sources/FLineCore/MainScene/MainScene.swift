public enum MainSceneType: Equatable {
    case mainMenu
    case playing(PlayingState)

    public var mainMenu: Void? {
        guard case .mainMenu = self else { return nil }
        return ()
    }

    public var playingState: PlayingState? {
        get {
            guard case let .playing(value) = self else { return nil }
            return value
        }
        set {
            guard case .playing = self, let newValue = newValue else { return }
            self = .playing(newValue)
        }
    }
}

