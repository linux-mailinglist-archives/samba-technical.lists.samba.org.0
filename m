Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AB599DECA
	for <lists+samba-technical@lfdr.de>; Tue, 15 Oct 2024 08:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bYoxbXLHxK1kgIXKbO2jUi14bXrjU4Uz8kY78v/ZRKg=; b=iy7MUxoj+CiAgYZ3oM8GeZeL0+
	xD3qQnIQC45a203fZ7TKid+cBs+StCVtJtuuAQ6yE7T0Z3Bz25+gFWyj1N+jNO0FZNAXgOqJt9cVq
	c3n1fziimq0SWJzh9tj4aW1vTKREl+WiiBOdTRsXZkzT279ZiTjP+tKgHVhc9Pj8OB1qmvUD9NcK7
	/32DI1S51Ns1A5e/GUTi1ymZ8BTkbLSWF0+/haW1ePN5QxUtNaBVrAcsxNuLTNr6K81SryG0Tyy/T
	D45QQ7nI8xBkhDXoARy/g1JtSY80O3lgQv1pSohmKA8W9lkwr4bNZ463Llu3rpSWR4AETrV8y2AQy
	iYbZa5rw==;
Received: from ip6-localhost ([::1]:57134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t0bRT-0040SX-Hj; Tue, 15 Oct 2024 06:54:03 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:46059) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0bRL-0040SP-2y
 for samba-technical@lists.samba.org; Tue, 15 Oct 2024 06:53:59 +0000
Received: from spamfilter02.heinlein-hosting.de
 (spamfilter02.heinlein-hosting.de [80.241.56.116])
 by plasma.jpberlin.de (Postfix) with ESMTP id 475A2AC36E;
 Tue, 15 Oct 2024 08:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1728975229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bYoxbXLHxK1kgIXKbO2jUi14bXrjU4Uz8kY78v/ZRKg=;
 b=oze77EW6NLgo2xRm3oWKR7Bue9QWXkXYItFpjZE4jmYWTjHbXLG9NMfbGc7BeMERkR0eDJ
 L6vgiB4Dv6OhMZoB0eNMb9IY0zwiJ11U+tdzWrt/yvOdwsIR7wRc2GPM+f2foa3gKKVmDv
 yCpxHEKhY3OiRezXpWAmygWHcQojwhqptFHf6HoINUi4ldecmB2Z6MnMmwq4GxUwb6M4D7
 5oNmIM5R4VyZgEutuulWMfwCGZ9L1wfIyE6P43qS/MLhOuGUKiRxdiMLopzEkgAYlkg90F
 ojIfzIhWjt6OVyP+3yic6AOYW4QOR2rfC3FMzjiJJdiLbbdy82QBH1JDmyCckg==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id MZ073nQMFDHF; Tue, 15 Oct 2024 08:53:43 +0200 (CEST)
Received: from [192.168.101.179] (i689719B5.versanet.de [104.151.25.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 73C1BAAC8C
 for <samba-technical@lists.samba.org>; Tue, 15 Oct 2024 08:53:43 +0200 (CEST)
Message-ID: <78b1c795-0b68-470e-ae1d-3626aad8d7d6@kania-online.de>
Date: Tue, 15 Oct 2024 08:53:43 +0200
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
 micalg=sha-256; boundary="------------ms090801010102090303070006"
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

--------------ms090801010102090303070006
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SSB3aWxsIHRyeSB0aGlzIHRvbmlnaHQsIGhvcGUgaXQgd2lsbCB3b3JrIDotKQ0KDQpBbSAx
NC4xMC4yNCB1bSAwMTozOSBzY2hyaWViIEplbm5pZmVyIFN1dHRvbiB2aWEgc2FtYmEtdGVj
aG5pY2FsOg0KPiBPbiAxNC8xMC8yNCAxMjozMyBwbSwgSmVubmlmZXIgU3V0dG9uIHZpYSBz
YW1iYS10ZWNobmljYWwgd3JvdGU6DQo+PiBzYW1iYS10b29sIGRvbWFpbiBhdXRoIHBvbGlj
eSBtb2RpZnkgLS1uYW1lIHdpbjExIA0KPj4gLS1jb21wdXRlci1hbGxvd2VkLXRvLWF1dGhl
bnRpY2F0ZS10bz1POlNZRzpTWUQ6KFhBO09JQ0k7Q1I7OztXRDsoQFVTRVIuZXhhbXBsZTov
L2V4dC9BdXRoZW50aWNhdGlvblNpbG8gIT0gXCJ3aW5jbGllbnQtc2lsb1wiKSkiDQo+IA0K
PiBPaCwgcHJldGVuZCB0aGVyZSB3YXMgYSBkb3VibGUgcXVvdGUgYWZ0ZXIgDQo+IOKAmC0t
Y29tcHV0ZXItYWxsb3dlZC10by1hdXRoZW50aWNhdGUtdG/igJkuDQo+IA0KPiBDaGVlcnMs
DQo+IEplbm5pZmVyIChzaGUvaGVyKQ0KPiANCg0KLS0gDQpTdGVmYW4gS2FuaWENCkxhbmR3
ZWcgMTMNCjI1NjkzIFN0LiBNaWNoYWVsaXNkb25uDQoNCg0KU2lnbmllcmVuIGplZGVyIEUt
TWFpbCBoaWxmdCBTcGFtIHp1IHJlZHV6aWVyZW4gdW5kIHNjaMO8dHp0IElocmUgDQpQcml2
YXRzcGjDpHJlLiBFaW4ga29zdGVuZnJlaWVzIFplcnRpZmlrYXQgZXJoYWx0ZW4gU2llIHVu
dGVyIA0KaHR0cHM6Ly93d3cuZGduLmRlL2RnbmNlcnQvaW5kZXguaHRtbA0KRG93bmxvYWQg
ZGVyIHJvb3QtWmVydGlmaWthdGU6IGh0dHBzOi8vd3d3LmRnbi5kZS9kZ25jZXJ0L2Rvd25s
b2Fkcy5odG1sDQoNCk5ldWVyIEdQRy1LZXkgZGVyIHB1YmxpYyBrZXkgYmVmaW5kZXQgc2lj
aCBpbSBBbmhhbmcNCg0KDQo=

--------------ms090801010102090303070006
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
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQxMDE1MDY1MzQzWjAvBgkqhkiG9w0BCQQxIgQg
RQgpwHif9sNk7tm3p1lrmlHsUfIm48bMXgL56Cx5/dowbAYJKoZIhvcNAQkPMV8wXTALBglg
hkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggq
hkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDBxBgkrBgEEAYI3EAQxZDBiMFIx
CzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwEaYxY0V6t5+cpnHAwcwYLKoZIhvcNAQkQ
AgsxZKBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYD
VQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwEaYxY0V6t5+cpnHAwDQYJ
KoZIhvcNAQEBBQAEggEAa/5jJUnuNXhC1CyogMCCJ1s+72peRm7GHpX0H56muVG8wVFI91ZN
gYUuPZygUZXphhto3Tk37Kx8IdB+oVEh4NZR255AXRrKP2pfZsgQxAp+1bA/9Fr8WzHSV82R
y+JoJOwpgj20jN1sn9ptN3j5OFpgEJnWO37WSQBccO4J27OVFPztmzVAfjrxAViesiIRXOUz
HlzJsA4n461MhaRZJdUKALkOvl5KD8Oq0z2HDNIKuYSJKXOz5CiTobvev7nQrKodlpiDgcBY
0Tt0ECNcoSOx8rsVn/H+GDWuGs5nAcLEeazKpyXs4lJdV5TFVEw+SUVa1Jlb80Z2TQx1FdG/
lQAAAAAAAA==
--------------ms090801010102090303070006--

