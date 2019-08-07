## Build process
1. `rails new act_storage_test --database=postgresql --skip-test --webpack=react`

2. Pin Rails gem to master@d44fdd2 (latest at the moment)

3. Add Active Storage and AWS S3 SDK
    `rails active_storage:install`
    `gem "aws-sdk-s3", require: false`
    `bundle install`
    `rails db:create`
    `rails db:migrate`
