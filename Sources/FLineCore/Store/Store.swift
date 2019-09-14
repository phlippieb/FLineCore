//
//  Store.swift
//  FLineCore
//
//  Created by Phlippie Bosman on 2019/09/14.
//

import ReSwift

final class StoreFactory {
    func createStore() -> Store<FirelineState> {
        return Store(
            reducer: firelineReducer,
            state: FirelineState())
    }
}

struct FirelineState: StateType {}

let firelineReducer: Reducer<FirelineState> = _firelineReducer

func _firelineReducer(
    _ action: Action,
    _ state: FirelineState?
    ) -> FirelineState {
    return state ?? FirelineState()
}
