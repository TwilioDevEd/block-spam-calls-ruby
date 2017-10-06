<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Block Spam Calls. Powered by Twilio - Ruby/Sinatra
[![Build Status](https://travis-ci.org/TwilioDevEd/block-spam-calls-ruby.svg?branch=master)](https://travis-ci.org/TwilioDevEd/block-spam-calls-ruby)

[Learn how to use Twilio add-ons to block spam calls](https://www.twilio.com/docs/guides/block-spam-calls-and-robocalls-ruby).

## Local development

First you need to have [Ruby](https://www.ruby-lang.org/) (at least v2.3) installed on your system.

To run the app locally, clone this repository and `cd` into its directory:

1. First clone this repository and `cd` into its directory:

   ```bash
   git clone https://github.com/TwilioDevEd/block-spam-calls-ruby.git
   cd block-spam-calls-ruby
   ```

1. Install bundler

   ```bash
   gem install bundler
   ```

1. Install dependencies:

   ```bash
   bundle install
   ```

1. Run the application.

   ```bash
   rackup
   ```

To actually forward incoming calls, your development server will need to be
publicly accessible. [We recommend using ngrok to solve this
problem](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html).

Once you have started ngrok, update your TwiML app's voice URL setting to use
your ngrok hostname, so it will look something like this:

```
http://88b37ada.ngrok.io/
```

## Run the tests

You can run the tests locally by typing

```bash
bundle exec rspec
```

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
