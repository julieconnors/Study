//
//  ViewController.swift
//  mvvmCollection
//
//  Created by Luat on 9/2/21.
//

import UIKit

class ViewModel {
    var dataArray: [String]? {
        didSet {
            updateUIClosure?()
        }
    }
    
    var numItems: Int {
        dataArray?.count ?? 0
    }
    
    func fetchData() {
        dataArray = [
            "test1",
            "test2",
            "test3",
            "test4",
            "test5",
            "test6",
            "test7",
        ]
    }
    
    func getCellData(at row: Int) -> String {
        return dataArray?[row] ?? "no data"
    }
    
    func addItem(str: String) {
        dataArray?.append(str)
    }
    
    func bind(completion: @escaping () -> Void) {
        updateUIClosure = completion
    }
    
    var updateUIClosure: (() -> Void)?
    
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func addItemTapped(_ sender: Any) {
        viewModel.addItem(str: "new item")
        print("adding item")
    }
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
        viewModel.fetchData()
        viewModel.bind(completion: {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }

    func configureCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: MyCell.identifier, bundle: nil), forCellWithReuseIdentifier: MyCell.identifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.identifier, for: indexPath) as? MyCell else {
            fatalError()
        }
        
        cell.backgroundColor = .red
        cell.topLabel.text = viewModel.getCellData(at: indexPath.row)
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.row % 4 {
        case 0:
            return CGSize(width: 310, height: 50)
        default:
            return CGSize(width: 90, height: 100)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
