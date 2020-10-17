Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 961492910A7
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 10:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=LuJufiewqnpoaXcjhjerrq7daqNiSXz+wqF9bMcHG0E=; b=yG/ITv0szsD1r/hMdPtqfRM982
	KGCeVsib9uuCX0VYqNA+gnnT6vzIGYM9hcMpc0ok+mq7XhsNq7VU0ZDskc2PAFj7O5PYDslCr2inc
	VF/wQ70mUj7A73rXtALcV5VMOPpCp4DRrBHUU6ESplZujguZpBPpUKDnhoyz9V4eWPxIpJ1nofd8J
	dES86zo0RO7yNAinh+FA8EWMqD+hKA645Z0jEnObxbaRHinilIJxh5FZr1BmJzHswg9V3sGeLr5F7
	wODR778T8GD4yw9Wkq0TvV1D3Yp27ZbZCrc0DyJv61gaSQxelUUrXljJfx6XL5kYI/W4jPbOE8/fX
	7IO7lwDw==;
Received: from ip6-localhost ([::1]:33522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kThBf-00CVv0-SV; Sat, 17 Oct 2020 08:03:35 +0000
Received: from plasma33.jpberlin.de ([80.241.58.43]:47693) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kThBU-00CVus-Cr
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 08:03:31 +0000
Received: from gerste.heinlein-support.de (unknown [80.241.56.124])
 by plasma.jpberlin.de (Postfix) with ESMTP id BF90410170F;
 Sat, 17 Oct 2020 09:47:29 +0200 (CEST)
Received: from plasma.jpberlin.de ([80.241.56.76])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id mNw45YiIOQFe; Sat, 17 Oct 2020 09:47:28 +0200 (CEST)
Received: from [192.168.123.249] (p5b240703.dip0.t-ipconnect.de [91.36.7.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 172E2100A0E;
 Sat, 17 Oct 2020 09:47:27 +0200 (CEST)
Subject: Re: dns.keytab file
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
 <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
Message-ID: <402fbc72-ea2d-53c0-d8f1-56512aed4f1d@kania-online.de>
Date: Sat, 17 Oct 2020 09:47:27 +0200
MIME-Version: 1.0
In-Reply-To: <7330647068a853703f694614e3bdef55978d69cd.camel@samba.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms080306030008050202080404"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -2.28 / 15.00 / 15.00
X-Rspamd-Queue-Id: BF90410170F
X-Rspamd-UID: fcabc0
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

--------------ms080306030008050202080404
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi Andrew,

Am 16.10.20 um 22:37 schrieb Andrew Bartlett:
> I just saw this with a customer yesterday.

I see this every time I setup a new domain, I also wrote it into my
Samba4 book. If it's a bug should I write bugreport?

Stefan

--=20
Stefan Kania
Landweg 13
25693 St. Michaelisdonn


Signieren jeder E-Mail hilft Spam zu reduzieren und sch=C3=BCtzt Ihre Pri=
vatsph=C3=A4re. Ein kostenfreies Zertifikat erhalten Sie unter https://ww=
w.dgn.de/dgncert/index.html





--------------ms080306030008050202080404
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
MQ8XDTIwMTAxNzA3NDcyN1owLwYJKoZIhvcNAQkEMSIEIBcXv9XBFBSJNEOmhFBFbneFys+8
ujTD2NnGOG3HudhdMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIC/vJLMeWh4kwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AggL+8ksx5aHiTANBgkqhkiG9w0BAQEFAASCAQBfTTttHcEb2DWMAU6itI3J+l2m5t058hJX
p67OeI+jsnSWTXDBJervK4p7aVdC8gYNf9UlG/j69ypSthq7LMAX663pAeAd64gwgCVYxeIz
g/9l2HrA/XRb9IEgL/DVJEmR5pSh7TWHaQR8LzwudK2oZe7efmWLnyA94+xn6fyEabf9Kj0i
rVy+4sAJ10kpm2XQMInjYM3S22eUbpE3LDYeWNnjpnW2XimgrYPsPj8ZyzNtveaa8MbviioF
S6lkxwVgI9/5K8bEbZuIpVyEWgGbOBQOAg3prZ5zVq2GjZRnbk0Q0e4PbIVGcnFDsLw0SpZW
zgYT1vHOQYkSUlmjlo9SAAAAAAAA
--------------ms080306030008050202080404--

