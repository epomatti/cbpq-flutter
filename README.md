# CBPQ

An App for skydivers in Brazil to check their license status.

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

## Release

1. Create production `.env` 

2. Set JKS path property `storeFile` in `/android/key.properties`


## About

This app is developed without cost and in partnership with CBPQ.

Made for skydivers, by skydivers ;)