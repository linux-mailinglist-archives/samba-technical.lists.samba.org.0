Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94964158C5B
	for <lists+samba-technical@lfdr.de>; Tue, 11 Feb 2020 11:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zY5qrvhRTz7oG8XpnAQrxm1/hi6xUiJwuUUqPhPuols=; b=KCXD/myvjZU/EFCOZSO4SJfWoV
	Z86rGvq4qjpiHfcRUsBAurPouCDvslQfFaEVt6o4viWyVqCo7KNCkBhGmwpZ5FLk+wj0TiyiKRlM1
	2z60sLKZ9ugHh+PKcTASqha7IYMpHPLaSqPjP3Wqf+CjzueaMK8ozsWQbrVISG927H9vAeL0qtWjj
	qK7ddFJNV/wWrABFyj3/EhH7wVaJ/ktIn5xitZqFN5M6UpzaqBHl26l52wbFTwcD2A6ebDHdA9ERE
	cLrWvprjVHU3fuCFrHiRVfWt/BvrNzT6k0t6beZla30oSEWpp30w9bIyVLw7zmIFCWfZzGrDmwI9g
	2YCGc1+A==;
Received: from localhost ([::1]:51658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1SSp-009LOG-Fs; Tue, 11 Feb 2020 10:08:19 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:35191) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j1SSk-009LO9-OH
 for samba-technical@lists.samba.org; Tue, 11 Feb 2020 10:08:17 +0000
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de
 [91.198.250.172])
 by plasma.jpberlin.de (Postfix) with ESMTP id 51AEFA7E16;
 Tue, 11 Feb 2020 10:52:05 +0100 (CET)
Received: from plasma.jpberlin.de ([91.198.250.140])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id vqbtu8W4s7R1; Tue, 11 Feb 2020 10:52:03 +0100 (CET)
Received: from [192.168.123.14] (p5B2404A9.dip0.t-ipconnect.de [91.36.4.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id C82A9A6F7F
 for <samba-technical@lists.samba.org>; Tue, 11 Feb 2020 10:52:03 +0100 (CET)
Subject: Re: sambaXP 2020
To: samba-technical@lists.samba.org
References: <1dde7241-b6a9-73f6-23ec-4ac854b2c8b5@samba.org>
Message-ID: <fe57f3f2-0001-c0ec-2198-e76a4bfce70f@kania-online.de>
Date: Tue, 11 Feb 2020 10:52:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1dde7241-b6a9-73f6-23ec-4ac854b2c8b5@samba.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms010206000704050302020103"
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

--------------ms010206000704050302020103
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

I will do the tutorial on the first day. Topic this year will be:

"setting up a CTDB-cluster with GLusterFS" The tutorial-language will be
english.

Am 11.02.20 um 10:48 schrieb Karolin Seeger via samba-technical:
> Hi,
>
> The 19th International User and Developer Conference sambaXP
> (https://sambaxp.org/) will take place from 26th - 28th of May 2020 in
> G=C3=B6ttingen, Germany.
>
> If you would like to give a presentation, you can submit your
> paper here:
>
> https://sambaxp.org/#c11
>
> Call for paper ends on February 29th.
>
> New for this year's event: the Microsoft SMB3 Interoperability Lab (IO
> Lab) from May 24th-29th, 2020, co-located with SambaXP!
> The purpose of the IO Lab is for vendor is to bring their
> implementations of SMB3 to test, identify, and fix bugs in a
> collaborative setting with the goal of providing a forum in which
> companies can develop interoperable products.
>
> Looking forward to meet you there! :-)
>
> Cheers,
> Karolin
>
--=20
Stefan Kania
Landweg 13
25693 St. Michaelisdonn


Signieren jeder E-Mail hilft Spam zu reduzieren und sch=C3=BCtzt Ihre Pri=
vatsph=C3=A4re. Ein kostenfreies Zertifikat erhalten Sie unter https://ww=
w.dgn.de/dgncert/index.html





--------------ms010206000704050302020103
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CdEwggSUMIIDfKADAgECAggJj5xtU8LSUzANBgkqhkiG9w0BAQsFADBmMQswCQYDVQQGEwJE
RTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0c25ldHogU2VydmljZSBHbWJI
MSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBOMB4XDTE5MTAxMzE5MjkxNVoX
DTIwMTAxMjE5MjkxNVowbjELMAkGA1UEBhMCREUxITAfBgNVBAUTGDQwMDAwMDAwNWRhMzdk
NjgyNWJlNjQ0NDEVMBMGA1UEAwwMU3RlZmFuIEthbmlhMSUwIwYJKoZIhvcNAQkBFhZzdGVm
YW5Aa2FuaWEtb25saW5lLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmzcb
kUbyXmjjWRZ0F9Zm420csS+v+4z27A2Ikl4rR1Gt3GBP90gAmlOrCgZdWE1Qr02dmvd9GAoy
kcC1JIF7kvGWhhA14r/ZiUo/37SeRYbhUvuiy/MWUP+88Q/fm7ZNoCaJ7Zpw6mw4k0odedmx
Pizx5zuvTavahTjyLUaVAu0pc94YTx0v2cRItIX+KwJLDgL7aUlSVyFwXgKQRnmtwgxDcgRi
1mB2X0yVZAcSInqWV+fslMul5EcjglnqtpQlVjgu6f7bvzAwsxRDAvmSbuzyPouQUhW9PFPh
jwxtfmDtgbgTG4hPSlh9YsYL082BuOlVjus34I4MbdlX4HILbQIDAQABo4IBPDCCATgwHQYD
VR0OBBYEFPjgjw6OXERQyUR8Mdn+x6ztaGjEMAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAU
6caT0dUPBmRy6mqWProQ8lRUsnkwVgYDVR0gBE8wTTBLBgwrBgEEAfsrAgEDAggwOzA5Bggr
BgEFBQcCARYtaHR0cDovL3NlYzUuZGduc2VydmljZS5kZS9wb2xpY2llcy9pbmRleC5odG1s
MD4GA1UdHwQ3MDUwM6AxoC+GLWh0dHA6Ly9zZWM1LmRnbnNlcnZpY2UuZGUvY3JsL2NybDIt
dHlwZS1lLmNybDAOBgNVHQ8BAf8EBAMCBLAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUF
BwMEMCEGA1UdEQQaMBiBFnN0ZWZhbkBrYW5pYS1vbmxpbmUuZGUwDQYJKoZIhvcNAQELBQAD
ggEBACA2z2AYGWqzRcJH9gyNAJaoCiY08szFTlvuAiiMtgDzSD2L815xYDMqagokIDcN4+Wj
kUJaFtfA6llHpOBFb9HNZCvaxqdqI9iwOBpgUok6EK38ES+gJicaGlOIR8cTJDDebSk3L4ER
6ROytAXleihqkj/OkOGAONoGV13xQllqZUqaV7xZCdwJ9ufWXQVo6uMcFLfZ8RE2H7Tfy9QM
c10c8l/sALPS4R4fJ1dIV47xhUUFZzx9CQeocjQf57oqfeJu7ZDzHJw3X5XZGUy1FSnplBoi
wsFFJn7iJasEpvF+Siy8VIOvuURFPmT7gB9r9h0IhMN0tyKDgYoeJ/ZURZUwggU1MIIEHaAD
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
R21iSDEiMCAGA1UEAwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIICY+cbVPC0lMwDQYJ
YIZIAWUDBAIBBQCgggHhMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIwMDIxMTA5NTIwM1owLwYJKoZIhvcNAQkEMSIEIIF9P9CFr7283seIdmoL4VylUrxk
gRuYJyOvzddQXf/SMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIICY+cbVPC0lMwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AggJj5xtU8LSUzANBgkqhkiG9w0BAQEFAASCAQBoQbx2cIDPxUVho3CjZf8sl8LgEBB7C/KY
5INoRAr7/87KMyl//V8JDtHJU6dqAlQ3CdYG4ENFkQtzM5eDdx5c0I8tUEfW54pPXKVjzWXB
2NRmIG66ic7k81Khv+t4E0MiU4rMvY2gjB8UuKBQaTWzJ9H6/B+asTcOfRtr4sWpvy18kYLw
oPbqvRIKcskNromm7d0BoZfP5nWsXwPQWEGqnVi+GG9v7ssR/t4RanYG2A1JYOueAJ/t7FK6
b2etzL7OwXRh24NvH7OyQCXF6lEongp9MGhWawXTLQG5Jn1p/fEtqzbeg3u22D1IjhutjMti
BR801sVDB15FX9MOMmgGAAAAAAAA
--------------ms010206000704050302020103--

