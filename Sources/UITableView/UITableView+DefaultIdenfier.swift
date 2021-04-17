import DefaultIdentifier
import UIKit

extension UITableViewCell: DefaultReuseIdentifier {}

public extension UITableView {
    /// Registers a class for use in creating new table cells.
    ///
    /// Prior to dequeueing any cells, call this method or the register(_:forCellReuseIdentifier:) method to tell the table view how to create new cells. If a cell of the specified type is not currently in a reuse queue, the table view uses the provided information to create a new cell object automatically.
    ///
    /// - Parameter type: The class of a cell that you want to use in the table (must be a [UITableViewCell](apple-reference-documentation://ls%2Fdocumentation%2Fuikit%2Fuitableviewcell) subclass).
    func registerClass(_ type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.identifier)
    }

    /// Registers a nib-based cell object containing a cell with the table view.
    ///
    /// Before dequeueing any cells, call this method or the register(_:forCellReuseIdentifier:) method to tell the table view how to create new cells. If a cell of the specified type is not currently in a reuse queue, the table view uses the provided information to create a new cell object automatically.
    ///
    /// - Parameter type: The class of a nib-based cell that you want to use in the table (must be a [UITableViewCell](apple-reference-documentation://ls%2Fdocumentation%2Fuikit%2Fuitableviewcell) subclass).
    func registerNib(_ type: UITableViewCell.Type) {
        let nib = UINib(nibName: type.identifier, bundle: .init(for: type))
        register(nib, forCellReuseIdentifier: type.identifier)
    }

    /// Returns a reusable table-view cell object located by its class.
    ///
    /// For performance reasons, a table view’s data source should generally reuse UITableViewCell objects when it assigns cells to rows in its tableView(_:cellForRowAt:) method. A table view maintains a queue or list of UITableViewCell objects that the data source has marked for reuse. Call this method from your data source object when asked to provide a new cell for the table view. This method dequeues an existing cell if one is available or creates a new one using the class or nib file you previously registered. If no cell is available for reuse and you did not register a class or nib file, this method returns nil.
    ///
    /// If you registered a class for the specified identifier and a new cell must be created, this method initializes the cell by calling its init(style:reuseIdentifier:) method. For nib-based cells, this method loads the cell object from the provided nib file. If an existing cell was available for reuse, this method calls the cell’s prepareForReuse() method instead.
    ///
    /// - Parameter type: The class of a cell that you want to use in the table.
    /// - Returns: An instance of the specified cell.
    func dequeue<T: UITableViewCell>(_ type: T.Type) -> T? {
        dequeueReusableCell(withIdentifier: type.identifier) as? T
    }

    /// Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table.
    ///
    ///Call this method only from the `tableView(_:cellForRowAt:)` method of your table view data source object. This method returns an existing cell of the specified type, if one is available, or it creates and returns a new cell using the class or storyboard you provided earlier. Do not call this method outside of your data source's `tableView(_:cellForRowAt:)` method. If you need to create cells at other times, call `dequeueReusableCell(withIdentifier:)` instead.
    ///
    ///- Important: You must specify a cell with a matching identifier in your storyboard file. You may also register a class or nib file using the `register(_:forCellReuseIdentifier:)` or `register(_:forCellReuseIdentifier:)` method, but must do so before calling this method.
    ///
    ///When creating new cells from your storyboard or nib file, this method loads the cell object and initializes it using its init(coder:) method. When creating cells from a registered class, this method creates the cell and initializes it by calling its init(style:reuseIdentifier:) method. For nib-based cells, this method loads the cell object from the provided nib file. If an existing cell was available for reuse, this method calls the cell’s prepareForReuse() method instead.
    ///
    /// - Parameters:
    ///   - type: The class of a cell that you want to use in the table.
    ///   - indexPath: The index path specifying the location of the cell. Always specify the index path provided to you by your data source object. This method uses the index path to perform additional configuration based on the cell’s position in the table view.
    /// - Returns: An instance of the specified cell.
    func dequeue<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
}
