//
//  SecondComponent+Sample.swift
//  SampleRIBsFromTheMiddle
//
//  Created by Tatsunori Kuri on 2020/03/30.
//  Copyright © 2020 Tatsunori Kuri. All rights reserved.
//

import RIBs

class SecondComponent: Component<EmptyDependency> {
    init() {
        super.init(dependency: EmptyComponent())
    }
}

extension SecondComponent: SampleDependency {
    var displayButtonText: String {
        "SampleRIBsFromMiddle"
    }
}
