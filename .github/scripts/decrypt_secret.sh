#!/bin/sh

echo $LARGE_SECRET_PASSPHRASE
echo $secrets.LARGE_SECRET_PASSPHRASE

# Decrypt the file
sudo mkdir $HOME/secrets
# --batch to prevent interactive command --yes to assume "yes" for questions
sudo gpg --quiet --batch --yes --decrypt --passphrase="$LARGE_SECRET_PASSPHRASE" \
--output $HOME/secrets/key.jks ./.github/secrets/key.jks.gpg

sudo mv $HOME/secrets/key.jks ./android/app/