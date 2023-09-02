//
//  FantasticView.swift
//  FantasticView
//
//  Created by Stefan Adisurya on 26/08/23.
//

import UIKit

public class FantasticView: UIView {
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

    override public init(frame: CGRect) {
        super.init(frame: frame)
        runColorChange()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
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
