//
//  ViewController.swift
//  FantasticView
//
//  Created by Stefan Adisurya on 26/08/23.
//

import RxCocoa
import RxSwift
import UIKit

public final class ViewController: UIViewController {
    // MARK: - Views
    
    private var fantasticView: FantasticView
    
    // MARK: - Life Cycle
    
    public init(fantasticView: FantasticView = FantasticView(frame: .zero)) {
        self.fantasticView = fantasticView
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fantasticView = FantasticView(frame: .zero)
        super.init(coder: coder)
    }
    
    override public func viewDidLoad() {
        let fantasticView = FantasticView(frame: view.bounds)
        
        super.viewDidLoad()
        
        view.addSubview(fantasticView)
    }
}

