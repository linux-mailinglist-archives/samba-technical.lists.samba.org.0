Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DF311E82
	for <lists+samba-technical@lfdr.de>; Sat,  6 Feb 2021 16:56:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=2oqlE2LY+BjWiOWlR6O9OpA1C24e5Fg9r4GxqfouxMk=; b=b53vtJxVMA4bYkPs/pItUlS8HQ
	eaLBHJvJmOzj5opC3qBIox15TzeUmtJiXWtAZv20zv3+QNgduqdj+quxoRtDGwvZlSQ7zD9rgV/+y
	Ilm0c0Psuf9Cq2y5iHxi0cbqPWQtv/iM8rptdqjnWydN15BZoGDQ4+X26f90EpbA6knLdzgvmfYan
	3ga9UdwpYmlameCEpR78G3fA6Og8UpxbQIo3j4o3LdAl/zT6HHwOpQwZ7XbAL1fqcSqa/nZlPP705
	uvCXobmGYD6dqh0R+SdTg25cXlZBk7e525FSXMPcDNJ8q1aeDPV/maFPEjiUuzfOdbiKv8LD0L3ZI
	jNlhNzfQ==;
Received: from ip6-localhost ([::1]:54776 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l8Pvh-00BMR8-Fl; Sat, 06 Feb 2021 15:55:25 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:33295) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8PvQ-00BMR0-9P
 for samba-technical@lists.samba.org; Sat, 06 Feb 2021 15:55:12 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 03AA3A7E7D;
 Sat,  6 Feb 2021 16:55:02 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id TAbm83GqCmB5; Sat,  6 Feb 2021 16:54:57 +0100 (CET)
Received: from [192.168.123.203] (p5dfc8625.dip0.t-ipconnect.de
 [93.252.134.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id A014CA6C65
 for <samba-technical@lists.samba.org>; Sat,  6 Feb 2021 16:54:57 +0100 (CET)
To: samba-technical@lists.samba.org
Subject: Bug in Printerdriver upload 4.14rc1
Message-ID: <14e9d56a-2e0f-6bcb-179f-d5f487f7bd2d@kania-online.de>
Date: Sat, 6 Feb 2021 16:54:57 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms020906020404030101080107"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -7.69 / 15.00 / 15.00
X-Rspamd-Queue-Id: 03AA3A7E7D
X-Rspamd-UID: 07939c
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

--------------ms020906020404030101080107
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

I'm just testing setting up a printserver with 4.14. I use both, the
Sernet-packages and the packages from Louis van Belle on debian buster.
I have three print server running:
one with Sernet 4.14rc2
one with Louis 4.14rc1
one with Louis 4.13

All set up exactly the same with this smb.conf:
--------
[global]
      workgroup =3D EXAMPLE
      realm =3D EXAMPLE.NET
      security =3D ADS
      winbind refresh tickets =3D Yes
      winbind use default domain =3D yes
      template shell =3D /bin/bash
      idmap config * : range =3D 10000 - 19999
      idmap config EXAMPLE : backend =3D rid
      idmap config EXAMPLE : range =3D  10000000 - 19999999


[print$]
        path =3D /var/lib/samba/printers
        comment =3D printer drivers
        create mask =3D 0775
        inherit permissions =3D yes
        read only =3D no

[printers]
        path =3D /var/spool/samba
        comment =3D spooling directory
        create mask =3D 0700
        browsable =3D no
        read only =3D no
        printable =3D yes

--------

I set permission for all systems:
--------
chgrp -R 'domain admins' /var/lib/samba/printers/
chmod -R 775 /var/lib/samba/printers/
net rpc rights grant 'example\Domain Admins' SePrintOperatorPrivilege -k
-S <print-server-name>
--------

Set up Cups with two printers an I can see the printers:
-------
root@ps1:~# smbclient -L ps1 -k

        Sharename       Type      Comment
        ---------       ----      -------
        print$          Disk      printer drivers
        IPC$            IPC       IPC Service (Samba
4.14.0rc2-SerNet-Debian-1.buster)
        HL3230-ps1      Printer   HL3230-ps1
        HP6-ps1         Printer   HP6-ps1
SMB1 disabled -- no workgroup available
-------

I login at my windows-system with my domain-admin starting the "print
management app" Add all three print server. I can see the printers for
each print server (every printer server is showing it's own printers).

Then I click on "drivers" to add a new signed driver. Widows is showing
the progress bar for uploading the driver to the print server. On both
4.14 print servers the directory /var/lib/samba/printers/x86/3 is
created but empty, only the one with 4.13 has the files for the driver.
No error on the windows-system, no error on both of the Samba print serve=
rs.
The app is showing the driver as present! But there are no files on the
print server, only on the 4.13 system.

Did I miss something from the changes in 4.14 or is this a bug?

I'm just writing my handout for the tutorial on SambaXP so I have every
step written down, if you want to know what I did exactly I could mail
you the (note yet finished) script with all my steps. (It's in English ;-=
) )


--=20
Stefan Kania
Landweg 13
25693 St. Michaelisdonn


Signieren jeder E-Mail hilft Spam zu reduzieren und sch=C3=BCtzt Ihre
Privatsph=C3=A4re. Ein kostenfreies Zertifikat erhalten Sie unter
https://www.dgn.de/dgncert/index.html



--------------ms020906020404030101080107
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
MQ8XDTIxMDIwNjE1NTQ1N1owLwYJKoZIhvcNAQkEMSIEIPrIkjXtiFvjR85VQPEkT+jIgsOE
fB5Q3hmE0INxmR1TMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIC/vJLMeWh4kwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AggL+8ksx5aHiTANBgkqhkiG9w0BAQEFAASCAQCBxKbmOW7d7QaeRKOZvjJcdg5XNY59poZ0
w7bp7J3sG0laVayJGMmn5OPq/WPL/bMfvtfdECgQoC5DhQ/vgAY5G35RrlRzVWRLVdWilBAW
VMupDzmt7hH3f5hzsmq/0hf+Bso8JLbseFkqRaVKQy3I/yfGHfMIh5737yC5h+es6Dymuyor
uwS1hoEli+OQovCbVKjRRUmRl6nsNvU4xCgb18rR+MlpmCEyozDyvVQ3/RBPBCEoY9P2YbDU
5v5toS4TZgbZFxQxT9Srl+raoUe+fQHZY8BR/d0hP3Zqm1yzug8gLVmWbOqjPrkU++ND3eXe
lRxpu6QJDQCCN0KMKS49AAAAAAAA
--------------ms020906020404030101080107--

