# UIKit Extensions

A series of microframeworks extending UIKit types with convenient strongly-typed methods.

- [UIStoryboard](#UIStoryboard)
- [UICollectionView](#UICollectionView)
- [UITableView](#UITableView)

## UIStoryboard

`func instantiate<T>(_:) -> T`

## UICollectionView

`func registerClass(_:)`
`func registerNib(_:)`
`func dequeueReusableCell<T>(_:for: IndexPath) -> T`

## UITableView

`func registerClass(_:)`
`func registerNib(_:)`
`func dequeue<T>(_:) -> T?`
`func dequeue<T>(_:for:) -> T`
