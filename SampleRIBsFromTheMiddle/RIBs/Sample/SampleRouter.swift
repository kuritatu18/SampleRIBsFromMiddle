//
//  SampleRouter.swift
//  SampleRIBsFromTheMiddle
//
//  Created by Tatsunori Kuri on 2020/03/16.
//  Copyright © 2020 Tatsunori Kuri. All rights reserved.
//

import RIBs

protocol SampleInteractable: Interactable {
    var router: SampleRouting? { get set }
    var listener: SampleListener? { get set }
}

protocol SampleViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SampleRouter: LaunchRouter<SampleInteractable, SampleViewControllable>, SampleRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SampleInteractable, viewController: SampleViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
