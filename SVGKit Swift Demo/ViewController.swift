//
//  ViewController.swift
//  SVGKit Swift Demo
//
//  Created by Sebastián Badea on 13/5/16.
//  Copyright © 2016 Sebastian Badea. All rights reserved.
//

import UIKit
import SVGKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var svgkFastImageCanvasView: UIView!
    @IBOutlet weak var svgkLayeredImageCanvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "1024px-Ghostscript_Tiger.png");
        imageView.image = image;
        
        // https://github.com/SVGKit/SVGKit/issues/445
        let svgkImage = SVGKImage(named: "Ghostscript_Tiger");
        
        //let svgkImage = SVGKImage(named: "Trollface");
        
        let svgkFastImageView = SVGKFastImageView(SVGKImage: svgkImage);
        svgkFastImageCanvasView.addSubview(svgkFastImageView);
        resizeSubviewToFitSuperview(superview: svgkFastImageCanvasView, subview: svgkFastImageView)
        
        let svgkLayeredImageView = SVGKLayeredImageView(SVGKImage: svgkImage);
        svgkLayeredImageCanvasView.addSubview(svgkLayeredImageView);
        resizeSubviewToFitSuperview(superview: svgkLayeredImageCanvasView, subview: svgkLayeredImageView)
    }
    
    func resizeSubviewToFitSuperview(superview superview:UIView, subview:UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        superview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subview]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["subview": subview]))
        superview.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[subview]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["subview": subview]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

