Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4784A2DE5
	for <lists+samba-technical@lfdr.de>; Sat, 29 Jan 2022 11:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=8cmN7bcJ0Agb4Dv54xzL8nrwBGFU6jgIPSAfjBHDjNY=; b=b8vDN+szI4y9OKhX0qDdh8qSmt
	4Ob/9FDbcAT6sMS0gvt45sHpkue/aLfsawV4CHD0kit0fXgv4UPxSNsu+AqYJlPWq1vKyNDjy2xsf
	sSmLkba7EnU74eKmGlGchrEmqpcvdYPNxCnUlmKT7AxpS9VvxYG20YppqXmbtTJ5Dqcuva9TmZsDw
	vNzxrhWY1eMyQOpNa2JOkLH8ozGL7Sldnv74pfcPZyXWSCXhRxdHl1Q/bVw1BxmtigZJqZ2L1yFzp
	We472TTTEOoBXFe4RxynKaKwSQnKcodXE1rChlUAbT1+MAOQRjjcLPyS86a3o0XpXT11V9kkZmt/3
	xOxA8DOg==;
Received: from ip6-localhost ([::1]:26392 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nDlQu-002Mco-Ig; Sat, 29 Jan 2022 10:58:16 +0000
Received: from plasma5.jpberlin.de ([80.241.58.36]:55245) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nDlQp-002Mce-IO
 for samba-technical@lists.samba.org; Sat, 29 Jan 2022 10:58:14 +0000
Received: from spamfilter06.heinlein-hosting.de
 (spamfilter06.heinlein-hosting.de [80.241.56.125])
 by plasma.jpberlin.de (Postfix) with ESMTP id 406F6ABE3F;
 Sat, 29 Jan 2022 11:41:27 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id y4iAeeWStXBb; Sat, 29 Jan 2022 11:41:26 +0100 (CET)
Received: from [192.168.123.204] (p578519e3.dip0.t-ipconnect.de
 [87.133.25.227])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id CD766ABE3A
 for <samba-technical@lists.samba.org>; Sat, 29 Jan 2022 11:41:25 +0100 (CET)
Message-ID: <cc895930-b174-0371-c4c5-807bc06e34aa@kania-online.de>
Date: Sat, 29 Jan 2022 11:41:25 +0100
MIME-Version: 1.0
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: Microsoft Enforcement Mode
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms010304030200020007030001"
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

--------------ms010304030200020007030001
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I just read, that Microsoft uses a new Enforcement Mode on all MS DCs to
protect the DC against CVE-2021-42287 and CVE-2021-42278. The
Enforcement Mode can be deactivated until June, then MS will force it on
all DCs.
But with this mode active it's no longer possible to join a Linux-Client
to a MS-Domain. I could not find out if this will affect Samba or only
SSSD. If it affect Samba will it affect all Samba-version?





--------------ms010304030200020007030001
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
MQ8XDTIyMDEyOTEwNDEyNVowLwYJKoZIhvcNAQkEMSIEIG8987PGNYhW9BANahhjpuZU7B/8
9Yf4kx7Zwnio1LFbMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIaCwmNkhuH68wgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AghoLCY2SG4frzANBgkqhkiG9w0BAQEFAASCAQB0ON1+5XtFmSA5yO/A7w/Om0cEpabUStm7
oeeV/fNpNp14i+5RHatq3p4SlJTXhUtM0MrgGW2GXgRP+PwIgWGeJQX/JaYfJKF2l8kAKRPy
G86GgpSCBYrjLtETMD5nw/MpUfxPEXOj8hkdkZfctkjvNxhEYAPztPBoX4jKKycD87UxSsnE
ek5uk6ppDXdNcZw91dB4XbilC9kzCYVJO8Vfn0BSrtZWTSPQv3oWeuA2PgMCxxGxub+Xpjd5
KCAxgSkEGWeTzYUlE83rPtfKjF/+I8VfyJeTB2Drs0nCdn3WJvFcEWWn0JC4KzUusH/oUT1H
QWbxELHkvkIdUsOM3g/nAAAAAAAA
--------------ms010304030200020007030001--

