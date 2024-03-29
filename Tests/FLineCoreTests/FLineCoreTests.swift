@testable import FLineCore

import Quick
import Nimble

final class StoreFactorySpec: QuickSpec {
    override func spec() {
        describe("The StoreFactory") {
            func _makeSUT() -> StoreFactory {
                return StoreFactory()
            }
            
            it("can be instantiated") {
                _ = _makeSUT()
            }
            
            it("creates a store with a state.") {
                let sut = _makeSUT()
                expect(sut.createStore().state).toNot(beNil())
            }
        }
    }
}

final class MainMenuSpec: QuickSpec {
    override func spec() {
        describe("The main scene of a new state") {
            it("is the game menu") {
                expect(StoreFactory().createStore().state!.mainScene).to(equal(.mainMenu))
                expect(StoreFactory().createStore().state?.mainScene.mainMenu).toNot(beNil())
                expect(StoreFactory().createStore().state?.mainScene.playingState).to(beNil())
            }

            it("does not say that the game was quit") {
                expect(StoreFactory().createStore().state!.didQuit).to(equal(false))
            }
            
            context("when given a quit action") {
                it("changes its state to indicate that it was quit") {
                    let store = StoreFactory().createStore()
                    store.dispatch(MainMenuAction.quit)
                    expect(store.state!.didQuit).to(equal(true))
                }
            }
        }
    }
}

final class LevelSpec: QuickSpec {
    override func spec() {
        describe("The main menu") {
            context("when choosing to play") {
               it("goes to the playing scene, with the playing state at tick zero") {
                    let store = StoreFactory().createStore()
                    store.dispatch(MainMenuAction.play)
                    
                    expect(store.state?.mainScene.playingState).toNot(beNil())
                    expect(store.state?.mainScene.playingState?.tick).to(equal(0))

                    expect(store.state?.mainScene.mainMenu).to(beNil())
               }
            }
        }

        describe("A playing state") {
            context("when a tick action is dispatched") {
                it("Increments the tick") {
                    let store = StoreFactory().createStore()
                    store.dispatch(MainMenuAction.play)
                    
                    store.dispatch(PlayingAction.tick)
                    expect(store.state?.mainScene.playingState?.tick).to(equal(1))

                    store.dispatch(PlayingAction.tick)
                    expect(store.state?.mainScene.playingState?.tick).to(equal(2))
                }
            }
        }

        describe("A new playing state") {
            let store = StoreFactory().createStore()
            store.dispatch(MainMenuAction.play)

            context("the player") {
                it("starts at the zero coordinates") {
                    let expected = Location(x: 0, y: 0)
                    let actual = store.state?.mainScene.playingState?.player.navigation.location
                    expect(actual).to(equal(expected))
                }

                it("starts with a bearing of north") {
                    let expected = Bearing(degrees: 0)
                    let actual = store.state?.mainScene.playingState?.player.navigation.bearing
                    expect(actual).to(equal(expected))
                }

                it("starts with a zero speed") {
                    let expected = Float(0)
                    let actual = store.state?.mainScene.playingState?.player.navigation.speed
                    expect(actual).to(equal(expected))
                }
            }
        }

        describe("The player's navigation") {
            let store = StoreFactory().createStore()
            store.dispatch(MainMenuAction.play)

            context("with course set for a location that is straight ahead") {
                let targetLocation = Location(x: 0, y: -1000)
                store.dispatch(PlayingAction.setCourse(to: targetLocation))

                it("updates the player state with the target location") {
                    expect(store.state?.mainScene.playingState?.player.navigation.targetLocation).to(equal(targetLocation))
                }

                it("does not accelrate immediately") {
                    expect(store.state?.mainScene.playingState?.player.navigation.speed).to(equal(0))
                }

                it("accelerates after a tick") {
                    store.dispatch(PlayingAction.tick)
                    expect(store.state?.mainScene.playingState?.player.navigation.speed).to(beGreaterThan(0))
                }
            }
        }
    }
 }

