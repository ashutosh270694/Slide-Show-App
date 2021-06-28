// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photoResponse = try PhotoResponse(json)

import Foundation
import UIKit

//// MARK: - PhotoResponse
//struct PhotoResponse: Codable {
//    let photos: Photos
//    let extra: Extra
//    let stat: String
//}
//
//// MARK: PhotoResponse convenience initializers and mutators
//
//extension PhotoResponse {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(PhotoResponse.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        photos: Photos? = nil,
//        extra: Extra? = nil,
//        stat: String? = nil
//    ) -> PhotoResponse {
//        return PhotoResponse(
//            photos: photos ?? self.photos,
//            extra: extra ?? self.extra,
//            stat: stat ?? self.stat
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Extra
//struct Extra: Codable {
//    let exploreDate: String
//    let nextPreludeInterval: Int
//
//    enum CodingKeys: String, CodingKey {
//        case exploreDate = "explore_date"
//        case nextPreludeInterval = "next_prelude_interval"
//    }
//}
//
//// MARK: Extra convenience initializers and mutators
//
//extension Extra {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Extra.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        exploreDate: String? = nil,
//        nextPreludeInterval: Int? = nil
//    ) -> Extra {
//        return Extra(
//            exploreDate: exploreDate ?? self.exploreDate,
//            nextPreludeInterval: nextPreludeInterval ?? self.nextPreludeInterval
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Photos
//struct Photos: Codable {
//    let page, pages, perpage, total: Int
//    let photo: [Photo]
//}
//
//// MARK: Photos convenience initializers and mutators
//
//extension Photos {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Photos.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        page: Int? = nil,
//        pages: Int? = nil,
//        perpage: Int? = nil,
//        total: Int? = nil,
//        photo: [Photo]? = nil
//    ) -> Photos {
//        return Photos(
//            page: page ?? self.page,
//            pages: pages ?? self.pages,
//            perpage: perpage ?? self.perpage,
//            total: total ?? self.total,
//            photo: photo ?? self.photo
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Photo
//struct Photo: Codable {
//    let id, owner, secret, server: String
//    let farm: Int
//    let title: String
//    let ispublic, isfriend, isfamily: Int
//    let urlN: String
//    let heightN, widthN: Int
//    
//    var image: UIImage? {
//        didSet{
//            self.didUpdateImage?(image)
//        }
//    }
//
//    var didUpdateImage: ((UIImage?) -> ())? = nil
//    
//    enum CodingKeys: String, CodingKey {
//        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily
//        case urlN = "url_n"
//        case heightN = "height_n"
//        case widthN = "width_n"
//    }
//    
//    mutating func setupDidUpdateImage(onCompletion: @escaping (UIImage?) -> ()) {
//        self.didUpdateImage = onCompletion
//    }
//}
//
//// MARK: Photo convenience initializers and mutators
//
//extension Photo {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Photo.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        id: String? = nil,
//        owner: String? = nil,
//        secret: String? = nil,
//        server: String? = nil,
//        farm: Int? = nil,
//        title: String? = nil,
//        ispublic: Int? = nil,
//        isfriend: Int? = nil,
//        isfamily: Int? = nil,
//        urlN: String? = nil,
//        heightN: Int? = nil,
//        widthN: Int? = nil
//    ) -> Photo {
//        return Photo(
//            id: id ?? self.id,
//            owner: owner ?? self.owner,
//            secret: secret ?? self.secret,
//            server: server ?? self.server,
//            farm: farm ?? self.farm,
//            title: title ?? self.title,
//            ispublic: ispublic ?? self.ispublic,
//            isfriend: isfriend ?? self.isfriend,
//            isfamily: isfamily ?? self.isfamily,
//            urlN: urlN ?? self.urlN,
//            heightN: heightN ?? self.heightN,
//            widthN: widthN ?? self.widthN
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photoResponse = try PhotoResponse(json)

import Foundation

// MARK: - PhotoResponse
class PhotoResponse: Codable {
    let photos: Photos
    let extra: Extra
    let stat: String

    init(photos: Photos, extra: Extra, stat: String) {
        self.photos = photos
        self.extra = extra
        self.stat = stat
    }
}

// MARK: PhotoResponse convenience initializers and mutators

extension PhotoResponse {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(PhotoResponse.self, from: data)
        self.init(photos: me.photos, extra: me.extra, stat: me.stat)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        photos: Photos? = nil,
        extra: Extra? = nil,
        stat: String? = nil
    ) -> PhotoResponse {
        return PhotoResponse(
            photos: photos ?? self.photos,
            extra: extra ?? self.extra,
            stat: stat ?? self.stat
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Extra
class Extra: Codable {
    let exploreDate: String
    let nextPreludeInterval: Int

    enum CodingKeys: String, CodingKey {
        case exploreDate = "explore_date"
        case nextPreludeInterval = "next_prelude_interval"
    }

    init(exploreDate: String, nextPreludeInterval: Int) {
        self.exploreDate = exploreDate
        self.nextPreludeInterval = nextPreludeInterval
    }
}

// MARK: Extra convenience initializers and mutators

extension Extra {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Extra.self, from: data)
        self.init(exploreDate: me.exploreDate, nextPreludeInterval: me.nextPreludeInterval)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        exploreDate: String? = nil,
        nextPreludeInterval: Int? = nil
    ) -> Extra {
        return Extra(
            exploreDate: exploreDate ?? self.exploreDate,
            nextPreludeInterval: nextPreludeInterval ?? self.nextPreludeInterval
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Photos
class Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [Photo]

    init(page: Int, pages: Int, perpage: Int, total: Int, photo: [Photo]) {
        self.page = page
        self.pages = pages
        self.perpage = perpage
        self.total = total
        self.photo = photo
    }
}

// MARK: Photos convenience initializers and mutators

extension Photos {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Photos.self, from: data)
        self.init(page: me.page, pages: me.pages, perpage: me.perpage, total: me.total, photo: me.photo)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        page: Int? = nil,
        pages: Int? = nil,
        perpage: Int? = nil,
        total: Int? = nil,
        photo: [Photo]? = nil
    ) -> Photos {
        return Photos(
            page: page ?? self.page,
            pages: pages ?? self.pages,
            perpage: perpage ?? self.perpage,
            total: total ?? self.total,
            photo: photo ?? self.photo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Photo
class Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let urlN: String
    let heightN, widthN: Int
    
    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily
        case urlN = "url_n"
        case heightN = "height_n"
        case widthN = "width_n"
    }
    
    var didUpdateImage: ((UIImage?) -> ())?
    
    var image: UIImage? {
        didSet{
            self.didUpdateImage?(image)
        }
    }
    
    func setupDidUpdateImage(onCompletion: @escaping (UIImage?) -> ()) {
        self.didUpdateImage = onCompletion
    }
    
    init(id: String, owner: String, secret: String, server: String, farm: Int, title: String, ispublic: Int, isfriend: Int, isfamily: Int, urlN: String, heightN: Int, widthN: Int) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily = isfamily
        self.urlN = urlN
        self.heightN = heightN
        self.widthN = widthN
    }
}

// MARK: Photo convenience initializers and mutators

extension Photo {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Photo.self, from: data)
        self.init(id: me.id, owner: me.owner, secret: me.secret, server: me.server, farm: me.farm, title: me.title, ispublic: me.ispublic, isfriend: me.isfriend, isfamily: me.isfamily, urlN: me.urlN, heightN: me.heightN, widthN: me.widthN)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: String? = nil,
        owner: String? = nil,
        secret: String? = nil,
        server: String? = nil,
        farm: Int? = nil,
        title: String? = nil,
        ispublic: Int? = nil,
        isfriend: Int? = nil,
        isfamily: Int? = nil,
        urlN: String? = nil,
        heightN: Int? = nil,
        widthN: Int? = nil
    ) -> Photo {
        return Photo(
            id: id ?? self.id,
            owner: owner ?? self.owner,
            secret: secret ?? self.secret,
            server: server ?? self.server,
            farm: farm ?? self.farm,
            title: title ?? self.title,
            ispublic: ispublic ?? self.ispublic,
            isfriend: isfriend ?? self.isfriend,
            isfamily: isfamily ?? self.isfamily,
            urlN: urlN ?? self.urlN,
            heightN: heightN ?? self.heightN,
            widthN: widthN ?? self.widthN
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
