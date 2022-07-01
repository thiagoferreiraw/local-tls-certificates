# Local TLS/SSL certificates


### What?

This repository provides a nginx reverse proxy with self signed TLS certificates. This will allow you to test your app locally in the same domain as your production servers, like "https://example.com":

### Why?

If you need to test something locally that needs to be served on a specific domain AND using an encrypted connection (TLS).

### How? 


We need a few things in place to be able to serve our application on any domain:
- **Create our own self-signed certificates using `openssl`**; Note: Since these certificates do not have a trusted Certificate Authority behind them, they are only accepted by the browser if you explicitly mark them as trusted;
- An nginx reverse proxy to configure our certificates
- Docker to ease up the whole process


## Creating certificates

First, run this command to create a certificate. Make sure to include all domains your app is going to be served.

```
$ python generate_certs.py 'example.com' 'sub.example.com' '*.example.com'
```
The certificates will be available at `./certs`

## Importing and trusting certificates

Using the certificates created on the step above (`./certs`), open your Mac keychain app, go in the certificates tab and import it.

Make sure to open the certificate on the keychain, expand the Trust tab and click to trust.


## Configuring environment

Copy the file `.env.example` to `.env` and replace the variables with the desired values.

## Running nginx reverse proxy

```
$ docker-compose up --build
```