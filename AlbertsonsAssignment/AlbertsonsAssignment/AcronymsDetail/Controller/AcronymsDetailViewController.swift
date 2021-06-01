//
//  AcronymsDetailViewController.swift
//  Albertsons Assignments
//
//  Created by Manish Singh on 01/06/21.
//  Copyright © 2021 Manish Singh. All rights reserved.
//

import UIKit

/// `UIViewController` show  searched  acronyms matching meanings.
class AcronymsDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    /// UITableView for acronymsDetailTableView
    @IBOutlet weak var acronymsDetailTableView: UITableView!
    
    //MARK: - Instance variables
    
    /// Refers to view model for LoginViewController
    lazy var viewModel: AcronymsDetailViewModel = {
        return AcronymsDetailViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableView()
        // Do any additional setup after loading the view.
    }
    
    func bindTableView() {
        viewModel.acronymResults.bind(to: acronymsDetailTableView) { dataSource, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: AcronymsDetailConstant.AcronymsDetailIdentifier.cellIdentifier, for: indexPath) as! AcronymsDetailViewCell
            let acronymsDetail = dataSource[indexPath.row]
            cell.acronymsMeaningLabel.text = acronymsDetail.lf
            return cell
        }
    }
}

// MARK: - AcronymsDetailViewController Extension for UITableViewDelegate
extension AcronymsDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.text = viewModel.searchedAcronym
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
