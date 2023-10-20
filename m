Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E86DB7D1165
	for <lists+samba-technical@lfdr.de>; Fri, 20 Oct 2023 16:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=TOIr4QKXgdWzGthwDF530riTbGbp7z3xSJerujskVek=; b=CR5igWlfAGtPsN4D+1BRTLsq3a
	oFxMu4FXAxTfc0OvJIf9YXPIkmoRz6RGbzBUm+GZfGyLL8/H22QiB74iC6ocicvVQXlc+3g3BYaju
	fLqI2aiHGu9B1/TjhCWPJ1G9yACI+uUxmsr3fLkAdcHB6RRWFPjb/ammaNzTM+pic8V1YKLyEax3D
	qcw2OCU3QEOaM+B/s9Y2wxcKl2y7lPPs14zgiH7/qfxXQ0h/Dx+6u1KMwazPvqwz2CdJWa6u4P4CD
	xmaPOdC3Kookfi8ZzQcUppJUPhiGohTnlSimDfSJYBvmgtXQtlN1SL71UnoJmrFJ9zzE6T/7BvFfB
	xM3zlBPQ==;
Received: from ip6-localhost ([::1]:25978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtqKa-001Vfu-5C; Fri, 20 Oct 2023 14:18:28 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:33897) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qtqKS-001Vfk-Ck
 for samba-technical@lists.samba.org; Fri, 20 Oct 2023 14:18:25 +0000
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by plasma.jpberlin.de (Postfix) with ESMTP id 66A2FAC4F0;
 Fri, 20 Oct 2023 16:00:41 +0200 (CEST)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id U3i6mp2jIZOu; Fri, 20 Oct 2023 16:00:40 +0200 (CEST)
Received: from [192.168.123.203] (p5b240e11.dip0.t-ipconnect.de [91.36.14.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id BE191A6F1F
 for <samba-technical@lists.samba.org>; Fri, 20 Oct 2023 16:00:39 +0200 (CEST)
Message-ID: <c6ef1821-8365-4626-9fae-c3e3a2c765e3@kania-online.de>
Date: Fri, 20 Oct 2023 16:00:39 +0200
MIME-Version: 1.0
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Content-Language: de-DE, en-US
Subject: ADWS support for Samba
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms080604090704020505010104"
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

--------------ms080604090704020505010104
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

With Samba 4.19 it is possible (using FL 2016) to create "authentication 
policies" and "authentzicationsilos" but to realy work with the policies 
and silos "Active Directory Administrative Center" must be used. This is 
not working together with a Samba DC because of the missing 
ADWS-support. Will this be possible in the future? Or is there a way to 
use policies and silos without ADAC?


--------------ms080604090704020505010104
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: Kryptografische S/MIME-Signatur

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CdEwggSUMIIDfKADAgECAghxU09cSz6R1TANBgkqhkiG9w0BAQsFADBmMQswCQYDVQQGEwJE
RTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJI
MSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBOMB4XDTIzMDkyNTE4MDgzNVoX
DTI0MDkyNDE4MDgzNVowbjELMAkGA1UEBhMCREUxITAfBgNVBAUTGDQwMDAwMDAwNjUxMWNm
MDEzNmYxMWEwNDEVMBMGA1UEAwwMU3RlZmFuIEthbmlhMSUwIwYJKoZIhvcNAQkBFhZzdGVm
YW5Aa2FuaWEtb25saW5lLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1ULY
84oACo6tokvBGHFH3ZqqbpFN09v3A+iqQRRy3N4PfYPPPn2Br4Xun5HhTDbXnppqxxzRh8xw
tV6TZhuRfa2rOaNfloKJCUgvBcTc+AGCSED0GR/HG8KDqUarhczOSpVagbTeFMfr2rmVj9Mr
B6KXoQnXcspUKZhllAOmluGJgZ96jaKclZb54/0Z7HOqUtLOCyBQjhB4WHPHCmMfmoBWWnll
NCh5ArWxAq2oy3qh3vD41YcFCWfwsbhWu6H7i+DctxX1d2s4Yb8AGcVotY5QM4Ihfs83Axez
nrfnM0DcyJxEyAYEy/NCcNVbnKiBxEc6bOHcOBfNBCk0gfxU8wIDAQABo4IBPDCCATgwHQYD
VR0OBBYEFJ24mZ9+WXalRwYFaJEOZPfMjOiyMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAU
6caT0dUPBmRy6mqWProQ8lRUsnkwVgYDVR0gBE8wTTBLBgwrBgEEAfsrAgEDAggwOzA5Bggr
BgEFBQcCARYtaHR0cDovL3NlYzUuZGduc2VydmljZS5kZS9wb2xpY2llcy9pbmRleC5odG1s
MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly9zZWM1LmRnbnNlcnZpY2UuZGUvY3JsL2NybDIt
dHlwZS1lLmNybDAOBgNVHQ8BAf8EBAMCBLAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUF
BwMEMCEGA1UdEQQaMBiBFnN0ZWZhbkBrYW5pYS1vbmxpbmUuZGUwDQYJKoZIhvcNAQELBQAD
ggEBADibCeP+7VM75NQfZByrA0oDOPQy1kwPtnBUqX4SZuCTIiM27NZDgYry1KJS+QuKbNmd
3OirBVqls4rYFTk24qH+5CIstJKrxY+TMHnGk9KpsVVDplw+EyE79khhcAMrbS03WsRZiBd/
Uk7W5cvfkrTlCIjLzhwvDBqea4+bRTbi8T63LtNHhOgaj7g3+J1xM/wVgVlobSXoXk69+8ZL
1RG3on3r+1EmJpvCPJsL0BfUTia547lW4ectUBOrQ9eEri2eb+MW1QyileHPXv6OS465uN/b
2kqY39wo95YEWmWRRZDsiKAqkuY/Qfx7FsodvAQo8kzCsyruNaZB5q6eqZIwggU1MIIEHaAD
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
R21iSDEiMCAGA1UEAwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIcVNPXEs+kdUwDQYJ
YIZIAWUDBAIBBQCgggHhMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIzMTAyMDE0MDAzOVowLwYJKoZIhvcNAQkEMSIEIHID+ISBE5tsnIZahU5PtHng17id
0dAKwjlZqo/2/OduMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIcVNPXEs+kdUwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AghxU09cSz6R1TANBgkqhkiG9w0BAQEFAASCAQCu817ecMnow9ItbKiSm+WYT+CKP57NNeAB
/IpNn0YqiCFykUYXDeJBsVNc8mxu8yQdep0VC0AV/U7Qff6jJTI9PP7/6BbVBncpagkjbq0O
2lyidpUJQ7IdQJNcP04xjVUxFDDtzcXQAL6cPKkCwmwFTphsJXAo0DspkuWFhPaOvSolGKDG
Wlf3h+4tg81EZBUuIZytUBg4wSwF6lF9uqAFW/MH2saDkpavSQL2niBgNAsVZ1n1IDnksIIF
qmMCp1RZRNSEZLc2ylsh17BHW0MXc7859DLDtpK+N45OFBNJEEN4jWqUXRENxyFwVyLYPwxh
rzGWLIXvuwxG49fzF6KHAAAAAAAA
--------------ms080604090704020505010104--

