import Foundation

class Post {
    let id: String              // Unique ID
    let contents: String        // Contents of the post
    let likes: [String]         // Array of User IDs
    let timestamp: UInt         // Timestamp of when the post was made.
}

class User {
    let id: String              // Unique UID
    let feed: [String]          // Array of Post IDs
}

func getLikedPosts(for user: User, posts: [Post]) -> [Post] {
    // TODO
    return []
}

func getFeeds(for users: [User], posts: [Post]) -> [String : Post] {
    // TODO
    return [:]
}