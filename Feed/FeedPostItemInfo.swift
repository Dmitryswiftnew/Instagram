

import UIKit

struct FeedPostItemInfo {
    let userImage: UIImage
    let userName: String
    let postSubtitle: String
    let postImage: UIImage
    let numbersOfLikes: Int
    let comment: CommentShortInfo? 
    
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
