//
//  ViewController.swift
//  Albertsons Assignments
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import UIKit
import ReactiveKit
import MBProgressHUD

/// `UIViewController` show  the option to search  acronyms for meanings.
class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    /// UITextField for acronymsTextField
    @IBOutlet weak var acronymsTextField: UITextField!
    
    /// UIButton to search acronyms
    @IBOutlet var searchButton: UIButton!
    
    //MARK: - Instance variables
    
    /// Refers to view model for HomeViewController
    lazy var viewModel: HomeViewModel = {
        return HomeViewModel()
    }()
    
    // MARK: - ViewController LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextField()
        bindSearchButtonValidation()
    }
    
    // MARK: - IBAction methods
    
    /// Called when users tap the Search button
    /// - Parameter sender: represents UIButton
    @IBAction func onSearchButtonAction(_ sender: UIButton) {
        self.acronymsTextField.resignFirstResponder()
        MBProgressHUD.showAdded(to: self.view, animated: true)
        self.viewModel.getAcronymsMeaningsForSearchString { (response) in
            if (response.count > 0) {
                DispatchQueue.main.async{
                    self.performSegue(withIdentifier: HomeConstant.SegueID.segueAcronymsDetail, sender: nil)
                }
            }else{
                AlbertsonsAlert.show(title: HomeConstant.AlertDetail.title, message: HomeConstant.AlertDetail.message, buttons: [HomeConstant.AlertDetail.buttonTitle], completion: nil)
            }
            self.hideIndicator()
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let homeVC = segue.destination as? AcronymsDetailViewController {
            guard let acronyms = viewModel.homeViewModel.first?.sf, let acronymsDetail = viewModel.homeViewModel.first?.lfs else {
                return
            }
            homeVC.viewModel.searchedAcronym = acronyms
            homeVC.viewModel.acronymResults.insert(contentsOf: acronymsDetail , at: 0)
        }
    }
}

// MARK: - extension to bind acronym search Observable string to Textfield
extension HomeViewController {
    
    /// Method for bind userName data and validate username field text.
    private func bindTextField() {
        self.viewModel.acronyms.bidirectionalBind(to: self.acronymsTextField.reactive.text)
    }
    
    /// Handle Search button validation using `Bond`.
    private func bindSearchButtonValidation() {
        combineLatest(self.acronymsTextField.reactive.text, self.acronymsTextField.reactive.text) { acronymsString, acronymsStringValue in
            return !(acronymsString!.isEmpty) && !(acronymsStringValue!.isEmpty)
        }
        .bind(to: self.searchButton.reactive.isEnabled)
    }
}

// MARK: - extension to hide Indicator
extension HomeViewController {
    func hideIndicator() {
        DispatchQueue.main.async{
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
