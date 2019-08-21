#include <string>
#include <vector>
#include <map>

class Post {
public:
    std::string id;                    // Unique ID
    std::string contents;              // Contents of the post
    std::vector<std::string> likes;    // Vector of User IDs
    unsigned timestamp;                // Timestamp of when the post was made.
};

class User {
public:
    std::string id;                    // Unique UID
    std::vector<std::string> feed;     // Array of Post IDs
};

std::vector<Post *> getLikedPosts(User &user, std::vector<Post *> posts) {
    // TODO
    return std::vector<Post *>();
}

std::map<std::string, std::vector<Post *>> getFeeds(std::vector<User *> users, std::vector<Post *> posts) {
    // TODO
    return std::map<std::string, std::vector<Post *>>();
}