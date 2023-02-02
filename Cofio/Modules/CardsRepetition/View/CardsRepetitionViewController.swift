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
        pc.currentPageIndicatorTintColor = .systemPink
        pc.pageIndicatorTintColor = .pageControlColor
        pc.isUserInteractionEnabled = false
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    private lazy var cardsCollectionView: UICollectionView = {
        let cardsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cardsCollectionView.backgroundColor = .white
        cardsCollectionView.register(RepetitionCardsCell.self, forCellWithReuseIdentifier: "repetitionCardsCell")
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
        // TODO: refactore method
        view.backgroundColor = .white
        learnedButton.isEnabled = false
        moreTimeButton.isEnabled = false
        pageControl.numberOfPages = output.getCardsCount()
        
        if output.getCardsCount() != 1 {
            view.addSubview(buttonStackView)
            NSLayoutConstraint.activate([
                buttonStackView.heightAnchor.constraint(equalToConstant: 50),
                buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
                buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16)
            ])
        } else {
            view.addSubview(learnedButton)
            NSLayoutConstraint.activate([
                learnedButton.heightAnchor.constraint(equalToConstant: 50),
                learnedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
                learnedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                learnedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16)
            ])
        }
        
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.bottomAnchor.constraint(equalTo: learnedButton.topAnchor, constant: -20),
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
        // TODO: refactore method
        let nextIndex = min(pageControl.currentPage + 1, output.getCardsCount() - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        cardsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        pageControl.numberOfPages = output.getCardsCount()
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
        let nextIndex = min(pageControl.currentPage + 1, output.getCardsCount() - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        let idexPrev = IndexPath(item: pageControl.currentPage, section: 0)
        pageControl.currentPage = nextIndex
        cardsCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        
        learnedButton.isEnabled = false
        learnedButton.backgroundColor = .lightGreen
        moreTimeButton.isEnabled = false
        moreTimeButton.backgroundColor = .lightRed
        
        output.viewDidTapMoreTime(indexPath: idexPrev)
        pageControl.numberOfPages = output.getCardsCount()
    }
}


// MARK: - CardsRepetitionViewInput

extension CardsRepetitionViewController: CardsRepetitionViewInput {
    
    func updateData(with data: [RepetitionCardCellDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, RepetitionCardCellDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        collectionViewDataSource.apply(snapshot)
    }
    
    func updateNavBarTitle(navBarTitle: String) {
        title = navBarTitle
    }
}

// MARK: - UICollectionViewDelegate

extension CardsRepetitionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.viewDidTapRow(indexPath: indexPath)
        
        if indexPath.item == output.getCardsCount() - 1 {
            moreTimeButton.isEnabled = false
            moreTimeButton.backgroundColor = .lightRed
        } else {
            moreTimeButton.isEnabled = true
            moreTimeButton.backgroundColor = .darkRed
        }
        
        learnedButton.isEnabled = true
        learnedButton.backgroundColor = .darkGreen
    }
}
