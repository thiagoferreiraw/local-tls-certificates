apk add openssl;

openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -subj "/CN=$1" \
  -addext "subjectAltName=$2" \
  -keyout /usr/share/nginx-selfsigned.key -out /usr/share/nginx-selfsigned.crt