# CBPQ

A simple application for skydivers in Brazil to check their license status.

## The motivation

The [official website](www.cbpq.org.br) is not prepared for mobile devices and there is no official app for this service.

It is common to see athletes in the middle of the dropzone strugging to access the main website to check license information, and dropzone managers have no quick access to validate an athelet status.

Made for skydivers, by skydivers ;)

## How it works

There is no API provided by , so the app needs to do a little "magic".

1. The app sends a GET request to the official site "Consulta Licença" URL passing the CPF or CBPQ informed by the user.
2. The HTML response is then edited to match XML format. The data is then extracted from the now readable XML and displayed to the user.

The consulta service does not store or uses the athelete's CPF or CBPQ for any other purpose except for the service call. It is safe to use.

## How to install it

1. Install the latest [Flutter SDK](https://flutter.dev/docs/development/tools/sdk/releases)
2. Connect your device
3. Run it with `flutter run`

If you have any problems run `flutter doctor` and see if the environment is properly set up.
