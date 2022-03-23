# DEPRECATED

**⛔️** This app has been deprecated and will no longer be supported as the [official CBPQ site](https://www.cbpq.org.br/) now supports PWA and is maintained by the federation.


An App for skydivers in Brazil to check their license status.

[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/) [![Codemagic build status](https://api.codemagic.io/apps/5db4aca125dc3f2949a9e89f/5db4aca125dc3f2949a9e89e/status_badge.svg)](https://codemagic.io/apps/5db4aca125dc3f2949a9e89f/5db4aca125dc3f2949a9e89e/latest_build) [![Actions Status](https://github.com/epomatti/cbpq-flutter/workflows/CI/badge.svg)](https://github.com/epomatti/cbpq-flutter/actions)



## Getting Started

```
cp .env.prod .env
flutter packages get
flutter run
```

### Mock

```
cp .env.mock .env
cd mock
npm install
node mock.js
```

## Release Bundle

1. Clone the repo

2. Create `.env` file:

```
cp .env.prod .env
```

3. Copy the properties file: `key.properties`

4. Copy the JKS file: `android/app/key.jks`

5. Build the App Bundle:

```
flutter build appbundle --build-name <build_name> --build-version <build_version>
```

## About

Made with love. For skydivers, by skydivers ;)

<a href='https://play.google.com/store/apps/details?id=br.com.cbpq&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' width="150"/></a>
