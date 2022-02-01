import os
import UIKit

private let log = Logger(subsystem: "dev.jano", category: "coordinator")

@MainActor
public protocol Coordinator: AnyObject
{
    var parent: Coordinator? { get }
    var children: [Coordinator] { get set }
    func add(_ coordinator: Coordinator)
    func remove(_ coordinator: Coordinator)
    func start()
    func finish()
}

public extension Coordinator
{   
    func finish() {
        DispatchQueue.main.async {
            log.debug("Coordinator \(self.description) is removing itself from parent \(self.parent?.description ?? "nil")")
            self.parent?.remove(self)
        }
    }

    func add(_ child: Coordinator) {
        DispatchQueue.main.async {
            log.debug("Coordinator \(self.description) is adding a child:  \(child.description)")
            self.children.append(child)
            child.start()
        }
    }
    
    func remove(_ child: Coordinator) {
        DispatchQueue.main.async {
            if let index = self.children.lastIndex(where: { $0 === child }) {
                self.children.remove(at: index)
            }
        }
    }

    var debugDescription: String {
        let name = "\"name\": \"\(type(of: self))\""
        let childrenDescription = children.isEmpty ? "" : children.map { $0.debugDescription }.joined(separator: ",")
        let parentDescription = parent.map { "\"parent\": { \($0.description) }" } ?? ""
        let json = [name, parentDescription, childrenDescription].filter { !$0.isEmpty }.joined(separator: ",")
        return "{ \(json) }"
    }

    var description: String {
        String(cString: class_getName(type(of: self))).components(separatedBy: ".").last ?? ""
    }
}
