import UIKit

class ProductListController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.estimatedRowHeight = 70
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        view.addSubview(self.tableView)
    }
}

extension ProductListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = UIAlertController.init(title: "Ого!", message: "Это же ячейка под номером \(indexPath.row)", preferredStyle: .actionSheet)
        let ahuet = UIAlertAction(title: "Ахуеть", style: .default) { action in
            print("Тихо ахуеваю")
        }
        let cancel = UIAlertAction(title: "Ну нафиг", style: .cancel) { action in
            controller.dismiss(animated: true)
        }
        controller.addAction(ahuet)
        controller.addAction(cancel)
        present(controller, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = cell.accessoryType == .checkmark ? .none : .checkmark
    }
    
}

extension ProductListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.setupModel(ProductModel(title: "\(indexPath.row)", icon: "avatar"))
        cell.setup()
        
        return cell
    }
}
