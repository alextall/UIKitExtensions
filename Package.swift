// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitExtensions",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "UICollectionViewExtensions",
            targets: [
                "UICollectionView",
            ]
        ),
        .library(
            name: "UIStoryboardExtensions",
            targets: [
                "UIStoryboard",
            ]
        ),
        .library(
            name: "UITableViewExtensions",
            targets: [
                "UITableView",
            ]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DefaultIdentifier",
            dependencies: []
        ),
        .target(
            name: "UICollectionView",
            dependencies: [
                .byName(name: "DefaultIdentifier"),
            ]
        ),
        .target(
            name: "UIStoryboard",
            dependencies: []
        ),
        .target(
            name: "UITableView",
            dependencies: [
                .byName(name: "DefaultIdentifier"),
            ]
        ),
    ]
)
