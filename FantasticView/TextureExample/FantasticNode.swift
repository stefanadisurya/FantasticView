//
//  FantasticNode.swift
//  FantasticView
//
//  Created by Stefan Adisurya on 02/09/23.
//

import AsyncDisplayKit

public class FantasticNode: ASDisplayNode {
    // MARK: - Properties
    
    private let colors : [UIColor] = [
        .red,
        .orange,
        .yellow,
        .green,
        .blue,
        .purple
    ]
    
    private var colorCounter = 0
    
    // MARK: - Life Cycle

    override public init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    public override func didLoad() {
        super.didLoad()
        runColorChange()
    }
    
    // MARK: - Functions
    
    private func runColorChange() {
        let scheduledColorChanged = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            UIView.animate(withDuration: 2.0) { [weak self] in
                guard let self = self else { return }
                self.layer.backgroundColor = self.colors[self.colorCounter % self.colors.count].cgColor
                self.colorCounter += 1
            }
        }

        scheduledColorChanged.fire()
    }
}
