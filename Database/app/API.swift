//  This file was automatically generated and should not be edited.

import AWSAppSync

public final class DeleteObjectMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteObject($objectId: String!) {\n  deleteObject(objectId: $objectId) {\n    __typename\n    message\n    success\n  }\n}"

  public var objectId: String

  public init(objectId: String) {
    self.objectId = objectId
  }

  public var variables: GraphQLMap? {
    return ["objectId": objectId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteObject", arguments: ["objectId": GraphQLVariable("objectId")], type: .nonNull(.object(DeleteObject.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteObject: DeleteObject) {
      self.init(snapshot: ["__typename": "Mutation", "deleteObject": deleteObject.snapshot])
    }

    public var deleteObject: DeleteObject {
      get {
        return DeleteObject(snapshot: snapshot["deleteObject"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "deleteObject")
      }
    }

    public struct DeleteObject: GraphQLSelectionSet {
      public static let possibleTypes = ["MutationResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("message", type: .nonNull(.scalar(String.self))),
        GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(message: String, success: Bool) {
        self.init(snapshot: ["__typename": "MutationResponse", "message": message, "success": success])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: String {
        get {
          return snapshot["message"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "message")
        }
      }

      public var success: Bool {
        get {
          return snapshot["success"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}

public final class InsertObjectMutation: GraphQLMutation {
  public static let operationString =
    "mutation InsertObject($boolean: Boolean!, $category: String!, $createdAt: String!, $number: Int!, $objectId: String!, $text: String!) {\n  insertObject(boolean: $boolean, category: $category, createdAt: $createdAt, number: $number, objectId: $objectId, text: $text) {\n    __typename\n    message\n    success\n  }\n}"

  public var boolean: Bool
  public var category: String
  public var createdAt: String
  public var number: Int
  public var objectId: String
  public var text: String

  public init(boolean: Bool, category: String, createdAt: String, number: Int, objectId: String, text: String) {
    self.boolean = boolean
    self.category = category
    self.createdAt = createdAt
    self.number = number
    self.objectId = objectId
    self.text = text
  }

  public var variables: GraphQLMap? {
    return ["boolean": boolean, "category": category, "createdAt": createdAt, "number": number, "objectId": objectId, "text": text]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("insertObject", arguments: ["boolean": GraphQLVariable("boolean"), "category": GraphQLVariable("category"), "createdAt": GraphQLVariable("createdAt"), "number": GraphQLVariable("number"), "objectId": GraphQLVariable("objectId"), "text": GraphQLVariable("text")], type: .nonNull(.object(InsertObject.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(insertObject: InsertObject) {
      self.init(snapshot: ["__typename": "Mutation", "insertObject": insertObject.snapshot])
    }

    public var insertObject: InsertObject {
      get {
        return InsertObject(snapshot: snapshot["insertObject"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "insertObject")
      }
    }

    public struct InsertObject: GraphQLSelectionSet {
      public static let possibleTypes = ["MutationResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("message", type: .nonNull(.scalar(String.self))),
        GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(message: String, success: Bool) {
        self.init(snapshot: ["__typename": "MutationResponse", "message": message, "success": success])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: String {
        get {
          return snapshot["message"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "message")
        }
      }

      public var success: Bool {
        get {
          return snapshot["success"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}

public final class UpdateObjectMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateObject($boolean: Boolean!, $number: Int!, $objectId: String!, $text: String!, $updatedAt: String!) {\n  updateObject(boolean: $boolean, number: $number, objectId: $objectId, text: $text, updatedAt: $updatedAt) {\n    __typename\n    message\n    success\n  }\n}"

  public var boolean: Bool
  public var number: Int
  public var objectId: String
  public var text: String
  public var updatedAt: String

  public init(boolean: Bool, number: Int, objectId: String, text: String, updatedAt: String) {
    self.boolean = boolean
    self.number = number
    self.objectId = objectId
    self.text = text
    self.updatedAt = updatedAt
  }

  public var variables: GraphQLMap? {
    return ["boolean": boolean, "number": number, "objectId": objectId, "text": text, "updatedAt": updatedAt]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateObject", arguments: ["boolean": GraphQLVariable("boolean"), "number": GraphQLVariable("number"), "objectId": GraphQLVariable("objectId"), "text": GraphQLVariable("text"), "updatedAt": GraphQLVariable("updatedAt")], type: .nonNull(.object(UpdateObject.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateObject: UpdateObject) {
      self.init(snapshot: ["__typename": "Mutation", "updateObject": updateObject.snapshot])
    }

    public var updateObject: UpdateObject {
      get {
        return UpdateObject(snapshot: snapshot["updateObject"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "updateObject")
      }
    }

    public struct UpdateObject: GraphQLSelectionSet {
      public static let possibleTypes = ["MutationResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("message", type: .nonNull(.scalar(String.self))),
        GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(message: String, success: Bool) {
        self.init(snapshot: ["__typename": "MutationResponse", "message": message, "success": success])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: String {
        get {
          return snapshot["message"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "message")
        }
      }

      public var success: Bool {
        get {
          return snapshot["success"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}

public final class ObjectsQuery: GraphQLQuery {
  public static let operationString =
    "query Objects {\n  objects {\n    __typename\n    boolean\n    category\n    createdAt\n    number\n    objectId\n    text\n    updatedAt\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("objects", type: .nonNull(.list(.object(Object.selections)))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(objects: [Object?]) {
      self.init(snapshot: ["__typename": "Query", "objects": objects.map { $0.flatMap { $0.snapshot } }])
    }

    public var objects: [Object?] {
      get {
        return (snapshot["objects"] as! [Snapshot?]).map { $0.flatMap { Object(snapshot: $0) } }
      }
      set {
        snapshot.updateValue(newValue.map { $0.flatMap { $0.snapshot } }, forKey: "objects")
      }
    }

    public struct Object: GraphQLSelectionSet {
      public static let possibleTypes = ["Object"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("boolean", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("category", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("number", type: .nonNull(.scalar(Int.self))),
        GraphQLField("objectId", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(boolean: Bool, category: String, createdAt: String, number: Int, objectId: String, text: String, updatedAt: String? = nil) {
        self.init(snapshot: ["__typename": "Object", "boolean": boolean, "category": category, "createdAt": createdAt, "number": number, "objectId": objectId, "text": text, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var boolean: Bool {
        get {
          return snapshot["boolean"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "boolean")
        }
      }

      public var category: String {
        get {
          return snapshot["category"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "category")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var number: Int {
        get {
          return snapshot["number"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "number")
        }
      }

      public var objectId: String {
        get {
          return snapshot["objectId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "objectId")
        }
      }

      public var text: String {
        get {
          return snapshot["text"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class ObjectsByCategoriesQuery: GraphQLQuery {
  public static let operationString =
    "query ObjectsByCategories($category: [String]) {\n  objectsByCategories(category: $category) {\n    __typename\n    boolean\n    category\n    createdAt\n    number\n    objectId\n    text\n    updatedAt\n  }\n}"

  public var category: [String?]?

  public init(category: [String?]? = nil) {
    self.category = category
  }

  public var variables: GraphQLMap? {
    return ["category": category]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("objectsByCategories", arguments: ["category": GraphQLVariable("category")], type: .list(.object(ObjectsByCategory.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(objectsByCategories: [ObjectsByCategory?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "objectsByCategories": objectsByCategories.flatMap { $0.map { $0.flatMap { $0.snapshot } } }])
    }

    public var objectsByCategories: [ObjectsByCategory?]? {
      get {
        return (snapshot["objectsByCategories"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { ObjectsByCategory(snapshot: $0) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "objectsByCategories")
      }
    }

    public struct ObjectsByCategory: GraphQLSelectionSet {
      public static let possibleTypes = ["Object"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("boolean", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("category", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("number", type: .nonNull(.scalar(Int.self))),
        GraphQLField("objectId", type: .nonNull(.scalar(String.self))),
        GraphQLField("text", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(boolean: Bool, category: String, createdAt: String, number: Int, objectId: String, text: String, updatedAt: String? = nil) {
        self.init(snapshot: ["__typename": "Object", "boolean": boolean, "category": category, "createdAt": createdAt, "number": number, "objectId": objectId, "text": text, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var boolean: Bool {
        get {
          return snapshot["boolean"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "boolean")
        }
      }

      public var category: String {
        get {
          return snapshot["category"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "category")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var number: Int {
        get {
          return snapshot["number"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "number")
        }
      }

      public var objectId: String {
        get {
          return snapshot["objectId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "objectId")
        }
      }

      public var text: String {
        get {
          return snapshot["text"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "text")
        }
      }

      public var updatedAt: String? {
        get {
          return snapshot["updatedAt"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class ObjectsSubscriptionSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription ObjectsSubscription {\n  objectsSubscription {\n    __typename\n    message\n    success\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("objectsSubscription", type: .object(ObjectsSubscription.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(objectsSubscription: ObjectsSubscription? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "objectsSubscription": objectsSubscription.flatMap { $0.snapshot }])
    }

    public var objectsSubscription: ObjectsSubscription? {
      get {
        return (snapshot["objectsSubscription"] as? Snapshot).flatMap { ObjectsSubscription(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "objectsSubscription")
      }
    }

    public struct ObjectsSubscription: GraphQLSelectionSet {
      public static let possibleTypes = ["MutationResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("message", type: .nonNull(.scalar(String.self))),
        GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(message: String, success: Bool) {
        self.init(snapshot: ["__typename": "MutationResponse", "message": message, "success": success])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: String {
        get {
          return snapshot["message"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "message")
        }
      }

      public var success: Bool {
        get {
          return snapshot["success"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}