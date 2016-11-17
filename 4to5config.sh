#!/bin/sh

cp -p /etc/spamdyke/spamdyke.conf /etc/spamdyke/spamdyke.conf.bak

sed -i \
-e 's/reject-missing-sender-mx/reject-sender=no-mx/g' \
-e 's/rejection-text-missing-sender-mx/rejection-text-sender-no-mx/g' \
-e 's/reject-identical-sender-recipient/reject-recipient=same-as-sender/g' \
-e 's/rejection-text-identical-sender-recipient/rejection-text-recipient-same-as-sender/g' \
-e 's/local-domains-file/qmail-rcpthosts-file/g' \
-e 's/local-domains-entry=/#local-domains-entry=(Add these entries to qmail-rcpthosts-file)/g' \
-e 's/morercpthosts/qmail-morercpthosts-cdb/'g /etc/spamdyke/spamdyke.conf
