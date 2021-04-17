import DefaultIdentifier
import UIKit

extension UIViewController: DefaultReuseIdentifier {}

public extension UIStoryboard {
    /// Creates the specified view controller from the storyboard.
    ///
    /// Use this method to create a view controller object to present programmatically. Each time you call this method, it creates a new instance of the view controller.
    ///
    /// - Important: The view controller must have a storyboard ID matching it's class name.
    ///
    /// - Parameter type: The class of a view controller from the storyboard.
    /// - Returns: And instance of the specified view controller.
    func instantiate<T: UIViewController>(_ type: T.Type) -> T {
        guard let vc = instantiateViewController(identifier: type.identifier) as? T else {
            fatalError("\(type) could not be instantiated")
        }
        return vc
    }
}
