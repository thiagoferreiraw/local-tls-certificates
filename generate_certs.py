import os
import sys

if __name__ == "__main__":
    if sys.argv == 1:
        print("ERROR: please inform the domain names after")

    domain_names = sys.argv[1:]
    subject_name = domain_names[0]
    mapped_dns_domain_names = ",".join([f"DNS:{domain}" for domain in domain_names])

    os.system(
        f"docker run --rm -v $PWD/certs:/usr/share alpine "
        f"/bin/sh /usr/share/open_ssl_generate.sh '{subject_name}' '{mapped_dns_domain_names}'"
    )