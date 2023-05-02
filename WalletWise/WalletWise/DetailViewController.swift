
import UIKit
import ParseSwift
class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var userTest: UILabel!
    
    private let refreshControl = UIRefreshControl()
    private var company = Company()
    private var companies  = [Company]()
    private var transactions = [Transaction]() {
        didSet {
            // Reload table view data any time the posts variable gets updated.
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.rgb(red: 27, green: 29, blue: 47)
        logIn()
        //createCompanies()
        //createTransaction()
        //userTest.text = User.current?.username
        queryTransactions()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.refreshControl = refreshControl
        tableView.backgroundColor = UIColor.rgb(red: 27, green: 29, blue: 47)
        refreshControl.addTarget(self, action: #selector(onPullToRefresh), for: .valueChanged)
    }
    
    @objc private func onPullToRefresh() {
        refreshControl.beginRefreshing()
        queryTransactions { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
    
    private func queryPosts(completion: (() -> Void)? = nil){
        
    }
    
    func logIn(){
        User.login(username: "Jofe0320", password: "Jofe0320*") { [weak self] result in

            switch result {
            case .success(let user):
                print("✅ Successfully logged in as user: \(user)")

                // Post a notification that the user has successfully logged in.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                // Show an alert for any errors
                print(error)
            }
        }
    }
    func createCompanies(){
        var comp1 = Company()
        comp1.name = "McDonalds"
        let image1 = UIImage(named: "MCLogo")
        guard let mcImage = image1,
              // Create and compress image data (jpeg) from UIImage
              let imageData = mcImage.jpegData(compressionQuality: 0.1) else {
            return
        }
        let imageFile = ParseFile(name: "image.jpg", data: imageData)
        comp1.image = imageFile
        
        comp1.save { [weak self] result in

            // Switch to the main thread for any UI updates
            DispatchQueue.main.async {
                switch result {
                case .success(let comp1):
                    print("✅ Post Saved! \(comp1)")
                case .failure(let error):
                    print("error")
                }
            }
        }
        
        
        
//        comp2.save { [weak self] result in
//
//            // Switch to the main thread for any UI updates
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let post):
//                    print("✅ Post Saved! \(post)")
//                case .failure(let error):
//                    print("error")
//                }
//            }
//        }
//        comp3.save { [weak self] result in
//
//            // Switch to the main thread for any UI updates
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let post):
//                    print("✅ Post Saved! \(post)")
//                case .failure(let error):
//                    print("error")
//                }
//            }
//        }
        
    }
    
    private func queryTransactions(completion: (() -> Void)? = nil) {
     
        // https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/2%20-%20Finding%20Objects.xcplaygroundpage/Contents.swift#L66

        let query = Transaction.query()

        // Find and return posts that meet query criteria (async)
        query.find { [weak self] result in
            switch result {
            case .success(let posts):
                // Update the local posts property with fetched posts
                self?.transactions = posts
            case .failure(let error):
                print("Error")
            }
        
            
    
            completion?()
        }
    }
    
    private func queryCompanies(completion: (() -> Void)? = nil) {
     
        // https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/2%20-%20Finding%20Objects.xcplaygroundpage/Contents.swift#L66

        let query = Company.query()

        // Find and return posts that meet query criteria (async)
        query.find { [weak self] result in
            switch result {
            case .success(let posts):
                // Update the local posts property with fetched posts
                self?.companies = posts
            case .failure(let error):
                print("Error")
            }
        
            
    
            completion?()
        }
    }
    
    func createTransaction(){
        var transaction = Transaction()
        transaction.company = "McDonalds"
        transaction.type = "Payment"
        transaction.cost = 27.86
        transaction.date = Date()
        transaction.save { [weak self] result in

            // Switch to the main thread for any UI updates
            DispatchQueue.main.async {
                switch result {
                case .success(let Transaction):
                    print("✅ Transaction Saved! \(Transaction)")
                case .failure(let error):
                    print("error")
                }
            }
        }
    }
    


}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionCell else {
            return UITableViewCell()
        }
        queryCompanies()
        for comp in companies{
            if comp.name == transactions[indexPath.row].company, let img = comp.image{
                company = comp
                break
            }
        }
                    
        cell.configure(with: transactions[indexPath.row], with : company)
        return cell
    }
}

extension DetailViewController: UITableViewDelegate { }
