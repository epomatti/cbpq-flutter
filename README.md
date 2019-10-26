# CBPQ

An App for skydivers in Brazil to check their license status.

[![Codemagic build status](https://api.codemagic.io/apps/5db4aca125dc3f2949a9e89f/5db4aca125dc3f2949a9e89e/status_badge.svg)](https://codemagic.io/apps/5db4aca125dc3f2949a9e89f/5db4aca125dc3f2949a9e89e/latest_build) [![Actions Status](https://github.com/epomatti/cbpq-flutter/workflows/CI/badge.svg)](https://github.com/epomatti/cbpq-flutter/actions)

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

Steps to create the AppBundle:

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

This app is developed without cost and in partnership with CBPQ.

Made for skydivers, by skydivers ;)
