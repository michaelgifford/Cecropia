#ifndef REDDITDATA_H
#define REDDITDATA_H

/**
 * @brief The RedditData class stores a response from the reddit API server
 */
class RedditData
{
public:
    RedditData();
    ~RedditData();
    int numPosts;
    int score;
    int numComments;
    int numSubscribers;
};

#endif // REDDITDATA_H
