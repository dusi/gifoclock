//
//  ViewController.swift
//  GifOClock
//
//  Created by Jason Peebles on 2015-03-24.
//  Copyright (c) 2015 Themis Solutions Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let titleView = self.navigationItem.titleView
        titleView?.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), CGRectGetHeight(titleView!.frame))
        self.navigationItem.titleView = titleView
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
