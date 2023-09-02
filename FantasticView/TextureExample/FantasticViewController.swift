//
//  FantasticViewController.swift
//  FantasticView
//
//  Created by Stefan Adisurya on 02/09/23.
//

import AsyncDisplayKit

public final class FantasticViewController: ASDKViewController<ASDisplayNode> {
    // MARK: - Views
    
    private let fantasticNode: FantasticNode = FantasticNode()
    
    // MARK: - Life Cycle

    override public init() {
        super.init(node: ASDisplayNode())
        
        node.automaticallyManagesSubnodes = true
        node.automaticallyRelayoutOnSafeAreaChanges = true
        node.layoutSpecBlock = layoutSpecBlock()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    
    private func layoutSpecBlock() -> ASLayoutSpecBlock {
        return { [weak self] _, _ in
            guard let self = self else { return ASLayoutSpec() }
            
            return ASWrapperLayoutSpec(layoutElement: fantasticNode)
        }
    }
}
