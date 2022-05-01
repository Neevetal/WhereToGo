//
//  TableViewCell+Extensions.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 08.01.2022.
//

import UIKit

public extension UITableViewCell {

    var tableView: UITableView? {
        get {
            var table: UIView? = superview
            while !(table is UITableView) && table != nil {
                let newSuperview = table?.superview
                table = newSuperview
            }
            return table as? UITableView
        }
    }

    var indexPath: IndexPath? {
        return tableView?.indexPath(for: self)
    }

    static func createForTableView(_ tableView: UITableView) -> UITableViewCell? {
        let className = String(describing:self)

        var cell: UITableViewCell? = nil

        cell = tableView.dequeueReusableCell(withIdentifier: className)

        if cell == nil {
            cell = Bundle.main.loadNibNamed(className, owner: self, options: nil)?.first as? UITableViewCell
            let cellNib = UINib(nibName: className, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: className)
        }
        return cell
    }
}
