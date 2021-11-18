// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Open3dPackageforInnoyard",
    products: [
        .library(
            name: "Open3D-iOS",
            targets: [
                "LinkOpen3D",
                "Open3DSupport",
                "Assimp",
                "Faiss",
                "IrrXML",
                "JPEG",
                "libOpen3D_3rdparty_jsoncpp.a",
                "libOpen3D_3rdparty_lzf.a",
                "libOpen3D_3rdparty_qhull_r.a",
                "libOpen3D_3rdparty_qhullcpp.a",
                "libOpen3D_3rdparty_rply.a",
                "libOpen3D.a",
                "libpng.a",
                "pybind.a",
                "TBB",
            ]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/dannyboy0103/NumPy-iOS.git", .branch("main")),
        .package(url: "https://github.com/dannyboy0103/LAPACKE-iOS.git", .branch("main")),
        .package(url: "https://github.com/dannyboy0103/BLAS-LAPACK-AppStore-Workaround.git", .branch("main")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: "Assimp", path: "BinaryFramework/Assimp.xcframework"),
        .binaryTarget(name: "Faiss", path: "BinaryFramework/Faiss.xcframework"),
        .binaryTarget(name: "IrrXML", path: "BinaryFramework/IrrXML.xcframework"),
        .binaryTarget(name: "JPEG", path: "BinaryFramework/JPEG.xcframework"),
        .binaryTarget(name: "libOpen3D_3rdparty_jsoncpp.a", path: "BinaryFramework/libOpen3D_3rdparty_jsoncpp.a.xcframework"),
        .binaryTarget(name: "libOpen3D_3rdparty_lzf.a", path: "BinaryFramework/libOpen3D_3rdparty_lzf.a.xcframework"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhull_r.a", path: "BinaryFramework/libOpen3D_3rdparty_qhull_r.a.xcframework"),
        .binaryTarget(name: "libOpen3D_3rdparty_qhullcpp.a", path: "BinaryFramework/libOpen3D_3rdparty_qhullcpp.a.xcframework"),
        .binaryTarget(name: "libOpen3D_3rdparty_rply.a", path: "BinaryFramework/libOpen3D_3rdparty_rply.a.xcframework"),
        .binaryTarget(name: "libOpen3D.a", path: "BinaryFramework/libOpen3D.a.xcframework"),
        .binaryTarget(name: "libpng.a", path: "BinaryFramework/libpng.a.xcframework"),
        .binaryTarget(name: "pybind.a", path: "BinaryFramework/pybind.a.xcframework"),
        .binaryTarget(name: "TBB", path: "BinaryFramework/TBB.xcframework"),
        .target(
            name: "LinkOpen3D",
            dependencies: [
                "NumPy-iOS",
                "LAPACKE-iOS",
                "Assimp",
                "Faiss",
                "IrrXML",
                "JPEG",
                "libOpen3D_3rdparty_jsoncpp.a",
                "libOpen3D_3rdparty_lzf.a",
                "libOpen3D_3rdparty_qhull_r.a",
                "libOpen3D_3rdparty_qhullcpp.a",
                "libOpen3D_3rdparty_rply.a",
                "libOpen3D.a",
                "libpng.a",
                "pybind.a",
                "TBB",
                "BLAS-LAPACK-AppStore-Workaround",
            ],
            linkerSettings: [
                .linkedLibrary("stdc++"),
            ]
        ),
        .target(
            name: "Open3DSupport",
            resources: [.copy("site-packages")]),
        .testTarget(
            name: "Open3dPackageforInnoyardTests",
            dependencies: ["Open3DSupport"]),
    ]
)
