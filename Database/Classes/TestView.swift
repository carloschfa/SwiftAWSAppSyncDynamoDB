//
// Copyright (c) 2018 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import AWSAppSync

//-------------------------------------------------------------------------------------------------------------------------------------------------
class TestView: UIViewController {

	@IBOutlet var tableView: UITableView!

	private var listener: Cancellable?

	private var filter: [String] = ["Category1", "Category2", "Categroy3"]
	private var categories: [String] = ["Category1", "Category2", "Categroy3"]

	private var objectIds: [String] = []
	private var objects: [String: Any] = [:]

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {

		super.viewDidLoad()
		title = "Test"

		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(actionFilter))

		let buttonAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(actionAdd))
		let buttonFetch = UIBarButtonItem(title: "Fetch", style: .plain, target: self, action: #selector(actionFetch))
		navigationItem.rightBarButtonItems = [buttonAdd, buttonFetch]

		tableView.tableFooterView = UIView()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
		createObserver()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillDisappear(_ animated: Bool) {

		super.viewWillDisappear(animated)
		removeObserver()
	}

	// MARK: - Backend methods (observer)
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func createObserver() {
    guard listener == nil else { return }
    do {
      listener = try appSyncClient.subscribe(subscription: ObjectsSubscriptionSubscription()) { result, transaction, error in
        if let error = error {
          NSLog(error.localizedDescription)
        } else {
          switch result {
          case .some(let graphQLResult):
            guard let response = graphQLResult.data?.objectsSubscription else { return }
            NSLog(response.message)
            if response.success {
              self.fetchObjects()
            }
          default:
            NSLog("No changes at all.")
          }
        }
      }
    } catch {
      NSLog(error.localizedDescription)
    }
    fetchObjects()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func addObject(_ object: [String: Any]) {

		if let objectId = object["objectId"] as? String {
			if (objectIds.contains(objectId) == false) {
				objectIds.insert(objectId, at: 0)
			}
			objects[objectId] = object
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func removeObserver() {

		listener?.cancel()
		listener = nil
	}

	// MARK: - Backend methods (fetch)
	//---------------------------------------------------------------------------------------------------------------------------------------------
  func fetchObjects() {
    
    let query = ObjectsByCategoriesQuery(category: filter)
    
    appSyncClient.fetch(query: query, cachePolicy: .fetchIgnoringCacheData) { result, error in
      if let error = error {
        NSLog(error.localizedDescription)
      } else {
        switch result {
        case .some(let graphQLResult):
          guard let objects = graphQLResult.data?.objectsByCategories else { return }
          self.objectIds.removeAll()
          self.objects.removeAll()
          
          let filterObjects = objects.filter { self.filter.contains(($0?.category)!) }
          
          for object in filterObjects {
            if let object = object {
              self.objects[object.objectId] = object.jsonObject
              self.objectIds.append(object.objectId)
            }
          }
          DispatchQueue.main.async {
            self.tableView.reloadData()
          }
        default:
          NSLog("No data returned.")
        }
      }
    }
  }

	// MARK: - Backend methods (create, update)
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func createObject(_ category: String) {

    let insertObject = InsertObjectMutation(boolean: randomBool(),
                                            category: category,
                                            createdAt: Date().string(),
                                            number: randomInt(),
                                            objectId: UUID().uuidString,
                                            text: randomText())
    
    
    appSyncClient.perform(mutation: insertObject) { result, error in
      if let error = error {
        NSLog(error.localizedDescription)
      } else  {
        switch result {
        case .some(let graphQLResult):
          guard let message = graphQLResult.data?.insertObject.message else { return }
          NSLog(message)
        default:
          NSLog("Data couldn't be inserted.")
        }
      }
    }
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func updateObject(_ object: [String: Any]) {
    
    guard
      let objectId = object["objectId"] as? String
      else { return }
    
    var object = object
    
    object["text"] = randomText()
    object["number"] = randomInt()
    object["boolean"] = randomBool()
    object["updatedAt"] = Date().string()
    
    let updateObject = UpdateObjectMutation(boolean: object["boolean"] as! Bool,
                                            number: object["number"] as! Int,
                                            objectId: objectId,
                                            text: object["text"] as! String,
                                            updatedAt: object["updatedAt"] as! String)
    
    appSyncClient.perform(mutation: updateObject) { result, error in
      if let error = error {
        NSLog(error.localizedDescription)
      } else {
        switch result {
        case .some(let graphQLResult):
          guard
            let updateObject = graphQLResult.data?.updateObject,
            updateObject.success else { return }
          NSLog(updateObject.message)
        default:
          NSLog("Data couldn't not be updated.")
        }
      }
    }
    
    
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFilter() {

		let filterView = FilterView(filter: filter)
		filterView.delegate = self
		let navController = UINavigationController(rootViewController: filterView)
		present(navController, animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionFetch() {

		fetchObjects()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionAdd() {

		let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

		for category in categories {
			alert.addAction(UIAlertAction(title: category, style: .default, handler: { action in
				self.createObject(category)
			}))
		}

		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

		present(alert, animated: true)
	}

	// MARK: - Helper methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func randomText() -> String {

		return String((0..<20).map { _ in "abcde".randomElement()! })
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func randomInt() -> Int {

		return Int.random(in: 1000..<5000)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func randomBool() -> Bool {

		return Bool.random()
	}
}

// MARK: - FilterDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension TestView: FilterDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func didSelectFilter(filter: [String]) {

		self.filter = filter

		objectIds.removeAll()
		objects.removeAll()

		removeObserver()
		createObserver()
	}
}

// MARK: - UITableViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension TestView: UITableViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return objectIds.count
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell")
		if (cell == nil) { cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell") }

		let objectId = objectIds[indexPath.row]

		cell.textLabel?.text = objectId
		cell.textLabel?.font = UIFont.systemFont(ofSize: 13)

		cell.detailTextLabel?.text = ""
		cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)

		if let object = objects[objectId] as? [String: Any] {
			if let category = object["category"] as? String, let text = object["text"] as? String,
				let number = object["number"] as? Int, let boolean = object["boolean"] as? Bool {
				cell.detailTextLabel?.text = "\(category) - \(text) - \(number) - \(boolean)"
			}
		}

		return cell
	}
}

// MARK: - UITableViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension TestView: UITableViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: true)

		let objectId = objectIds[indexPath.row]

		if let object = objects[objectId] as? [String: Any] {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
				self.updateObject(object)
			}
		}
	}
}

extension Date {
  func string(format: String? = nil) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format ?? "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    return formatter.string(from: self)
  }
}
