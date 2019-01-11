## Twitter

Rails API mimicking basic functionality of Twitter.

---

### Features
- Follow/Unfollow Users
- Post/Edit/Delete/Update Tweets
- View a feed of tweets of your followed users
- Like/unlike tweets
- Retweet another tweet
- List users following you

---
### Requests 

RSpec Request Tests are the best way to figure out which requests can be made.

See users that follow you:

`GET /follow/index`

Follow a user:

`POST /follow/store/{User ID}`

Unfollow a user:

`DELETE /follow/destroy/{User Followed ID}`

See who follows you:

`GET /followers/index`

Like a tweet:

`POST /likes/store/{Tweet ID}`

Unlike a tweet:

`DESTROY /likes/destroy/{Tweet Liked ID}`

See tweets by people you've followed:

`GET /feed/index`

See your tweets:

`GET /tweets/index`

Create a tweet:

`POST /tweets/store`

```
{ 
    tweet: {
        tweet: 'Tweet content up to 255 chars',
        retweet_id: 1 
    }
}
```

*Retweet id is the tweet id you wish to retweet.*

Update a tweet:

`PATCH /tweets/update/{Tweet ID}`

Delete a tweet:

`DESTROY /tweets/destroy/{Tweet ID}`