Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D46F99F509
	for <lists+samba-technical@lfdr.de>; Tue, 15 Oct 2024 20:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pzZOB7Et1ISImVxIy/L5yzYJiysGUQ1TfHcmLzo8Igk=; b=KepBTOjEEZM1V1hZME81seK5jh
	A0Wzx+x4TXNZ15n5dLCFFYayaP1dExu3Xv1YJVgoz4HMOBE0SFyrrGjOgjXlBe8a2aMrNsoAi2E8m
	avRPVp9ZTEQ7Jc7kJe+xs0TGZCP1esGrCjSl+9QrpQ3aYl91VtFwyx1qRdI1MykGDgugc6dqd1yBy
	prlt1zlFhK0KuJxVE6ThEj7pPOd5KWpPm/DavRyw6zUswi6mpeH3OD4b/NYxCWTdmRnkPhSd0x9rk
	bk8LtF5Hmbij5lo1qHjYI7t22+xpKn/+RNaR5GHPNnIc1keaE92useNTLjYf4GwD/lmqv+h1Q8MNN
	OatPwhFA==;
Received: from ip6-localhost ([::1]:32798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t0m7F-0045GA-2i; Tue, 15 Oct 2024 18:17:53 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:38069) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0m7A-0045G3-QX
 for samba-technical@lists.samba.org; Tue, 15 Oct 2024 18:17:51 +0000
Received: from spamfilter04.heinlein-hosting.de
 (spamfilter04.heinlein-hosting.de [80.241.56.122])
 by plasma.jpberlin.de (Postfix) with ESMTP id 2B88FB72F9;
 Tue, 15 Oct 2024 20:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1729016263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pzZOB7Et1ISImVxIy/L5yzYJiysGUQ1TfHcmLzo8Igk=;
 b=LYjSnizCGfJSiPjIXcFKoxFhthVhf4ZVrB86EhfESO3uqmVGqca6yQvdY2H80qEvfWGt+R
 V5h6cfDGd0tSeVP4AfHJh4Lpif/ZnLSiphzMYB7upF8knQJeQiHV8Lr3y4KE5IB9WxqQho
 1aFc00Ckpmp/TswvqJHIsaxreF288UgjIxugOsJ+ok+vgt5JOZM/IXn/J/ts+xoCTXPGTh
 b4vnvAtSXdYIzWf+kMbfHbDtkrNg+oRU3SYHTBX5r4F1xorBJLxy63hvb5jLhPdcnzzlam
 t6HV1rwWW0Pv0TKorF8BFQgURFKiHHnO5K4V1R5Zd1LMhqrCs5PLjsdIvZy9Hg==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id hveXRjFWcLcY; Tue, 15 Oct 2024 20:17:36 +0200 (CEST)
Received: from [IPV6:2a01:599:813:5134:982b:283b:4890:1d68]
 (tmo-116-201.customers.d1-online.com [80.187.116.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id E3911B7297
 for <samba-technical@lists.samba.org>; Tue, 15 Oct 2024 20:17:35 +0200 (CEST)
Message-ID: <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
Date: Tue, 15 Oct 2024 20:17:34 +0200
MIME-Version: 1.0
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
Content-Language: de-DE
Organization: Stefan Kania
In-Reply-To: <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms060608090908020404090707"
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

--------------ms060608090908020404090707
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmVubmlmZXIsDQoNCnRoYW5rIHlvdSA6LSksIG5vdyBJIHNldCB0aGUgYXV0aC1wb2xp
Y3kgd2l0aCAhPS4gTm93IEkgY2FuIHN0YXJ0IA0KdGVzdGluZyB0aGUgcG9saWNpZXMgYW5k
IHNpbG9zLg0KDQpTdGVmYW4NCg0KQW0gMTQuMTAuMjQgdW0gMDE6Mzkgc2NocmllYiBKZW5u
aWZlciBTdXR0b24gdmlhIHNhbWJhLXRlY2huaWNhbDoNCj4gT24gMTQvMTAvMjQgMTI6MzMg
cG0sIEplbm5pZmVyIFN1dHRvbiB2aWEgc2FtYmEtdGVjaG5pY2FsIHdyb3RlOg0KPj4gc2Ft
YmEtdG9vbCBkb21haW4gYXV0aCBwb2xpY3kgbW9kaWZ5IC0tbmFtZSB3aW4xMSANCj4+IC0t
Y29tcHV0ZXItYWxsb3dlZC10by1hdXRoZW50aWNhdGUtdG89TzpTWUc6U1lEOihYQTtPSUNJ
O0NSOzs7V0Q7KEBVU0VSLmV4YW1wbGU6Ly9leHQvQXV0aGVudGljYXRpb25TaWxvICE9IFwi
d2luY2xpZW50LXNpbG9cIikpIg0KPiANCj4gT2gsIHByZXRlbmQgdGhlcmUgd2FzIGEgZG91
YmxlIHF1b3RlIGFmdGVyIA0KPiDigJgtLWNvbXB1dGVyLWFsbG93ZWQtdG8tYXV0aGVudGlj
YXRlLXRv4oCZLg0KPiANCj4gQ2hlZXJzLA0KPiBKZW5uaWZlciAoc2hlL2hlcikNCj4gDQoN
Ck5ldWVyIEdQRy1LZXkgZGVyIHB1YmxpYyBrZXkgYmVmaW5kZXQgc2ljaCBpbSBBbmhhbmcN
Cg0KDQo=

--------------ms060608090908020404090707
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: Kryptografische S/MIME-Signatur

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
DLMwggYDMIID66ADAgECAgwEaYxY0V6t5+cpnHAwDQYJKoZIhvcNAQELBQAwUjELMAkGA1UE
BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24g
R0NDIFI2IFNNSU1FIENBIDIwMjMwHhcNMjQwOTI3MjAwMTE2WhcNMjcwOTI4MjAwMTE2WjBI
MR8wHQYDVQQDDBZzdGVmYW5Aa2FuaWEtb25saW5lLmRlMSUwIwYJKoZIhvcNAQkBFhZzdGVm
YW5Aa2FuaWEtb25saW5lLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk1Wp
pY9PMd6TNd+nUvWJ3RkA7fXwaZYBPlz+HyIh43KCUohVW0dweP44qfMBHjlVrAsgC6+VI+bd
EWjvF9ZcWLHIj/IxonVe1HnN1DfYwp7/1qigJBjmfNwcdqlHHgRJ/WW8TblYLshwB94c+b5L
J6ScRf4KCLYgTjmX/+/OpV9Zfzn0NvGNfyakUpeEz/36Mr1UPtWVchsGpuCsoGbylE0AOZug
z2yOoLxAmd5YYLVI0uZ3IM1iGZPVcN0P9r9F1Gap4Vm9mi6+chx+ScAu/WfdzaBVlFoXA7w6
X/QxpQXtnifpKxqE5qqrPqCCo9sXLLgD3yW1iFcBVTgzNyZQRwIDAQABo4IB4TCCAd0wDgYD
VR0PAQH/BAQDAgWgMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIz
MGUGA1UdIAReMFwwCQYHZ4EMAQUBATALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAzA0MDIG
CCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNV
HRMEAjAAMEEGA1UdHwQ6MDgwNqA0oDKGMGh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3Nn
Y2NyNnNtaW1lY2EyMDIzLmNybDAhBgNVHREEGjAYgRZzdGVmYW5Aa2FuaWEtb25saW5lLmRl
MB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68t
UC3boCOFGLCgkjAdBgNVHQ4EFgQU0kHF9fFBXygVDjwNe5DkaSxVk3cwDQYJKoZIhvcNAQEL
BQADggIBAL0WoW7dCmTQxxo1dMGyld5LLS9wCa7goc07GplzOsEJ5GmfeNGapy+dP2NfmenH
XYKPnP/8hosTk6GDgck1HaP4wP5RvZ4ALVraLs4XSQiENz9954Sim3YzjFbG2aoqXpv/C0ha
MwzR7LBCa/OwUJot5wO7R++6SE98/ZeYUqGDIgVcmH+UOYE/5yxM+M4aDXFUR2LCQO2ejPcZ
a3QzlnMJUYPPw3U4Udbs9MRy40FunbmWUzu4yEddlo9GikG5NEI6wC7hFEpC4joYmvEZXRlT
UqS8wug7QKRLyeLhXw04h0GYL0mrx1yj7x4CXqRjjRpterRlAkgFj2zEEpQ4DMiVcl8fZZ7T
xkQGlbfa+HEp9y9/NluiNeoqAMF/lzS8haLHDXLdrdWPitBQazmcsyQ3LlcmeAMjchOIcUWt
EKxIRCoedt6xbuIX5D2ul0H6rPE2BrimedwF6AZFPFk3/KHAbjhfkAElHiNjgg4uwUji+d9q
zIR6Di3W2WdTCCwzp/6V2eEWdlQ8z8U4v3aF80fwzp6dOuFmti/mOayUrAYCUC6DBLjkA4EY
MS6Nc1dr4f4dffnOceF4deCDN3nH8bRPEXs+kvnA91vw008dvJ+Df7jcJmDrt2tmzZPDTV6l
neB5rj7E+6Qcvadj6c5hl7L5Tc/v6LZx6DCVX0BA2KpPMIIGqDCCBJCgAwIBAgIQfofDCS7X
Zu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3Qg
Q0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0y
MzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBH
bG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn26Zn9VtoE/xB
vzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlchatYqyOR
VBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYjytEd
vfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk
6tmG71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03l
VxiA1xyfG8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMD
s/rWyQ64v3mvSa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFk
xoGc1ckM8ZoMgpUc4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7
dEW391KKxGhv7MJBcc+0x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0
CLDdMNgoxgkCAwEAAaOCAX4wggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEF
BQcDAgYIKwYBBQUHAwQGCisGAQQBgjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsG
AQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOF
GLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0w
LgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9iYWxzaWduLmNvbS9yb290cjYwOwYIKwYB
BQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L3Jvb3QtcjYuY3J0
MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vcm9vdC1yNi5j
cmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4ICAQCRkUdr1aIDRmkNI5jx
5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcnbHUStur2/nt1tP3e
e8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79YIgbYWATB158t
vEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1Q3BTNKSr
HrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXrdJPK
adpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3
uw75AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKW
MI0hL0b4mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOg
OgYL4QIqNULb5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0
q1jXWLyrpgP7ZcnuCzGCA1AwggNMAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEds
b2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIw
MjMCDARpjFjRXq3n5ymccDANBglghkgBZQMEAgEFAKCCAb8wGAYJKoZIhvcNAQkDMQsGCSqG
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQxMDE1MTgxNzM0WjAvBgkqhkiG9w0BCQQxIgQg
CPsB6lFeKamcpD5A6W29Rq0q81y1/J95nDPDtlUeLXEwbAYJKoZIhvcNAQkPMV8wXTALBglg
hkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggq
hkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDBxBgkrBgEEAYI3EAQxZDBiMFIx
CzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwEaYxY0V6t5+cpnHAwcwYLKoZIhvcNAQkQ
AgsxZKBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYD
VQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwEaYxY0V6t5+cpnHAwDQYJ
KoZIhvcNAQEBBQAEggEALN7AXnyvnofac80GTRfjyTSb0YnFKtUk2kR18wte/m7mVeub58at
rPE4aRG84Hl3Dae+tCxQjhMV8BOI3a84koeE4ZfLbm2lbk0OfQA+51mAFc0FQ66ba3YVhniz
HDTn+UGd0ZQymCOz1JIBomDvJVYkqJXbldq+aXLmqtfDlDeyMV3XG65eip/3O3eIb7f/CY0Q
p5Kni9j7Y5ysImHD02HXn5IyU4z2410uJD/oAFNUEQ675GrfwE5/9Kpg3Tyu5HQ4e/O7eWv9
Em3PwojPkGk7DEO475IKycrVtzJ58jFp+T7ayIwvtgIujPGb9OzVf/iVRySWro4tw5eaHrWV
oQAAAAAAAA==
--------------ms060608090908020404090707--

