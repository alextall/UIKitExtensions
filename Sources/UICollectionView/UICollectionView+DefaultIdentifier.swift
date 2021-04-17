import DefaultIdentifier
import UIKit

extension UICollectionReusableView: DefaultReuseIdentifier {}

public extension UICollectionView {
    /// Registers a class for use in creating new collection view cells.
    ///
    /// Prior to calling the dequeueReusableCell(withReuseIdentifier:for:) method of the collection view, you must use this method or the register(_:forCellWithReuseIdentifier:) method to tell the collection view how to create a new cell of the given type. If a cell of the specified type is not currently in a reuse queue, the collection view uses the provided information to create a new cell object automatically.
    ///
    /// - Parameter type: The class of a cell that you want to use in the collection view.
    func registerClass(_ type: UICollectionReusableView.Type) {
        register(type, forCellWithReuseIdentifier: type.identifier)
    }

    /// Registers a nib-based cell-type for use in creating new collection view cells.
    ///
    /// Prior to calling the dequeueReusableCell(withReuseIdentifier:for:) method of the collection view, you must use this method or the register(_:forCellWithReuseIdentifier:) method to tell the collection view how to create a new cell of the given type. If a cell of the specified type is not currently in a reuse queue, the collection view uses the provided information to create a new cell object automatically.
    /// 
    /// - Parameter type: The class of a nib that you want to use in the collection view.
    func registerNib(_ type: UICollectionReusableView.Type) {
        let nib = UINib(nibName: type.identifier, bundle: .init(for: type))
        register(nib, forCellWithReuseIdentifier: type.identifier)
    }

    /// Dequeues a reusable cell object located by its class.
    ///
    /// Call this method from your data source object when asked to provide a new cell for the collection view. This method dequeues an existing cell if one is available or creates a new one based on the class or nib file you previously registered.
    ///
    /// - Parameters:
    ///   - type: The class for the specified cell.
    ///   - indexPath: The index path specifying the location of the cell. The data source receives this information when it is asked for the cell and should just pass it along. This method uses the index path to perform additional configuration based on the cell’s position in the collection view.
    /// - Returns: An instance of the specified cell for the given `IndexPath`.
    ///
    /// - Important: You must register a class or nib file with one of the following methods before calling this method.
    ///
    /// - `registerClass(_:)`
    /// - `registerNib(_:)`
    /// - `register(_:forCellWithReuseIdentifier:) `
    /// - `register(_:forCellWithReuseIdentifier:)`
    ///
    /// If you registered a class for the specified identifier and a new cell must be created, this method initializes the cell by calling its `init(frame:)` method. For nib-based cells, this method loads the cell object from the provided nib file. If an existing cell was available for reuse, this method calls the cell’s `prepareForReuse()` method instead.
    func dequeueReusableCell<T: UICollectionReusableView>(_ type: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as! T
    }
}
