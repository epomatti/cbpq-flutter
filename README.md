# CBPQ

An App for skydivers in Brazil to check their license status.

[![Codemagic build status](https://api.codemagic.io/apps/5db4aca125dc3f2949a9e89f/5db4aca125dc3f2949a9e89e/status_badge.svg)](https://codemagic.io/apps/5db4aca125dc3f2949a9e89f/5db4aca125dc3f2949a9e89e/latest_build) [![Actions Status](https://github.com/epomatti/cbpq-flutter/workflows/CI/badge.svg)](https://github.com/epomatti/cbpq-flutter/actions)

## Getting Started

```
flutter packages get
flutter run
```

Don't forget to create the `.env` file.

### Mock

```
cd mock
npm install
node mock.js
```

When using the local mock set `CBPQ_BASE_URL=http://10.0.2.2:3000` to allow the emulator to connect to it.

## Release Bundle

Steps to create the AppBundle

1. Create production `.env` 

2. Copy the uncrypted JKS to `android/app/key.jks`

3. Build the App Bundle:

```
flutter build appbundle
```

## About

This app is developed without cost and in partnership with CBPQ.

Made for skydivers, by skydivers ;)
