import UIKit
import PlaygroundSupport

class CustomCell: UITableViewCell {
    
    var titleLabel: UILabel = {
        let l = UILabel(frame: .zero)
        l.textColor = .black
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutUI() {
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.set(.leading(self.contentView,8), .top(self.contentView,8), .bottom(self.contentView,8),.trailing(self.contentView, 8), .height(20))
    }

    func setData(text: String) {
        self.titleLabel.text = text
    }
    
}



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data model: These strings will be the data for the table view cells
    let restaurants: [String] = ["Pind Balluchi", "Pizza Hut", "Dominoes", "Artusi", "Burger Singh"]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    var tableView: UITableView = {
       let tv = UITableView(frame: .zero)
       return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutUI()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // (optional) include this line if you want to remove the extra empty cell divider lines
        // self.tableView.tableFooterView = UIView()
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func layoutUI() {
        self.view.addSubview(self.tableView)
        self.tableView.set(.fillSuperView(self.view))
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell: CustomCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! CustomCell
        
        // set the text from the data model
        cell.setData(text: self.restaurants[indexPath.row])
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CustomCell
        print("You tapped cell number \(indexPath.row) of title \(String(describing: cell.titleLabel.text!))")
    }
}

let vc = ViewController()
PlaygroundPage.current.liveView = vc.view


