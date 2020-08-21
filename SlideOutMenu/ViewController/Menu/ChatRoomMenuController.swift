//
//  ChatRoomMenuController.swift
//  SlideOutMenu
//
//  Created by Vinh Le on 8/17/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class ChatRoomMenuController: UITableViewController {
    private let cellId = "cellId"
    private let data = [
        ["generals", "introductions"],
        ["jobs"],
        ["Ronaldo", "Federer", "Nadal"]
    ]
    private var filteredData = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.filteredData = self.data
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.2078431373, blue: 0.2862745098, alpha: 1)
    }
    
    fileprivate class SectionHeaderLabel: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let text = section == 0 ? "UNREADS" : section == 1 ? "CHANNELS" : "DIRECT MESSAGES"
        let label = SectionHeaderLabel()
        label.text = text
        label.textColor = #colorLiteral(red: 0.4745098039, green: 0.4078431373, blue: 0.4666666667, alpha: 1)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: cellId)
        let text = filteredData[indexPath.section][indexPath.row]
        let firstText = AttributedText(text: "#  ", fontSize: 18, fontWeight: .regular, color: #colorLiteral(red: 0.4745098039, green: 0.4078431373, blue: 0.4666666667, alpha: 1))
        let secondText = AttributedText(text: text, fontSize: 18, fontWeight: .bold, color: .white)
        cell.textLabel?.appendAttributedText(firstText: firstText, secondText: secondText)
        cell.backgroundColor = .clear
        return cell
    }
}

//
// Filtering logics
//
extension ChatRoomMenuController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredData = data
        } else {
            filteredData = data.map({ (group) -> [String] in
                return group.filter
                    {$0.lowercased().contains(searchText.lowercased())} // $0 is shorthand for first argument in this closure
            })
        }
        
        tableView.reloadData()
    }
}
