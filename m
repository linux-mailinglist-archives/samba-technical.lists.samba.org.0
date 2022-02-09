Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FD04AFD08
	for <lists+samba-technical@lfdr.de>; Wed,  9 Feb 2022 20:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=DZ+7mEYeCuqSvizFl7W90+n0mRmxyH1Etq7tAPPtfnc=; b=JyLNpG1OY0EJ7fA9RLMIsZDAAP
	UKM+yUJHBu1UdRDKKxzxxEID0Va1YQ/2oMNOgdBoF+8hjxw00KAmmkdtRcIJ1yCKKzqoO8cFzpQJa
	9dtOIZoP1Md8ehDnJ4cw+EX+mxBugAcamjPdRAQdp8mIotP9DurCIozKd/0GPjOjZMuRmH7ijTJwD
	XwVKoq9YoT3I1apB6MMw/X+3of90VC/6zg6NSRFwzIpWmz6lWGzHvnYeswwWqAsBRTb+VXKLVmrod
	DOhgI4MkfsBv/hgSjUJjW0XXYklGUwOsbacUEDtHwmWCJCb5hjYUIKPUBr/MaY1TygURqq3lXJA8x
	zcKqOSGg==;
Received: from ip6-localhost ([::1]:64328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHsOR-00607U-Bq; Wed, 09 Feb 2022 19:12:43 +0000
Received: from plasma5.jpberlin.de ([80.241.58.36]:33197) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nHsOL-00607L-KC
 for samba-technical@lists.samba.org; Wed, 09 Feb 2022 19:12:40 +0000
Received: from spamfilter01.heinlein-hosting.de
 (spamfilter01.heinlein-hosting.de [80.241.56.115])
 by plasma.jpberlin.de (Postfix) with ESMTP id 5132DAC8A3;
 Wed,  9 Feb 2022 20:12:30 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id xhegjH7VmIMj; Wed,  9 Feb 2022 20:12:28 +0100 (CET)
Received: from [192.168.123.203] (p578519e3.dip0.t-ipconnect.de
 [87.133.25.227])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 61049AB725
 for <samba-technical@lists.samba.org>; Wed,  9 Feb 2022 20:12:28 +0100 (CET)
Message-ID: <0d3b1ffa-1ec7-5df6-994d-9b0a964d4818@kania-online.de>
Date: Wed, 9 Feb 2022 20:12:27 +0100
MIME-Version: 1.0
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: No NS-record after recover a domain
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms050709070508020903060002"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a cryptographically signed message in MIME format.

--------------ms050709070508020903060002
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi to all,

I already wrote on the other mailinglist that recovering a domain from
the backup with samba-tool will fail with a missing NS-record for any
reverse-zone. Here again my mail:
------------------
Hi to all,

I have a problem recovering a domain with a revers-zone. I'm using the
following setup:
- Debian 11
- 4.15.5 packages from louis
- original DC-name addc-01
- new DC to recover the domain an NEW VM namend recover-dc1
the new DC is also Debian 11 an louis packages

I do the recovery with:

samba-tool domain backup restore --backup-file
/root/samba-backup-2022-01-29T14-32-38.732614.tar.bz2
--targetdir=/var/lib/samba --newservername=recover-dc1

Then I did:
- cp /var/lib/samba/etc/smb.conf /etc/samba/smb.conf
- cp /var/lib/samba/private/krb5.conf /etc (set the dc-name in the last
line)
- samba-tool ntacl sysvolreset
- add "dns" to "server services" in smb.conf
- then a samba_upgradedns
- restart samba-ad-dc
- check name resolution and the SRV-records. Everything worked fine with
the internal DNS
- then samba_upgradedns --dns-backend=BIND9_DLZ
- remove "dns" from the "server services" in smb.conf
- switch to bind9 with samba_upgradedns --dns-backend=BIND9_DLZ
- restart samba-ad-dc and bind9

Then I got the messages:
 Loading 'AD DNS Zone' using driver dlopen
 samba_dlz: started for DN DC=example,DC=net
 samba_dlz: starting configure
 samba_dlz: configured writeable zone 'example.net'
 zone 56.168.192.in-addr.arpa/NONE: has no NS records
 samba_dlz: Failed to configure zone '56.168.192.in-addr.arpa'
 loading configuration: bad zone

I switched back to the internal DNS and checked the zone with "dig":
First the forward-zone:
--------------
root@recover-dc1:~# dig ns example.net

; <<>> DiG 9.16.22-Debian <<>> ns example.net
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 5882
;; flags: qr aa rd ad; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 0
;; WARNING: recursion requested but not available

;; QUESTION SECTION:
;example.net.                   IN      NS

;; ANSWER SECTION:
example.net.            900     IN      NS      recover-dc1.example.net.

;; AUTHORITY SECTION:
example.net.            3600    IN      SOA     recover-dc1.example.net.
hostmaster.example.net. 68 900 600 86400 3600

;; Query time: 0 msec
;; SERVER: 192.168.56.103#53(192.168.56.103)
;; WHEN: Mon Feb 07 17:39:17 CET 2022
;; MSG SIZE  rcvd: 102
--------------

Then the reverse zone:
----------------------
root@recover-dc1:~# dig ns 56.168.192.in-addr.arpa

; <<>> DiG 9.16.22-Debian <<>> ns 56.168.192.in-addr.arpa
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 53249
;; flags: qr aa rd ad; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0
;; WARNING: recursion requested but not available

;; QUESTION SECTION:
;56.168.192.in-addr.arpa.       IN      NS

;; AUTHORITY SECTION:
56.168.192.in-addr.arpa. 3600   IN      SOA     recover-dc1.example.net.
hostmaster.example.net. 9 900 600 86400 3600

;; Query time: 0 msec
;; SERVER: 192.168.56.103#53(192.168.56.103)
;; WHEN: Mon Feb 07 17:39:59 CET 2022
;; MSG SIZE  rcvd: 111
----------------------

No NS-record.
I added a NS-record:
samba-tool dns add recover-dc1 56.168.192.in-addr.arpa @ NS
recover-dc1.example.net -U administrator

switched back to bind9 and everything was working.

Now my question

Is this a bug or a feature? It would be nice if a reverse zone would
work correctly after a recovery.
-----------------

I post it here on the technical list because two of my customers having
the same problem. I tried it again with different setups and it always
ended with the missing NS-record.

Stefan



--------------ms050709070508020903060002
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CdEwggSUMIIDfKADAgECAghoLCY2SG4frzANBgkqhkiG9w0BAQsFADBmMQswCQYDVQQGEwJE
RTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJI
MSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBOMB4XDTIxMTAwMzE0MzMwM1oX
DTIyMTAwMzE0MzMwM1owbjELMAkGA1UEBhMCREUxITAfBgNVBAUTGDQwMDAwMDAwNjE1OWMx
N2QyYmZjMTAyYzEVMBMGA1UEAwwMU3RlZmFuIEthbmlhMSUwIwYJKoZIhvcNAQkBFhZzdGVm
YW5Aa2FuaWEtb25saW5lLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr4L6
+t8YsmErxzkeCgfmXRrQQEHJQyZQxYPObVLOqodpHjkmMnYHYjplhHyxcAaJKNuCoAv941t1
iH1Lu12yOQS2yRE7xNAcoPx/acnZo5M7dAJOJ8JTmTYFbKkNGSNT7PJpA1xrxjuIRgXnEg/N
1nDKaSRIDrMyjDdUsa/mFKi1fp8/CvDIg/oL0Z0FuB6BsZHnshP+leRSjEDARmhkC8ifiDKo
EMqiLVU1CqHgidRWM/aPYKpJ8zOQCUvZsIID4Vy393nJytuCBAUz9jCuDXwaFI7x2+yhg2VZ
qZgURJlwwwgXk7DUCtXV5Jm8fyJQQT41MEb+IBVTqW+lEx+qkwIDAQABo4IBPDCCATgwHQYD
VR0OBBYEFN3Lma+ERE52zn+UO6mQL8KOfmWpMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAU
6caT0dUPBmRy6mqWProQ8lRUsnkwVgYDVR0gBE8wTTBLBgwrBgEEAfsrAgEDAggwOzA5Bggr
BgEFBQcCARYtaHR0cDovL3NlYzUuZGduc2VydmljZS5kZS9wb2xpY2llcy9pbmRleC5odG1s
MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly9zZWM1LmRnbnNlcnZpY2UuZGUvY3JsL2NybDIt
dHlwZS1lLmNybDAOBgNVHQ8BAf8EBAMCBLAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUF
BwMEMCEGA1UdEQQaMBiBFnN0ZWZhbkBrYW5pYS1vbmxpbmUuZGUwDQYJKoZIhvcNAQELBQAD
ggEBAM4bjRa/F8JdiKUN4vUmR/T/+JgCfYWpIhZM/4G6otEeQH/3yZSjsSw6KakUGlUzrhga
B2bLyqjGwa7AjpwfuipQy0PRuKxZm5Lk7DDa3iIY4vqftpC2F5YMyb7yW2fLAOsnW3U4z44L
cyKOuThoyXtrK4klUuqg0PjCDRhPlsjB/E+ITF1Jb0zRFY55flsoaCey1Cghpe7yTqxaWbSG
MR8r10FYGbBDy7j/kXbKGYm9e2fX2SitrDeZrjtTkvraFdNrnWx4BGyYEzflTfkOFZQGLRPD
pRjkzsxZ8Lf/Ew3tEUEdk41ACOo+r8GM4riMms7zhn6hJxEQF3KIp8NxFT0wggU1MIIEHaAD
AgECAghVHErXZq0l9jANBgkqhkiG9w0BAQsFADBhMQswCQYDVQQGEwJERTEzMDEGA1UECgwq
REdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJIMR0wGwYDVQQDDBRk
Z25zZXJ2aWNlIFJvb3QgNzpQTjAeFw0xNjEwMjYwOTIyNDFaFw0yNDEwMjYwOTIyNDFaMGYx
CzAJBgNVBAYTAkRFMTMwMQYDVQQKDCpER04gRGV1dHNjaGVzIEdlc3VuZGhlaXRzbmV0eiBT
ZXJ2aWNlIEdtYkgxIjAgBgNVBAMMGWRnbnNlcnZpY2UgQ0EgMiBUeXBlIEU6UE4wggEiMA0G
CSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDcpfKUP3THo0fSl2bOa6PNbRcDYZaE4ZV3vLGr
e/U445OsRahORPeP/9L4nycTK6fUawpDTqOaDxtXYxjoJNC9LnKRxVB/UkBf0h25vN0L1iV4
KhCaY8TimV0z2yUSlb2NuZ4gdBU69qJkasqYj+AP8OcQOo0idj9Nr1eloHD32i0JDPkhBj8V
f6c6b7mNyn8yfZYvZlzzV2iQ/cvo6iFLx2wgG7mCkOZ8BAHGDFw6T0UIA0Bk60YhRMRxI7GX
jMxBQA2Y/XXoP4dvQDDtMNmK0r5DUXof87w2brXctuQ2b4xNwFIErVoAQu8ftnXTm9iOtaOs
WyLMZX6v5szaQBqBAgMBAAGjggHqMIIB5jASBgNVHRMBAf8ECDAGAQH/AgEAMB8GA1UdIwQY
MBaAFAEMFht0ctM8FO4md7dJFFPY+4sbMFsGCCsGAQUFBwEBBE8wTTBLBggrBgEFBQcwAYY/
aHR0cDovL3JvY3NwLWRnbi5kZ25zZXJ2aWNlLmRlOjgwODAvZWpiY2EvcHVibGljd2ViL3N0
YXR1cy9vY3NwMGoGA1UdIARjMGEwXwYMKwYBBAH7KwIBBAIBME8wTQYIKwYBBQUHAgEWQWh0
dHA6Ly93d3cuZGduc2VydmljZS5kZS90cnVzdGNlbnRlci9wdWJsaWMvZGduc2VydmljZS9p
bmRleC5odG1sMIGZBgNVHR8EgZEwgY4wgYuggYiggYWGgYJsZGFwOi8vbGRhcC5kZ25zZXJ2
aWNlLmRlOjM4OS9DTj1DUkwtMSxPPURHTiUyMFNlcnZpY2UlMjBHbWJILEM9REU/Y2VydGlm
aWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBv
aW50MB0GA1UdDgQWBBTpxpPR1Q8GZHLqapY+uhDyVFSyeTAOBgNVHQ8BAf8EBAMCAQYwGwYJ
KwYBBAHAbQMFBA4wDAYKKwYBBAHAbQMFATANBgkqhkiG9w0BAQsFAAOCAQEAq7w5+kXJ+/xT
at0jiTX4GDX5HUeQohqAuLGfotHcqQqqjF8G6UUI0q4i0tnhHtldhZrNBOErgThGsToNZ1Y2
Gn0FRrcrUU9LnhSMwd1XJ0Je6ERSdEh4vXf8YxJQGZJPCPJcrblhue0mmwO9nbhKewGglht5
VWSHTS8vq5Da3zbxFG6lIdE62V4KqcMAiyY2BfL8guCPscTWl5txJrjb4ENo9nRqdzsXNEG3
yyzgmyv6znQ4pGgTe5E6qXx5bO6XCDoUK4Kz1S82PzR6hvcxKZo7kKK2ut2B3buwU8xqfw73
EMH8imv4LW/Sx59wKElKjijjHdNrFG/wMRobDYzMyTGCA4IwggN+AgEBMHIwZjELMAkGA1UE
BhMCREUxMzAxBgNVBAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2Ug
R21iSDEiMCAGA1UEAwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIaCwmNkhuH68wDQYJ
YIZIAWUDBAIBBQCgggHhMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIyMDIwOTE5MTIyN1owLwYJKoZIhvcNAQkEMSIEIA2O4NksSqdqHbmD7ZaQHhCu+HOP
Tp3BEKwdIYhioDmEMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIaCwmNkhuH68wgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AghoLCY2SG4frzANBgkqhkiG9w0BAQEFAASCAQCl7BTDFyYqnX4hiQHp33P9u1xYaIhG04TS
V4zyq3/SwFbyOOlR0HlK+hXj8PBBkaR78E3ozdqV4d78HvL4d32t829AUnyFcU2F3rIFKUpn
eHl7F9xpYSWohPzmbxrp/Gzb+cBnVCN74/zybD4tdxCKAreOlet4pl4+cxUpvm0RrwaeIxA8
fIcYGWhzRN+0wehC65BwkF3xmsD2dCLgNK16gv0W9iunVWqRpmtndxk2YUK5YzSeutdLPDNI
iQZFbwp63q5gKseywX1EIHZidRjVq06gZ7g6omvTmyFJI3orVAqaLOdfyEdcgb9bXeHm67I9
hqWmpbxbH7eTVekzjuUlAAAAAAAA
--------------ms050709070508020903060002--

