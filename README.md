<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Block Spam Calls. Powered by Twilio - Ruby/Sinatra

![](https://github.com/TwilioDevEd/block-spam-calls-ruby/workflows/Ruby/badge.svg)

> This template is part of Twilio CodeExchange. If you encounter any issues with this code, please open an issue at [github.com/twilio-labs/code-exchange/issues](https://github.com/twilio-labs/code-exchange/issues).

## About

Learn how to use Twilio add-ons to block spam calls. This application was build with [Sinatra](http://sinatrarb.com/documentation.html). If you more information about how to use Twilio add-ons to block spam calls click [here](https://www.twilio.com/docs/guides/block-spam-calls-and-robocalls-ruby).

Implementations in other languages:

| .NET | Java | Python | PHP | Node |
| :--- | :--- | :----- | :-- | :--- |
| [Done](https://github.com/TwilioDevEd/block-spam-calls-csharp) | [Done](https://github.com/TwilioDevEd/block-spam-calls-java)  | [Done](https://github.com/TwilioDevEd/block-spam-calls-python)  | [Done](https://github.com/TwilioDevEd/block-spam-calls-php) | [Done](https://github.com/TwilioDevEd/block-spam-calls-node)  |

## Set up

### Requirements

- [Ruby](https://www.ruby-lang.org/) **2.6.x** version.

### Create a TwiML App

This project is configured to use a **TwiML App**, which allows us to easily set the voice URLs for all Twilio phone numbers we purchase in this app.

To create a new TwiML app click [here](https://www.twilio.com/console/voice/twiml/apps).

![](images/create-twiml-app.png)

### Install Add-ons

The following guide will help you to [install Add-ons](https://www.twilio.com/docs/add-ons/install). You can access the Add-ons in the Twilio console [here](https://www.twilio.com/console/add-ons). The Spam Filtering Add-ons that are used on this application are:
- [Ekata Phone Validation](https://showcase.twilio.com/s/partner-listing/a8E1W00000097QEUAY)
- [Marchex Clean Call](https://showcase.twilio.com/s/partner-listing/a8E1W00000097QxUAI)
- [Nomorobo Spam Score](https://showcase.twilio.com/s/partner-listing/a8E1W00000097R7UAI)

Once you've selected the Add-on, just click on `Install` button. Then, you will see a pop-up window where you should read and agree the terms, then, click the button `Agree & Install`. For this application, you just need to handle the incoming voice calls, so make sure the `Incoming Voice Call` box for `Use In` is checked and click `Save`

![](images/install-add-on.png)

### Local development

1. First clone this repository and `cd` into it.

   ```bash
   git clone https://github.com/TwilioDevEd/block-spam-calls-ruby.git
   cd block-spam-calls-ruby
   ```

2. Install dependencies:

   ```bash
   make install
   ```

3. Run the application (will run on port 9292).

   ```bash
   make serve
   ```

4. To actually forward incoming calls, your development server will need to be
publicly accessible. [We recommend using ngrok to solve this
problem](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html).

   ```bash
   ngrok http 9292
   ```

5. Once you have started ngrok, update your [TwiML app's](https://www.twilio.com/console/voice/twiml/apps) Voice URL setting to use your ngrok hostname, so it will look something like this:

   ```
   http://88b37ada.ngrok.io/
   ```

   Finally, click on `Call` to test your application. See [Create a TwiML App](#create-a-twiml-app) to set the Voice URL.

   ![](images/create-twiml-call-button.png)

That's it!

### Docker

If you have [Docker](https://www.docker.com/) already installed on your machine, you can use our `docker-compose.yml` to setup your project.

1. Make sure you have the project cloned.
2. Run `docker-compose up`.
3. Follow the steps in [Local Development](#local-development) on how to expose your port to Twilio using a tool like ngrok and configure the remaining parts of your application.

### Tests

You can run the tests locally by typing

```bash
bundle exec rspec
```

### Cloud deployment

Additionally to trying out this application locally, you can deploy it to a variety of host services. Here is a small selection of them.

Please be aware that some of these might charge you for the usage or might make the source code for this application visible to the public. When in doubt research the respective hosting service first.

| Service                           |                                                                                                                                                                                                                           |
| :-------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [Heroku](https://www.heroku.com/) | [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)                                                                                                                                       |

## Resources

- The CodeExchange repository can be found [here](https://github.com/twilio-labs/code-exchange/).

## Contributing

This template is open source and welcomes contributions. All contributions are subject to our [Code of Conduct](https://github.com/twilio-labs/.github/blob/master/CODE_OF_CONDUCT.md).

## License

[MIT](http://www.opensource.org/licenses/mit-license.html)

## Disclaimer

No warranty expressed or implied. Software is as is.

[twilio]: https://www.twilio.com
