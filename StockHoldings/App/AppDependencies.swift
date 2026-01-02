//
//  AppDependencies.swift

class AppDependencies {
    private let dataSource: HoldingsDataSource
    private let repository: HoldingsRepository
    private let getHoldingsUseCase: GetHoldingsUseCase
    private let getPortfolioSummaryUseCase: GetPortfolioSummaryUseCase
    
    init() {
        // Initialize with real API
        let networkService = URLSessionNetworkService(
            baseURL: "https://35dee773a9ec441e9f38d5fc249406ce.api.mockbin.io/"
        )
        self.dataSource = APIHoldingsDataSource(networkService: networkService)
        self.repository = HoldingsRepositoryImpl(dataSource: dataSource)
        self.getHoldingsUseCase = GetHoldingsUseCaseImpl(repository: repository)
        self.getPortfolioSummaryUseCase = GetPortfolioSummaryUseCaseImpl()
    }
    
    @MainActor func makeHoldingsViewModel() -> HoldingsViewModel {
        HoldingsViewModel(
            getHoldingsUseCase: getHoldingsUseCase,
            getPortfolioSummaryUseCase: getPortfolioSummaryUseCase
        )
    }
}
