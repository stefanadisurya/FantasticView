//
//  FantasticNode.swift
//  FantasticView
//
//  Created by Stefan Adisurya on 02/09/23.
//

import AsyncDisplayKit
import TextureSwiftSupport

public class FantasticNode: ASDisplayNode {
    // MARK: - Views
    
    private let titleNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.backgroundColor = .black
        
        return node
    }()
    
    private let subtitleNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.backgroundColor = .black
        
        return node
    }()
    
    private let authorNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = .init(
            string: "Made with 😎 by stefanadisurya",
            attributes: [
                .font: UIFont.italicSystemFont(ofSize: 12),
                .foregroundColor: UIColor.white
            ]
        )
        node.backgroundColor = .black
        
        return node
    }()
    
    // MARK: - Properties
    
    private var colors : [UIColor] = []
    
    // MARK: - Properties
    
    private var useVanilla: Bool
    private var colorCounter = 0
    
    // MARK: - Life Cycle

    public init(useVanilla: Bool) {
        self.useVanilla = useVanilla
        
        super.init()
        
        automaticallyManagesSubnodes = true
        automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    override public func didLoad() {
        super.didLoad()
        setupColors()
        setupText()
        runColorChange()
    }
    
    override public func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        /**
         1. If `useVanilla == true`, then will use layouting from `Texture`
         2. Else, will use layouting from `TextureSwiftSupport`
         
         Result will be the same
         */
        if useVanilla {
            return ASStackLayoutSpec(
                direction: .vertical,
                spacing: 8,
                justifyContent: .center,
                alignItems: .center,
                children: [
                    titleNode,
                    subtitleNode,
                    authorNode
                ]
            )
        } else {
            return LayoutSpec {
                VStackLayout(spacing: 8, justifyContent: .center, alignItems: .center) {
                    titleNode
                    subtitleNode
                    authorNode
                }
            }
        }
    }
    
    // MARK: - Functions
    
    private func runColorChange() {
        guard Thread.isMainThread else { return }

        let scheduledColorChanged = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            UIView.animate(withDuration: 2.0) { [weak self] in
                guard let self = self else { return }
                self.backgroundColor = self.colors[self.colorCounter % self.colors.count]
                self.colorCounter += 1
            }
        }

        scheduledColorChanged.fire()
    }
    
    private func setupColors() {
        colors = useVanilla ? [
            .red,
            .orange,
            .yellow,
            .green,
            .blue,
            .purple
        ] : [
            .brown,
            .cyan,
            .magenta
        ]
    }
    
    private func setupText() {
        titleNode.attributedText = .init(
            string: useVanilla ? "Texture Vanilla Layout" : "TextureSwiftSupport Layout",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 17),
                .foregroundColor: UIColor.white
            ]
        )

        subtitleNode.attributedText = .init(
            string: useVanilla ? "Don't forget to check the TextureSwiftSupport extension 😉" : "You're witnessing a TextureSwiftSupport view 🫵🏻",
            attributes: [.foregroundColor: UIColor.white]
        )
    }
}
