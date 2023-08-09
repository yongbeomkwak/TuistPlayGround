import Foundation
import ProjectDescription

public enum ProjectDeployTarget: String {
  case dev = "DEV"
  case test = "TEST"
  case prod = "PROD"
  case stage = "STAGE"
  
  public var configurationName: ConfigurationName {
    ConfigurationName.configuration(self.rawValue)
  }
}
