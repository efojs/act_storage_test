## Plot
After deletion of post with image, Turbolinks try to GET deleted blob  
Issue #36887: https://github.com/rails/rails/issues/36887

## System
* Ruby 2.5.5
* Rails 6.1.0.alpha
* AWS S3


## Steps to reproduce

* `$ git clone https://github.com/efojs/act_storage_test.git`
* `$ cd act_storage_test`
* `$ bundle install`
* `rails db:create`
* `rails db:migrate`
* add S3 credentials to `config/credentials.yml.enc` or `config/storage.yml`
* `$ rails s`
* go to http://localhost:3000/new
* add file and save post (should redirect to http://localhost:3000/)
* delete post by clicking "Delete post..." under the image
* check logs

#### Expected
    No error

#### Actual
Chrome console:
```
GET http://localhost:3000/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBEZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--e2ad5b6b6dce1925d3aa9dac8ef472414b1c7396/8adtfjh3noe01.jpg
404 (Not Found)
```

Logs:

```
Started GET "/rails/active_storage/blobs/eyJf <...>
Completed 404 Not Found in 11ms (ActiveRecord: 0.6ms | Allocations: 1964)

ActiveRecord::RecordNotFound (Couldn't find ActiveStorage::Blob with 'id'=8):

rails (d44fdd29690a) activerecord/lib/active_record/core.rb:177:in `find'
<...>
puma (3.12.1) lib/puma/thread_pool.rb:135:in `block in spawn_thread'
[ActiveJob] [ActiveStorage::PurgeJob] [14c40f01-dc06-4c56-88e1-a76cad27308b]   S3 Storage (225.3ms) Deleted file from key: h6pee418lw42w2dur9hqfw6oto0f
[ActiveJob] [ActiveStorage::PurgeJob] [14c40f01-dc06-4c56-88e1-a76cad27308b]   S3 Storage (101.9ms) Deleted files by key prefix: variants/h6pee418lw42w2dur9hqfw6oto0f/
[ActiveJob] [ActiveStorage::PurgeJob] [14c40f01-dc06-4c56-88e1-a76cad27308b] Performed ActiveStorage::PurgeJob (Job ID: 14c40f01-dc06-4c56-88e1-a76cad27308b) from Async(active_storage_purge) in 563.3ms
```




## Build process
1. `rails new act_storage_test --database=postgresql --skip-test --webpack=react`

2. Pin Rails gem to master@d44fdd2 (latest at the moment)

3. Install Active Storage and add AWS S3 SDK  
    `rails active_storage:install`  
    `gem "aws-sdk-s3", require: false`  
    `bundle install`  
    `rails db:create`  
    `rails db:migrate`  

4. Add S3 storage credentials

5. Add Post model

6. Add actions and routes
