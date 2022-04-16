# File Uploader

It is a sample application to login and view the auploaded files and able to upload the files and tiny urls are created for easy share of those files.

ruby Version 2.7
rails Version 6.X.X

## How to run this in development mode

1. clone this application
2. create a file in the path `config/master.key` and paste the below key to that path `222080d5b6137259da3190808037f253`
3. run the command `bundle install`
4. run the command `yarn install`
5. if you are not starting the server in`3000` port, need to update the credentials.yml file using the below command `EDITOR="nano" bin/rails credentials:edit` .This `EDITOR` denoted to open this in the nano editor.
6. run the command  `rails db:setup`
7. seed file setup the local user and local data for the upload
8. email: `admin@admin.com`, password: `admin@admin.com`