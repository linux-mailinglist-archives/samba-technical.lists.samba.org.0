Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 045D22FB4BB
	for <lists+samba-technical@lfdr.de>; Tue, 19 Jan 2021 10:03:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JxLOEsc/QoQDcVoVxol1QWhLVRSn10aKYWrBzYXYfzA=; b=FCcenD6IG2Ah7PmldcKV9XDorS
	fbMHE9f4K5FwkJcElY17LhlyIW5/lqE/uszDJMqyWFtV5BnqaKxw9wXYNh+wmhpzKPZX7FYRXz9IO
	FgRWYa3e2nUYn4N+fvXvjItvsvOxYx+oo7fPpWBkG1rTfpkY1O9Ph1p0Rg+GvEqb7kRpGGkB9wIY4
	kAz7wOk3zfd9tw4hbM0AqKjbJ8wAWjsLp7DSUHwYjOMZ8i5QYZcA+CGoIOMxGAIp0uOWxgPLrZDYW
	1H44lPGVMMetIUUvi5MyzfFFhgKnRuWLj+J8Au+Ahs630Sjai0F0aO+dmSKRQEpgxBZcuK3jTPGDn
	2n2AcEEg==;
Received: from ip6-localhost ([::1]:22660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1muQ-0068Gr-5r; Tue, 19 Jan 2021 09:02:42 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:44079) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1muH-0068Gk-Sr
 for samba-technical@lists.samba.org; Tue, 19 Jan 2021 09:02:39 +0000
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id BAD96AB3E4;
 Tue, 19 Jan 2021 10:02:27 +0100 (CET)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id aGd4SUGb0Y47; Tue, 19 Jan 2021 10:02:23 +0100 (CET)
Received: from [192.168.123.203] (p5dfc8625.dip0.t-ipconnect.de
 [93.252.134.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 87125AB3FD;
 Tue, 19 Jan 2021 10:02:23 +0100 (CET)
Subject: Re: printer driver type 4
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <7781e141-42b9-17c6-278e-9094edf39ee0@kania-online.de>
 <16983374.jckQO7Hm9i@magrathea>
Message-ID: <5ecefecd-d41d-9c06-4be8-a0eb18ad7e3b@kania-online.de>
Date: Tue, 19 Jan 2021 10:02:23 +0100
MIME-Version: 1.0
In-Reply-To: <16983374.jckQO7Hm9i@magrathea>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms090604050505030902090501"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.70 / 15.00 / 15.00
X-Rspamd-Queue-Id: BAD96AB3E4
X-Rspamd-UID: 6528a5
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

--------------ms090604050505030902090501
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Can I help somehow? It' might not be impotent for the developers, but I
can tell you many admins are waiting for type 4 printer driver. Many of
my customers are using samba as print server but it getting more and
more difficult to get new printers with type 3 drivers


Am 18.01.21 um 17:39 schrieb Andreas Schneider:
> there is currently nobody working on this. The work in progress branch =
has=20
> been rebased but nobody worked on it since 2017

--=20
Stefan Kania
Landweg 13
25693 St. Michaelisdonn


Signieren jeder E-Mail hilft Spam zu reduzieren und sch=C3=BCtzt Ihre
Privatsph=C3=A4re. Ein kostenfreies Zertifikat erhalten Sie unter
https://www.dgn.de/dgncert/index.html



--------------ms090604050505030902090501
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
MQ8XDTIxMDExOTA5MDIyM1owLwYJKoZIhvcNAQkEMSIEIMYyutw/2PQSu/cYzCoZ83sAP1F1
gz5s4C9hF5l3dG17MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIC/vJLMeWh4kwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AggL+8ksx5aHiTANBgkqhkiG9w0BAQEFAASCAQDhoh2ts1PiANl9FRczp+Ao3KW5xRYpWthd
hSbBLJn4BKJNHy8QXV/xKsppicio6DGdyxugKDgpzMzGUgFnaura5cAMAVONPnX/LRdHp7tg
DyGGgEK01LM0ZWHT5C6nsBgobsWvwmL888Slf9omT4R2+goQosTYCx/4qhlstpsLSoMssCGA
6wOqQhsA9sEOdpKwHL51x015iZVMRTnMBX9tkv/twsXqNo4I571Zxrphc3+vquBErG3KN5Ty
2JhS00O7lqO1fHMsKq0Kbxb/lff0Isfl3I1y3vYiKnrcFMduXmgmrDnaKgbrq1fad7U3LHop
42WrA6svA9XoAuOAB23OAAAAAAAA
--------------ms090604050505030902090501--

