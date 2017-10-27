# LensKit
[![Build Status][status-image]][status-url]
[![Carthage compatible][carthage-image]][carthage-url]

a minimum Lens type, and code generation helper  
inspired by [lens](https://github.com/ekmett/lens)

## Overview

[Monocle.Lens - elm-monocle](http://package.elm-lang.org/packages/arturopala/elm-monocle/latest/Monocle-Lens)

> A Lens is a functional common problem: how to easily update a complex immutable structure,  
> for this purpose Lens acts as a zoom into a record.

example.

```swift
struct Street { let name: String }
struct Address { let street: Street }
struct Company { let address: Address }
struct Employee { let company: Company }

let employee = Employee(company: Company(address: Address(street: Street(name: "street"))))
```

use lens

```swift
let _name: Lens<Street, String> = Lens(get: { $0.name }, set: { Street(name: $1) })
let _street: Lens<Address, Street> = Lens(get: { $0.street }, set: { Address(street: $1) })
let _address: Lens<Company, Address> = Lens(get: { $0.address }, set: { Company(address: $1) })
let _company: Lens<Employee, Company> = Lens(get: { $0.company }, set: { Employee(company: $1) })

(_company >>> _address >>> _street >>> _name).modify(employee) { $0.capitalizedString } // Street
```

## Code generation with [Sourcery](https://github.com/krzysztofzablocki/Sourcery)
By using [Scripts/generate-lenser.sh](Scripts/generate-lenser.sh), LensKit will support `lens-implementation` to auto-generate `extension YourClass: Lenser`.

```bash
# Usage: ./generate-lenser.sh <source_dir> <code-generated-dir>
$ ./path/to/LensKit/Scripts/generate-lenser.sh ./Sources ./Sources/CodeGenerated/
```

output file: [Lenser.generated.swift](Tests/LensKitTests/CodeGenerated/Lenser.generated.swift)

## Installation

#### [Carthage](https://github.com/Carthage/Carthage)
Add following line into your Cartfile and run `carthage update`.

```shell
github "to4iki/LensKit"
```

#### [SwiftPackage Manager](https://github.com/apple/swift-package-manager)
Add following line into your Package.swift and run `swift build`.

```swift
dependencies: [
    .Package(url: "https://github.com/to4iki/LensKit.git", majorVersion: 0)
]
```

[status-url]: https://travis-ci.org/to4iki/LensKit
[status-image]: https://travis-ci.org/to4iki/LensKit.svg

[carthage-url]: https://github.com/Carthage/Carthage
[carthage-image]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat
