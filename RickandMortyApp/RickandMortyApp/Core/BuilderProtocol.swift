import Foundation

public protocol BuilderProtocol {
    func build() -> BaseViewController
}

public extension BuilderProtocol {
    func build() -> BaseViewController { BaseViewController() }
}
