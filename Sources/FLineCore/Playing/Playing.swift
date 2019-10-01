import ReSwift

public struct PlayingState: Equatable {
    var tick: Int = 0
    var player = PlayerState()
}

public enum PlayingAction: Action {
    case tick
    case setCourse(to: Location)
}

let playingReducer: Reducer<FirelineState> = { (action: Action, state: FirelineState?) -> FirelineState in
   var state = state ?? FirelineState()

    guard let playingAction = action as? PlayingAction
        else { return state }

    switch playingAction {
    case .tick:
        state.mainScene.playingState?.tick += 1
        state.mainScene.playingState?.player.navigation.speed = 1

    case .setCourse(let targetLocation):
      state.mainScene.playingState?.player.navigation.targetLocation = targetLocation
    }

    return state
}

