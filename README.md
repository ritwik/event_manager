# Event Manager

Manage events.

Setup with

1. `bundle install`
2. `rake db:migrate`
3. `foreman start`
4. Customize for your event
5. Set ENV Vars
6. Push to heroku
7. Go to `/admin` to see how your event is selling

## ENV Vars

Env vars you need to set.

    PAYPAL_LOGIN=SELLER_LOGIN
    PAYPAL_PASSWORD=SELLER_PASSWORD
    PAYPAL_SIG=SELLER_SIG
    ADMIN_PASS=password

Development ONLY:

    PORT=3000
    RACK_ENV=development

## License

See LICENSE file
