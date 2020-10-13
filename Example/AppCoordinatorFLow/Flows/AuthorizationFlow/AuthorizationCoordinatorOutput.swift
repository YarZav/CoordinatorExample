//
//  AuthorizationCoordinatorOutput.swift
//  Example
//
//  Created by ZAVYALOV Yaroslav on 07.10.2020.
//

// MARK: - AuthorizationCoordinatorOutput
protocol AuthorizationCoordinatorOutput: AnyObject {
  var finishFlow: CompletionBlock? { get set }
}
