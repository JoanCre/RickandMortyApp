import UIKit

final class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: HomeViewModelProtocol!
    lazy var searchBar: UISearchBar = UISearchBar()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupUI()
        viewModel?.viewDidLoad()
    }

    func setupBindings() {
        viewModel.listCharactersUpdated = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.errorHasOcurred = { error in
            print(error)
        }
    }

    // MARK: - Functions
    func setupUI() {
        configure(tableView)
        configureSearchBar()
    }
}

    // MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func configure(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CharacterCell.identifier, bundle: nil),
                           forCellReuseIdentifier: CharacterCell.identifier)
        tableView.layer.cornerRadius = 2.0
        tableView.layer.masksToBounds = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.viewModel.loadMoreCharacter(currentItem: indexPath.row)
        if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier) as? CharacterCell {
            cell.character = viewModel.characters[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

    // MARK: - SearchBar
extension HomeViewController: UISearchBarDelegate {
    func configureSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.backgroundImage = UIImage()
        searchBar.returnKeyType = .search
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(this: searchText)
    }
}
