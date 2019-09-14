@testable import FLineCore

import Quick
import Nimble

final class TestSpec: QuickSpec {
    override func spec() {
        describe("The Quick unit test") {
            it("runs") {
                expect(true).to(equal(true))
            }
        }
    }
}

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
