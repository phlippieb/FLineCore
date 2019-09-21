public enum MainSceneType: Equatable {
    case mainMenu
    case playing(PlayingState)
}

public struct PlayingState: Equatable {
    var tick: Int = 0
}

import ReSwift

public enum PlayingAction: Action {
    case tick
}

let playingReducer: Reducer<FirelineState> = { (action: Action, state: FirelineState?) -> FirelineState in
   var state = state ?? FirelineState()

    guard let playingAction = action as? PlayingAction,
        case .playing(var playingState) = state.mainScene
        else { return state }

    switch playingAction {
    case .tick:
        playingState.tick += 1
    }

    state.mainScene = .playing(playingState)
    return state
}

