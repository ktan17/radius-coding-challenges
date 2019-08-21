class Post {
    constructor(id, contents, likes, timestamp) {
        this.id = id;                   // Unique ID
        this.contents = contents;       // Contents of the post
        this.likes = likes;             // Array of User IDs
        this.timestamp = timestamp;     // Timestamp of when the post was made.
    }
}

class User {
    constructor(id, feed) {
        this.id = id;                   // Unique UID
        this.feed = feed;               // Array of Post IDs
    }
}

function getLikedPosts(user, posts) {
    // TODO
    return [];
}

function getFeeds(users, posts) {
    // TODO
    return {};
}