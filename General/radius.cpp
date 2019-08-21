#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>

using PostId = std::string;
using UserId = std::string;

struct Post {
    PostId id;                         // Unique ID
    std::string contents;              // Contents of the post
    std::vector<UserId> likes;         // Vector of User IDs
    int64_t timestamp;                 // Timestamp of when the post was made.
};

struct User {
    UserId id;                         // Unique ID
    std::vector<PostId> feed;          // Array of Post IDs
};

std::vector<Post *> getLikedPosts(const User &user, const std::vector<Post> &posts) {
    // TODO
    return std::vector<Post *>();
}

std::unordered_map<UserId, std::vector<Post *>> getFeeds(const std::vector<User> &users, const std::vector<Post> &posts) {
    // TODO
    return std::unordered_map<UserId, std::vector<Post *>>();
}
