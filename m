Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC87531FF62
	for <lists+samba-technical@lfdr.de>; Fri, 19 Feb 2021 20:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=BP2/7lSTPS097XlPeSyrJ+9TOYYWQkb3RvuHqZik2xk=; b=yELGzcIv/ixKHDMY8iaE8wC8d9
	xEHHvX/nXAly5S/ZRUfrwyVmZ34R9JBsb91wn7X3tcJkRDoBHqucWWt6BCsiWK/XsACfphKVQZj7Q
	KWATfOi1K5NxZ/a0BcwcGEAQ3QrF7NeZ3ePaq5yTMDEv9LLx2tkb04xJ/XeLYcSzYLaGBWi9Zku2/
	86QWbQX3+9NUsOiYkP/DnCMT9+kqJt5u0ads2ejzGRtw4RpH0PBHc7U8cMqkceqSeNZ9P7AvksfYC
	TYwDlznNCkrVVTA/+j+gn5F/MwIGuHrCaIzwUvDdICGqaUDGSqMLCLTeOjhzw+VU0L4kb9L02TDpR
	gOXlQjYg==;
Received: from ip6-localhost ([::1]:47280 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lDBPL-000k2u-Vx; Fri, 19 Feb 2021 19:25:44 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:40035) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lDBPF-000k2n-OY
 for samba-technical@lists.samba.org; Fri, 19 Feb 2021 19:25:41 +0000
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id 2E6F2AB5DB;
 Fri, 19 Feb 2021 20:25:28 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id SBziaVcgEJUz; Fri, 19 Feb 2021 20:25:26 +0100 (CET)
Received: from [192.168.123.203] (p5dfc8625.dip0.t-ipconnect.de
 [93.252.134.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 9055FAB143
 for <samba-technical@lists.samba.org>; Fri, 19 Feb 2021 20:25:26 +0100 (CET)
To: samba-technical@lists.samba.org
Subject: Loading ADMX-Files
Message-ID: <63f4cb58-2e6b-a28c-175f-8f9720d6e003@kania-online.de>
Date: Fri, 19 Feb 2021 20:25:26 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms080407060007030202090308"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -9.20 / 15.00 / 15.00
X-Rspamd-Queue-Id: 2E6F2AB5DB
X-Rspamd-UID: 996a27
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

--------------ms080407060007030202090308
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I try to test uploading and using the ADMX-File for winbind-GPOs. I
followed the wiki:
https://wiki.samba.org/index.php/Group_Policy

I use he sernet-packages 4.14rc3

Uploading the ADMx-files worked. I can see the Policies in " Computer
Configuration > Policies > Administrative Templates " in GPO-manager,
but all the other policies are gone. So I can only apply the
samba-policies but not the "normal" Template-policies.
 First Question: How can I get both, the Samba-policies AND the
windows-Policies?

But i did another step:
I created two GPOs one for /etc/motd and the other for /etc/issue. Put
Yes: I liked the gpo to the OU where my Linux-members are located.

I tested with:
-----
root@addc-01:~# samba-tool gpo list LINUX-CLIENT\$
GPOs for user LINUX-CLIENT$
    linux {8CC4F70C-4C09-4D5E-AE39-FC6CEFB98D20}
--------
So GPO is ok

Into [global] of smb.conf  I added the line:
-----------
apply group policies =3D yes
-----------

Even restarted the Client. I expected that the content of the two files
had changed to what I wrote init the GPO.

After I logged in to the client no message was shown, so i did a
samba-gpupdate, first as "normal" user

------------
stka@linux-client:~$ samba-gpupdate
Traceback (most recent call last):
  File "/usr/sbin/samba-gpupdate", line 76, in <module>
    store =3D GPOStorage(os.path.join(cache_dir, 'gpo.tdb'))
  File "/usr/lib/python3/dist-packages/samba/gpclass.py", line 254, in
__init__
    self.log =3D tdb.open(log_file)
PermissionError: [Errno 13] Permission denied
Error in sys.excepthook:
Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/apport_python_hook.py", line 153,
in apport_excepthook
    with os.fdopen(os.open(pr_filename,
FileNotFoundError: [Errno 2] No such file or directory:
'/var/crash/_usr_sbin_samba-gpupdate.1000.crash'

Original exception was:
Traceback (most recent call last):
  File "/usr/sbin/samba-gpupdate", line 76, in <module>
    store =3D GPOStorage(os.path.join(cache_dir, 'gpo.tdb'))
  File "/usr/lib/python3/dist-packages/samba/gpclass.py", line 254, in
__init__
    self.log =3D tdb.open(log_file)
PermissionError: [Errno 13] Permission denied
Exception ignored in: <function GPOStorage.__del__ at 0x7ff4dc2e8a60>
Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/samba/gpclass.py", line 286, in
__del__
    self.log.close()
AttributeError: 'GPOStorage' object has no attribute 'log'
------------

And then with sudo:
------------
stka@linux-client:~$ sudo samba-gpupdate
[sudo] Passwort f=C3=BCr stka:
(pam_mount.c:365): pam_mount 2.16: entering auth stage
ERROR: talloc_free with references at ../../libgpo/pygpo.c:481
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
(pam_mount.c:133): clean system authtok=3D0x563b065391d0 (1073741824)
------------

And with --force
------------
stka@linux-client:~$ sudo samba-gpupdate --force
ERROR: talloc_free with references at ../../libgpo/pygpo.c:481
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164
        reference at ../../pytalloc_util.c:164

------------

The client is Linux-mint 20.1. with samba 4.11.6 from Ubuntu.

second question: is this a Bug or am I missed something.


--=20
Stefan Kania
Landweg 13
25693 St. Michaelisdonn


Signieren jeder E-Mail hilft Spam zu reduzieren und sch=C3=BCtzt Ihre
Privatsph=C3=A4re. Ein kostenfreies Zertifikat erhalten Sie unter
https://www.dgn.de/dgncert/index.html



--------------ms080407060007030202090308
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CdEwggSUMIIDfKADAgECAggL+8ksx5aHiTANBgkqhkiG9w0BAQsFADBmMQswCQYDVQQGEwJE
RTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJI
MSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBOMB4XDTIwMTAxNTE2MDkzM1oX
DTIxMTAxNTE2MDkzM1owbjELMAkGA1UEBhMCREUxITAfBgNVBAUTGDQwMDAwMDAwNWY4ODc2
OWIwYTNhZjcxNDEVMBMGA1UEAwwMU3RlZmFuIEthbmlhMSUwIwYJKoZIhvcNAQkBFhZzdGVm
YW5Aa2FuaWEtb25saW5lLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA42PN
0u00/wwTf/+ER8qPo5xxrXXGf8cFzqPfgtyC037p3qW9EBI3NtoX4uehmKxwZczuad5N9liZ
oG1JwRkgoxSLJ0OSRhnWtbZete1UAASxb1JxkBo7mgvmdTLBpSGv+szqxwmpehBj3jz4Ffyc
lL6JL099HxdhQRU3/fhHR0yfaLhyddmLtApqs2GKaq7tn4ijLyuUdXCojFrd5hD+AQZQSSUt
sZRNel9u8YyY4s6FN8vJpjpVpIBJJPSKpRSo8t9ZFuR4W2BxNEEhi3f8XVw297fP1eM3gSve
99HXz6BNhEN1FMaYb02yEFfktm2TJU0QB2zSdB5PhzXhp9RfPwIDAQABo4IBPDCCATgwHQYD
VR0OBBYEFPVK3SYo2pbp3ETML1E4uO+cyxDHMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAU
6caT0dUPBmRy6mqWProQ8lRUsnkwVgYDVR0gBE8wTTBLBgwrBgEEAfsrAgEDAggwOzA5Bggr
BgEFBQcCARYtaHR0cDovL3NlYzUuZGduc2VydmljZS5kZS9wb2xpY2llcy9pbmRleC5odG1s
MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly9zZWM1LmRnbnNlcnZpY2UuZGUvY3JsL2NybDIt
dHlwZS1lLmNybDAOBgNVHQ8BAf8EBAMCBLAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUF
BwMEMCEGA1UdEQQaMBiBFnN0ZWZhbkBrYW5pYS1vbmxpbmUuZGUwDQYJKoZIhvcNAQELBQAD
ggEBALA4QXXB+Cg9ekdIqZ+/dyvg72AwpZNjWg0eILKUIkOLq5eYdlAr29rV9KD2OmCHtmR9
VXslKshzBcl59ZW23tifmgxAYlr7SQ5/TMWEwTPRAVidDL+KsWiCNsS1oGVbB598YhKQjNo2
zMata6Xmhy3T67L9K+jpxK7TcBxHf7vRcLgoZIPH7E0EZ0eR8KIhTHid2HeNV8syDm7E35nS
YtdtlXSFli8fU410lIRtgBsAD54fqIf9jN9c62mXURNkLRSgcNG1mYzqh0Oeqxy1hIFUiZOB
RXcKSvGvAV5cNAjZtaVxmtAFxwC3oW1T91ZfzviTZHqRn/wdBydpghnnCZowggU1MIIEHaAD
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
R21iSDEiMCAGA1UEAwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIC/vJLMeWh4kwDQYJ
YIZIAWUDBAIBBQCgggHhMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIxMDIxOTE5MjUyNlowLwYJKoZIhvcNAQkEMSIEINf+zfr9lPn3o+eYJZ3ABPVVQRF2
8XMrhGXMtHwKCBBEMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIC/vJLMeWh4kwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AggL+8ksx5aHiTANBgkqhkiG9w0BAQEFAASCAQDJWgjNCGleOTtnihCZN18DDuDaPl84dJqH
01DRXwYxbranSrT0+NyTdqd8S/6Jb72gd6i25Q5hqHxR+hiK4GeItJx9f4WqV0IY4jZrdVaS
91f42emeoAHRPogeaqoOZTITxpKNvvX9spJcVKeZyKc9dXszIgL9kNcJVz60CSUyKRppSIgF
JC/y1GdfIz5SqGGK78dZq0J9bfzOYhHjaPJCvZ4Sm61uCQHUx+ApgXzLhVb5FEbB9M4jK6W6
YgL0moJ9oznYkfPmkGdcw7r4wYFHjvc8InmNhVF+MFvjPeoFjnImxKejttHmQmDtkCJ3aVNK
3wHUpMmjApM4p2xnz7AlAAAAAAAA
--------------ms080407060007030202090308--

