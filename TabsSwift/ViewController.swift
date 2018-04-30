//
//  LoNuestroController.swift
//  TelmexConmigoPlusPlus
//
//  Created by MAC2 on 27/03/18.
//  Copyright © 2018 MAC2. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.pages.index(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
            } else {
                return self.pages.first
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.index(of: viewController) {
            if viewControllerIndex == 0 {
                return self.pages.last
            } else {
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.index(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
                if viewControllerIndex == 0 {
                    lineaInferiorNegocio.isHidden = true
                    lineaInferiorHogar.isHidden = false
                } else {
                    lineaInferiorNegocio.isHidden = false
                    lineaInferiorHogar.isHidden = true
                }
            }
        }
    }
    
    let altoStatusBar = UIApplication.shared.statusBarFrame.height
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    
    let lineaInferiorHogar: UIView = UIView()
    let lineaInferiorNegocio: UIView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        
        
        //MARK: View Padre
        self.view.backgroundColor = UIColor.white
        self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        //Tab1
        let tab1 = Tab1()
        //Tab2
        let tab2 = Tab2()
        
        self.pages.append(tab1)
        self.pages.append(tab2)
        
        setViewControllers([pages[initialPage]], direction: .reverse, animated: true, completion: nil)
        
        
        
        self.pageControl.frame = CGRect(x: 0, y: altoStatusBar, width: self.view.frame.width, height: self.view.frame.height * 0.06)
        self.pageControl.backgroundColor = UIColor.white
        
        let vistaContenedora: UIButton = UIButton()
        vistaContenedora.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.pageControl.frame.height)
        vistaContenedora.backgroundColor = UIColor.white
        
        let botonTab1: UIButton = UIButton()
        botonTab1.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 0.3, height: pageControl.frame.height)
        botonTab1.setTitle("Tab1", for: .normal)
        botonTab1.setTitleColor(UIColor.black, for: .normal)
        botonTab1.contentHorizontalAlignment = .center
        botonTab1.contentVerticalAlignment = .center
        botonTab1.tag = 0
        botonTab1.addTarget(self,action: #selector(self.irATab1(sender:)),for: .touchUpInside)
        
        
        lineaInferiorHogar.frame = CGRect(x: 0, y: botonTab1.frame.height - 2, width: botonTab1.frame.width, height: 2)
        lineaInferiorHogar.backgroundColor = UIColor.blue
        botonTab1.addSubview(lineaInferiorHogar)
        
        let botonTab2: UIButton = UIButton()
        botonTab2.frame = CGRect(x: botonTab1.frame.width, y: 0, width: self.view.frame.width * 0.3, height: pageControl.frame.height)
        botonTab2.setTitle("Tab2", for: .normal)
        botonTab2.setTitleColor(UIColor.black, for: .normal)
        botonTab2.contentHorizontalAlignment = .center
        botonTab2.contentVerticalAlignment = .center
        botonTab2.tag = 1
        botonTab2.addTarget(self,action: #selector(self.irATab2(sender:)),for: .touchUpInside)
        
        
        lineaInferiorNegocio.frame = CGRect(x: 0, y: botonTab2.frame.height - 2, width: botonTab2.frame.width, height: 2)
        lineaInferiorNegocio.backgroundColor = UIColor.blue
        lineaInferiorNegocio.isHidden = true
        botonTab2.addSubview(lineaInferiorNegocio)
        
        vistaContenedora.addSubview(botonTab1)
        vistaContenedora.addSubview(botonTab2)
        self.pageControl.currentPage = 0
        pageControl.addSubview(vistaContenedora)
        self.view.addSubview(pageControl)
        
        
    }
    
    @objc func irATab2(sender: UIButton) {
        
        if(self.pageControl.currentPage == 0){
            setViewControllers([pages[1]],direction: .forward, animated: true, completion: nil)
            self.pageControl.currentPage = sender.tag
            lineaInferiorNegocio.isHidden = false
            lineaInferiorHogar.isHidden = true
        }
        
    }
    @objc func irATab1(sender: UIButton) {
        
        if(self.pageControl.currentPage == 0){
            setViewControllers([pages[0]],direction: .reverse, animated: true, completion: nil)
            self.pageControl.currentPage = sender.tag
            lineaInferiorNegocio.isHidden = true
            lineaInferiorHogar.isHidden = false
        }
        
    }
    
    
    //Descomentar esto y comentar el init de arriba si no estamos usando el viewContoller como el root de la aplicación
    
    /*
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    } */
    
    /*
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } */
    
    
    
    
}


