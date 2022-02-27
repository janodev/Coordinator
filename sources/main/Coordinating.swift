import os
import UIKit

private let log = Logger(subsystem: "dev.jano", category: "coordinator")

@MainActor
public protocol Coordinating: AnyObject
{
    var parent: Coordinating? { get }
    var children: [Coordinating] { get set }
    func add(_ coordinator: Coordinating)
    func remove(_ coordinator: Coordinating)
    func start()
    func finish()
}

public extension Coordinating
{   
    func finish() {
        DispatchQueue.main.async {
            log.debug("Coordinator \(self.description) is removing itself from parent \(self.parent?.description ?? "nil")")
            self.parent?.remove(self)
        }
    }

    func add(_ child: Coordinating) {
        DispatchQueue.main.async {
            log.debug("Coordinator \(self.description) is adding a child:  \(child.description)")
            self.children.append(child)
            child.start()
        }
    }
    
    func remove(_ child: Coordinating) {
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
