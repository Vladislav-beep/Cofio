//
//  CardsRepetitionViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 25.08.2022.
//

import UIKit

final class CardsRepetitionViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: CardsRepetitionViewOutput
    private let dataSource: CardsCollectionViewDataSourceProtocol
    
    private let learnedButton: UIButton = {
        let learnedButton = UIButton()
        learnedButton.setTitle("cards_repetition_module_learned_button"~, for: .normal)
        learnedButton.layer.cornerRadius = 8
        learnedButton.backgroundColor = .lightGreen
        learnedButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        learnedButton.translatesAutoresizingMaskIntoConstraints = false
        return learnedButton
    }()
    
    private let moreTimeButton: UIButton = {
        let moreTimeButton = UIButton()
        moreTimeButton.setTitle("cards_repetition_module_more_button"~, for: .normal)
        moreTimeButton.layer.cornerRadius = 8
        moreTimeButton.backgroundColor = .lightRed
        moreTimeButton.addTarget(self, action: #selector(handleMoreTime), for: .touchUpInside)
        moreTimeButton.translatesAutoresizingMaskIntoConstraints = false
        return moreTimeButton
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [moreTimeButton, learnedButton],
                                axis: .horizontal,
                                spacing: 20,
                                distribution: .fillEqually)
        return stack
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = output.getCardsCount()
        pc.currentPageIndicatorTintColor = .systemPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    private lazy var cardsCollectionView: UICollectionView = {
        let cardsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cardsCollectionView.backgroundColor = .white
        cardsCollectionView.register(RepetitionCardsCell.self, forCellWithReuseIdentifier: "repetitionCardsCell")
        cardsCollectionView.register(RepetitionEmptyCardsCell.self, forCellWithReuseIdentifier: "repetitionEmptyCardsCell")
        cardsCollectionView.collectionViewLayout = UICollectionViewLayout.createRepetitionCardsLayout()
        cardsCollectionView.isScrollEnabled = false
        cardsCollectionView.showsHorizontalScrollIndicator = false
        cardsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cardsCollectionView.isPagingEnabled = true
        return cardsCollectionView
    }()
    
    private lazy var collectionViewDataSource = dataSource.makeDataSource(for: cardsCollectionView)

    // MARK: Lifecycle
    
    init(output: CardsRepetitionViewOutput,
         dataSource: CardsCollectionViewDataSourceProtocol) {
        self.output = output
        self.dataSource = dataSource
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewDidLoad()
        setupViews()
        cardsCollectionView.delegate = self
    }
    
    // MARK: Private
    
    private func setupViews() {
        view.backgroundColor = .white
        learnedButton.isEnabled = false
        moreTimeButton.isEnabled = false
        
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16)
        ])
        
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -20),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16)
        ])
        
        view.addSubview(cardsCollectionView)
        NSLayoutConstraint.activate([
            cardsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            cardsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            cardsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -8),
            cardsCollectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -5)
        ])
    }
    
    private func handleTap() {
        let nextIndex = min(pageControl.currentPage + 1, output.getCardsCount() - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        cardsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        learnedButton.isEnabled = false
        learnedButton.backgroundColor = .lightGreen
        moreTimeButton.isEnabled = false
        moreTimeButton.backgroundColor = .lightRed
        
        output.viewDidTapButton(indexPath: indexPath)
    }
    
    // MARK: Actions
    
    @objc private func handleNext() {
        handleTap()
    }
    
    @objc private func handleMoreTime() {
        handleTap()
    }
}


// MARK: - CardsRepetitionViewInput

extension CardsRepetitionViewController: CardsRepetitionViewInput {
    
    func updateData(with data: [RepetitionCardCellsDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, RepetitionCardCellsDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        collectionViewDataSource.apply(snapshot)
        
        if data.first == .empty(RepetitionCardEmptyCellDataModel(title: "cards_repetition_module_empty_cell_title"~)) {
            buttonStackView.isHidden = true
            pageControl.isHidden = true
        }
    }
    
    func updateNavBarTitle(navBarTitle: String) {
        title = navBarTitle
    }
}

// MARK: - UICollectionViewDelegate

extension CardsRepetitionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = collectionViewDataSource.itemIdentifier(for: indexPath) else { return }
        switch item {
        case .card:
            output.viewDidTapRow(indexPath: indexPath)
            learnedButton.isEnabled = true
            learnedButton.backgroundColor = .darkGreen
            moreTimeButton.isEnabled = true
            moreTimeButton.backgroundColor = .darkRed
            
        case .empty:
            break
        }
    }
}
