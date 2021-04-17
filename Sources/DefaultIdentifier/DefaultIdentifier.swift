public protocol DefaultReuseIdentifier {
    static var identifier: String { get }
}

public extension DefaultReuseIdentifier {
    static var identifier: String {
        String(describing: Self.self)
    }
}
