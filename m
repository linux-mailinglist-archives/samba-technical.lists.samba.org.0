Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FAC99B61C
	for <lists+samba-technical@lfdr.de>; Sat, 12 Oct 2024 18:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=hObeICzrCMVOi2C9h2edDmCm1Nyy3l+dyc1r6FsGExQ=; b=HnuSFasRZ5r/sKOjlStF4T7L0D
	VfUwuXFD7G5KU9AhEKWl1Diz/xdUXvjIFRWnAjr3RMgC0oP7kdXn8YINMeupWDb8Kt/FUiulmC0Ob
	68GT/81XweGHnn46oHgnrOB+aJF416xtWLGCfUSNwpT3CHx4MHmB7u3jGxyEBgn27Sm8yWgv+7KQq
	4Bb3dmopWzkhzWrmjSwN1vo6L/BYe3lMrWMQyQ/KrXEK9kmxH4ltm077InSHmNN2mxzSSHkl8WU20
	o122K5VVwMnqBQ2GNfcbGteZDw5uaUPhxlILyA+RuFieWpF8PHU1kXxc/jn2SM8DDCm9vTHQk3wZF
	dYaPs6MA==;
Received: from ip6-localhost ([::1]:36160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1szfSW-003kVW-VL; Sat, 12 Oct 2024 16:59:17 +0000
Received: from plasma6.jpberlin.de ([80.241.56.68]:56393) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1szfSS-003kVP-Ki
 for samba-technical@lists.samba.org; Sat, 12 Oct 2024 16:59:15 +0000
Received: from spamfilter04.heinlein-hosting.de
 (spamfilter04.heinlein-hosting.de [80.241.56.122])
 by plasma.jpberlin.de (Postfix) with ESMTP id 73437AAFC2;
 Sat, 12 Oct 2024 18:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kania-online.de;
 s=MBO0001; t=1728752346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hObeICzrCMVOi2C9h2edDmCm1Nyy3l+dyc1r6FsGExQ=;
 b=YV4YPXAwPIGuosLfCaMKJzAtQSJGLsPZowBAD0NUZHsAcfLE+9kefkvAXzOeat6XAdM1HU
 F2+gtPHvByu/NcXKQdQGixCbYrd56hgWAZN8SfEFYTA2JEwC8rLwtXnam+HmunEHZWxynP
 Hs5CKag6MoDrrNXjaxrjBxYInmy4XMM5JuTo4sTv7iu6H5tN519gWAxTXDaAtqCtDGUUs9
 SchL1hQVaLFevvSk8TNPWZ2Vq2yiOhiU4YAdARUQRcAs/EQ6WDtpXOS9LttyNs07lb9lnl
 XytaX36TajvLpbKceFFB36LnrME7QQ1NonNbxS0SY9W3ZZAxVtlKIZjzDWP7+Q==
Received: from plasma.jpberlin.de ([80.241.56.68])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id BNJtogbjlc27; Sat, 12 Oct 2024 18:59:05 +0200 (CEST)
Received: from [192.168.123.225] (p5b240946.dip0.t-ipconnect.de [91.36.9.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: stefan@kania-online.de)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id DBC45AB01B
 for <samba-technical@lists.samba.org>; Sat, 12 Oct 2024 18:59:04 +0200 (CEST)
Message-ID: <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
Date: Sat, 12 Oct 2024 18:59:04 +0200
MIME-Version: 1.0
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
Content-Language: de-DE, en-US
Organization: Stefan Kania
In-Reply-To: <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms050204080205010406070507"
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

--------------ms050204080205010406070507
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmVubmlmZXIsDQoNCkFtIDEyLjEwLjI0IHVtIDAyOjUzIHNjaHJpZWIgSmVubmlmZXIg
U3V0dG9uIHZpYSBzYW1iYS10ZWNobmljYWw6DQo+IFRoZSBwcm9ibGVtIGlzIHRoYXQgU0RE
TCBoYXMgdHdvIHNlcGFyYXRlIHJlcHJlc2VudGF0aW9uczogdGhlIGVuY29kZWQgDQo+IGJp
bmFyeSByZXByZXNlbnRhdGlvbiwgYW5kIHRoZSBTRERMIHN0cmluZyByZXByZXNlbnRhdGlv
biAobGlrZSANCj4g4oCcTzpTWUc6U1lEOuKApuKAnS4gbXNEUy1Db21wdXRlckFsbG93ZWRU
b0F1dGhlbnRpY2F0ZVRvIHVzZXMgdGhlIGJpbmFyeSANCj4gcmVwcmVzZW50YXRpb24sIGFu
ZCBpZiB5b3Ugc2V0IGl0IHRvIGFuIFNEREwgc3RyaW5nIGluc3RlYWQsIA0KPiBuZHJfdW5w
YWNrKCkgd2lsbCBiZSB1bmFibGUgdG8gZGVjb2RlIGl0LCBhcyB5b3Ugc2VlIGhlcmUuDQo+
IA0KT2ssIHRoZW4gaXQgaXMgY2xlYXIgd2h5IEkgY2FuJ3QgY2hhbmdlIHRoZSBzZXR0aW5n
IHZpYSBsZGJtb2RpZnkuDQo+IFRoZSByZWNvbW1lbmRlZCB3YXkgdG8gc2V0IHRoZSBTRERM
IGlzIGxpa2Ugc286DQo+IA0KPiBzYW1iYS10b29sIGRvbWFpbiBhdXRoIHBvbGljeSBtb2Rp
ZnkgLS1uYW1lIHdpbjExIA0KPiAtLWNvbXB1dGVyLWFsbG93ZWQtdG8tYXV0aGVudGljYXRl
LXRvPVNEREwNClNvIHdlIG5lZWQgdHdvIG5ldyBvcHRpb25zIGZvciBzYW1iYS10b29sICgt
LWRlbnkpIGFuZCAoLS1hbGxvdykgdG8gbWFrZSANCml0IHVzYWJsZS4NCj4gDQo+IERvZXMg
V2luZG93cyBjb3BlIHdpdGggYW4gU0RETCBzdHJpbmcgaW4gdGhlIA0KPiBtc0RTLUNvbXB1
dGVyQWxsb3dlZFRvQXV0aGVudGljYXRlVG8gYXR0cmlidXRlPw0KVGhhdCdzIHdoYXQgSSBj
YW4ndCB0ZWxsIHlvdS4gV2luZG93cyBpcyBzZXR0aW5nICJkZW55IiBvciAiYWxsb3ciIHZp
YSBhIA0KZ3VpLg0KDQpTdGVmYW4NCj4gDQo+IENoZWVycywNCj4gSmVubmlmZXIgKHNoZS9o
ZXIpDQoNCg==

--------------ms050204080205010406070507
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
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQxMDEyMTY1OTA0WjAvBgkqhkiG9w0BCQQxIgQg
3+nYWUwB9E3jo2yXicX/V46Ik4ut4iNxDGYxOnAi+vgwbAYJKoZIhvcNAQkPMV8wXTALBglg
hkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggq
hkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDBxBgkrBgEEAYI3EAQxZDBiMFIx
CzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwEaYxY0V6t5+cpnHAwcwYLKoZIhvcNAQkQ
AgsxZKBiMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYD
VQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwEaYxY0V6t5+cpnHAwDQYJ
KoZIhvcNAQEBBQAEggEAhyVSILSVEqLHGgtfgb2hAWnh74tPTK2Za8JDcH1vqSj5kYoqVhbc
WEVNzDiv7H1bTVnpO9QNDIJAQMZFteEv+RA+90S78XgFXfUnDDQ31ej5SDF5+R3WU1O7ogYP
EzplMGKRXHyxGUqW7gDlqagac7+3dS7z93Rvu8D9yj8rH4DWuJfB9eRcu98T/c9jxGTsbhIg
2I8ZEDGiJT1It/HXK74PbXchwOfsr4inUUxjfELq6LPk9Qv+62/HJPPkTncoD6s+mjh7jCQd
p0fDzUBowV426wNpUicF7XpKEgx8mMd3zMayx3r4n6QJG7ILrVfuSL9HvqEaYYoc7OM71Kp+
gAAAAAAAAA==
--------------ms050204080205010406070507--

