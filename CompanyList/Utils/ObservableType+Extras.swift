//
//  ObservableType+Extras.swift
//  CompanyList
//
//

import Foundation
import RxSwift

extension ObservableType where Element: Collection {
    func mapMany<T>(_ transform: @escaping (Self.Element.Element) -> T) -> Observable<[T]> {
        return self.map { collection -> [T] in
            collection.map(transform)
        }
    }
}
