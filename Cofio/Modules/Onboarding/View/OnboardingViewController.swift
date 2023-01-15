//
//  OnboardingViewController.swift
//  Cofio
//
//  Created by Владислав Сизонов on 15.01.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: Private properties
    
    private let output: OnboardingViewOutput
    private let dataSource: OnboardingViewDataSourceProtocol
    
    private let mainButton: UIButton = {
        let mainButton = UIButton()
        mainButton.setTitle("onboarding_module_button_title"~, for: .normal)
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        mainButton.layer.cornerRadius = 8
        mainButton.backgroundColor = .lightGray
        mainButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        return mainButton
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .systemPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pc.isUserInteractionEnabled = false
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    private lazy var onboardingCollectionView: UICollectionView = {
        let cardsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cardsCollectionView.backgroundColor = .white
        cardsCollectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: "onboardingCell")
        cardsCollectionView.collectionViewLayout = UICollectionViewLayout.createRepetitionCardsLayout()
        cardsCollectionView.isScrollEnabled = false
        cardsCollectionView.showsHorizontalScrollIndicator = false
        cardsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cardsCollectionView.isPagingEnabled = true
        return cardsCollectionView
    }()
    
    private lazy var collectionViewDataSource = dataSource.makeDataSource(for: onboardingCollectionView)

    // MARK: Lifecycle
    
    init(output: OnboardingViewOutput,
         dataSource: OnboardingViewDataSourceProtocol) {
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
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        pageControl.numberOfPages = output.getPagesCount()
        
        view.addSubview(mainButton)
        NSLayoutConstraint.activate([
            mainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.widthAnchor.constraint(equalToConstant: 250),
            mainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -20),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16)
        ])
        
        view.addSubview(onboardingCollectionView)
        NSLayoutConstraint.activate([
            onboardingCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingCollectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10)
        ])
    }
    
    @objc func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, output.getPagesCount() - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        pageControl.numberOfPages = output.getPagesCount()
        output.viewDidTapButton(indexPath: indexPath)
    }
}

// MARK: - OnboardingViewInput

extension OnboardingViewController: OnboardingViewInput {
    
    func updateData(with data: [OnboardingCellDataModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, OnboardingCellDataModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(data, toSection: 0)
        collectionViewDataSource.apply(snapshot)
    }
    
    func updateMainButtonTitle(title: String) {
        mainButton.setTitle(title, for: .normal)
    }
}

//extension OnboardingViewController: UICollectionViewDelegate {
//
//}
