#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>

using PostID = std::string;
using UserID = std::string;

struct Post {
    PostID id;                         // Unique ID
    std::string contents;              // Contents of the post
    std::vector<UserID> likes;         // Vector of User IDs
    int64_t timestamp;                 // Timestamp of when the post was made.
};

struct User {
    UserID id;                         // Unique ID
    std::vector<PostID> feed;          // Array of Post IDs
};

std::vector<const Post *> getLikedPosts(const User &user,
                                        const std::vector<Post> &posts) {
    // TODO
    return std::vector<const Post *>();
}

std::unordered_map<UserID, std::vector<const Post *>>
getFeeds(const std::vector<User> &users, const std::vector<Post> &posts) {
    // TODO
    return std::unordered_map<UserID, std::vector<const Post *>>();
}
