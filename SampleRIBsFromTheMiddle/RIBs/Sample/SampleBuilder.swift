//
//  SampleBuilder.swift
//  SampleRIBsFromTheMiddle
//
//  Created by Tatsunori Kuri on 2020/03/16.
//  Copyright © 2020 Tatsunori Kuri. All rights reserved.
//

import RIBs

protocol SampleDependency: Dependency {
    var displayButtonText: String { get }
}

final class SampleComponent: Component<SampleDependency> {

    fileprivate var displayButtonText: String {
        dependency.displayButtonText
    }
}

// MARK: - Builder

protocol SampleBuildable: Buildable {
    func build(withListener listener: SampleListener) -> SampleRouting
}

final class SampleBuilder: Builder<SampleDependency>, SampleBuildable {
    override init(dependency: SampleDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SampleListener) -> SampleRouting {
        let component = SampleComponent(dependency: dependency)
        let viewController = SampleViewController()
        let interactor = SampleInteractor(presenter: viewController,
                                          displayButtonText: component.displayButtonText)
        interactor.listener = listener
        return SampleRouter(interactor: interactor, viewController: viewController)
    }
}
