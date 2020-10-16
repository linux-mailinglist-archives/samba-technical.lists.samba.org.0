Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6C5290C83
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 21:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=XOJlxKqqmqdM5ntRs+T4QrzekkUkCobx6k292E25SMw=; b=j+QFdjp5q8e2HkWMlPqwrQ8dwB
	7pEAg2zyR9FEnQeeP74B6XQUL6RSUfXOazMBNTjOc5wb7dtqjF+jNuBqhg8STyhCUm6V78Qc15EKZ
	W1PFkt6Jjhrnfye3yD0uVBSCOaoPX66dd0U4nKbHxAsGPvEqUy11yj9lILja8dP+7BA3F7z/GGpe1
	Y7+p/lqZnc5oZJO5e/78Mo92yCGyAmVQVl+T5CJzb1DCFnXiWrpJqdQ+03d1QIQHm4mkPP3SujhgV
	vrl6YMGQBpfYVDmb7OBy4X1/DO0E2WPZ5u/5heUA6McHqoDzQulSdjcOogTOPsEYbBtaidfXEjsbz
	QT4rGmpA==;
Received: from ip6-localhost ([::1]:59882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTVrq-00CRof-Go; Fri, 16 Oct 2020 19:58:22 +0000
Received: from plasma4.jpberlin.de ([80.241.57.33]:59781) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVrk-00CRoY-Jx
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 19:58:19 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 3EE5EA6E70;
 Fri, 16 Oct 2020 21:42:15 +0200 (CEST)
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id WkcimTa1Oako; Fri, 16 Oct 2020 21:42:11 +0200 (CEST)
Received: from [192.168.123.249] (p5b240703.dip0.t-ipconnect.de [91.36.7.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 48876A6AEE
 for <samba-technical@lists.samba.org>; Fri, 16 Oct 2020 21:42:11 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: dns.keytab file
Message-ID: <e459994f-01f1-afc6-eb21-7f639f96bf82@kania-online.de>
Date: Fri, 16 Oct 2020 21:42:10 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms050405070209070400060002"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -5.53 / 15.00 / 15.00
X-Rspamd-Queue-Id: 3EE5EA6E70
X-Rspamd-UID: d3a325
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

--------------ms050405070209070400060002
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

is there a reason why there is no /var/lib/samba/bind-dns/dns.keytab on
any other then the first DC in a domain? The first DC has two dns.keytab
files (/var/lib/samba/private/dns.keytab) and
(/var/lib/samba/bind-dns/dns.keytab). All the following DCs have only
the on in /var/lib/samba/private, also the file-permissions for the
bind9 are wrong on any other then the first DC. Up to this point I
copied the file and changed the permission manually, but now I try to
setup all DC via Ansible and I have to create more tasks depending if
it's the first or second ... DC.

So is it a bug or a feature

Stefan

--=20
Stefan Kania
Landweg 13
25693 St. Michaelisdonn


Signieren jeder E-Mail hilft Spam zu reduzieren und sch=C3=BCtzt Ihre Pri=
vatsph=C3=A4re. Ein kostenfreies Zertifikat erhalten Sie unter https://ww=
w.dgn.de/dgncert/index.html





--------------ms050405070209070400060002
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
MQ8XDTIwMTAxNjE5NDIxMFowLwYJKoZIhvcNAQkEMSIEIIBFn+Wp+uW008jQjt9hFy8gPyRU
h/AibGnICAddLAmIMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
AjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcw
DQYIKoZIhvcNAwICASgwgYEGCSsGAQQBgjcQBDF0MHIwZjELMAkGA1UEBhMCREUxMzAxBgNV
BAoMKkRHTiBEZXV0c2NoZXMgR2VzdW5kaGVpdHNuZXR6IFNlcnZpY2UgR21iSDEiMCAGA1UE
AwwZZGduc2VydmljZSBDQSAyIFR5cGUgRTpQTgIIC/vJLMeWh4kwgYMGCyqGSIb3DQEJEAIL
MXSgcjBmMQswCQYDVQQGEwJERTEzMDEGA1UECgwqREdOIERldXRzY2hlcyBHZXN1bmRoZWl0
c25ldHogU2VydmljZSBHbWJIMSIwIAYDVQQDDBlkZ25zZXJ2aWNlIENBIDIgVHlwZSBFOlBO
AggL+8ksx5aHiTANBgkqhkiG9w0BAQEFAASCAQDeb/xuWVAnFgPM0vwxPxODmoUwdXzKPMTR
hmwCKyU4msy+gVar8+IDMbU1ITHTaNr7VORcgL75VqdkjzfzqKRzQS6SF/prGRD6zMfTqj7g
KYZx/S6xvEVozFGV2Pdd7oO9utZnabvaPVwRoh3m7ltHqHB77lm9eTSb8rhdH55VyKbb+ZFk
bS8/mpZ1a6SZimUn3lbZsiTMSuwvDHFDOFpZnqRoOeNAdwJz6ezO5D/xsnQnY4mBFFUEPlK0
H1OirDWpKmysTdM74U7HLjAbmJnobTEtPdnRCWCoe3kb0qK+vbgwVjUDrnzxgd2XQOvePYIc
e6Dhs45dRXyDG/xTlMIuAAAAAAAA
--------------ms050405070209070400060002--

