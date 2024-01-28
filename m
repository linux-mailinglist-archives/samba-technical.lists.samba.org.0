Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 714E983F653
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jan 2024 17:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Rwl9oRBD1dOf0hjsaRZ1925+1ApeGybRdWhKDN4Vs7w=; b=LCKteMfJcnjdmkaRuNtqHQjgKd
	xNbnAcxAZP9f3IJEje10IIA0QuOQ5Z4DFbCXKmNqWO9glQ/nuWfJGDspgA+79bbqo0NzkxWPl9Uvh
	39OG0ipkpRFWCIeT3oCguayDmXrZjE+HO84Wrxd09Bb+np6SFT5eu9HH9In+a0Vb780pq6rgzygSp
	dmlPG/x1MlpStB/XHFKBMmIX08rRzqN0+ZWIysdfdqgR1xT4jQ48KvXaO3XTfBwDPgYPFvLwjR7Ww
	SpAxd82LH9fDYVW4UACWkCEBM/5V6h4+8bqk0bsEwxvezoUpSYDBNrxUth40p7b6oDBSMfMsPnSQR
	OG5NDe9w==;
Received: from ip6-localhost ([::1]:50406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rU7hn-004lkY-2T; Sun, 28 Jan 2024 16:08:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45752) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rU7hg-004lkN-Hi; Sun, 28 Jan 2024 16:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=Rwl9oRBD1dOf0hjsaRZ1925+1ApeGybRdWhKDN4Vs7w=; b=s8nlSuLPpDnSiiTUIxedU+7K77
 mNVXC05yu1KW8AoJlavWWO50ObtIsqiA2148fGTRxo/Twzj3cVr2fY6AyGtYrky9RMsI1x3pjT25R
 i8qoayWZsNJYJV/Kh2A97DSI/bTi/8y7GVhkdnRx9O2HjKFv3CcjopXZtvdAQQXuEF/QIPtY85zW9
 Okhs+4VyGCr9kCXavVf0ziKHO+/0mM05dU2Z0JoA0ZcQWW/pQ9JhMFLJmBs6Vz7ZehUAi24+X7fel
 evnsiHmbSgPvbi+uFAh/FIX+iRoaMMfwxL+oA/xYlbgwPgUMvw405e/e6NZ4Y9wp3EIaI3j9bolVO
 UqkPioVOYwPBILgnfGjWKU8kTDgvCalvCE8OY+3BriwKX+r4mY4ipcI/ybEoK2B+h3pqxHFzhnWNK
 N8kH6yj5mnHSi+fjSszOsefQ+PBtBe5wYP+dl2IsgYywwiTRg2/gwxILv8YXcAGP8/Vf9Pn66mL6l
 ecXGWCfkjeDLt7N+kvht9p/3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rU7hd-00ADmS-1H; Sun, 28 Jan 2024 16:08:13 +0000
Message-ID: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>
Date: Sun, 28 Jan 2024 17:08:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
Subject: Invitation to SambaXP 2024: digital & free - 17th and 18th of April
To: samba-technical@lists.samba.org, sambalist <samba@lists.samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------91nL3XhCwc3xEilAKbEv3mUM"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------91nL3XhCwc3xEilAKbEv3mUM
Content-Type: multipart/mixed; boundary="------------ZySEAD2S8yxmgVQbbkd0aEU4";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical@lists.samba.org, sambalist <samba@lists.samba.org>
Message-ID: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>
Subject: Invitation to SambaXP 2024: digital & free - 17th and 18th of April

--------------ZySEAD2S8yxmgVQbbkd0aEU4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gU2FtYmFzIQ0KDQogRnJvbSAxN3RoIGFuZCAxOHRoIG9mIEFwcmlsIDIwMjQsIFNl
ck5ldCB3aWxsIGJlIGhvc3RpbmcgU2FtYmFYUCBmb3IgDQp0aGUgMjNzdCB0aW1lLg0KDQpU
aGUgT3JnYSBDb21taXR0ZWUgaGFzIHB1Ymxpc2hlZCB0aGUgYWdlbmRhIGF0IGh0dHBzOi8v
c2FtYmF4cC5vcmcuDQoNClNhbWJhWFAgaXMgdGhlIGFubnVhbCBtZWV0aW5nIG9mIHRoZSBp
bnRlcm5hdGlvbmFsIFNhbWJhIHRlYW0gYW5kIGl0cyANCmVjb3N5c3RlbSBvZiBkZXZlbG9w
ZXJzLCB1c2VycyBhbmQgdmVuZG9ycyBhbGwgYXJvdW5kIHRoZSBnbG9iZSBzaW5jZSANCjIw
MDIuIFRoZSAyM3JkIGNvbmZlcmVuY2Ugd2lsbCB0YWtlIHBsYWNlIG9uIDE3dGggYW5kIDE4
dGggb2YgQXByaWwgDQoyMDI0LiBJdCB3aWxsIGJlIGhlbGQgZnJvbSAzcG0gdG8gOXBtIEdl
cm1hbiB0aW1lIHpvbmUgKENFU1QpIGFzIGEgDQpkaWdpdGFsIGV2ZW50IHZpYSBab29tIC0g
b3BlbiBtaWMgYW5kIHZpZGVvIHdpbGwgYWxsb3cgdGhlIGNvbW11bml0eSB0byANCmludGVy
YWN0IGluIGEgYmV0dGVyIHdheS4NCg0KVGlja2V0cywgd2hpY2ggYXJlIGZyZWUgb2YgY2hh
cmdlLCBhcmUgYWxzbyBhdmFpbGFibGUgdGhlcmUuIFRvIGFsbG93IGFzIA0KbWFueSBwZW9w
bGUgYXMgcG9zc2libGUgd29ybGR3aWRlIHRvIHBhcnRpY2lwYXRlIHRoZSBwcm9ncmFtIHdp
bGwgc3RhcnQgDQphdCAzIHBtIChDRVNUKSB0byBzZXJ2ZSBhcyBtYW55IGRpZmZlcmVudCB0
aW1lIHpvbmVzIGFzIHBvc3NpYmxlLg0KDQpUaGUgYWN0dWFsIGNvbmZlcmVuY2Ugd2lsbCBi
ZSBvcGVuZWQgYnkgY2hhaXJtYW4gSmVyZW15IEFsbGlzb24gKEdvb2dsZSANCi8gU2FtYmEg
VGVhbSkgb24gQXByaWwgMTd0aCBhdCAzcG0uDQoNClNwZWNpYWwgdGhhbmtzIGdvIHRvIHRo
aXMgeWVhcidzIHNwb25zb3JzIEdvb2dsZSwgTWljcm9zb2Z0IGFuZCBTZXJOZXQuDQoNClRo
ZSBjb25mZXJlbmNlIGlzIGtpY2tlZCBvZmYgb24gQXByaWwgMTZ0aCBieSB0aHJlZSB3ZWJp
bmFyczoNCg0KKiBTdGVmYW4gS2FuaWE6ICJGdW5jdGlvbiBMZXZlbCAyMDE2IHdoYXQncyBu
ZXciDQoqIENsYXVkaW8gSi4gQ29uY2VwY2nDs24gQ2VydGFkOiAiQ8OzbW8gY29uZmlndXJh
ciB1biBkb21pbmlvIFNhbWJhIDQgZGUgDQpBY3RpdmUgRGlyZWN0b3J5Ig0KKiBCasO2cm4g
SmFja2U6ICJTZXR0aW5nIHVwIFNBTUJBIG9uIEFJWCBhbmQgcGlja2luZyB0aGUgbG93IGFu
ZCB0aGUgDQpoaWdoZXIgaGFuZ2luZyBmcnVpdHMiDQoNCkRldGFpbGVkIGFic3RyYWN0cyBh
bmQgZXZlcnl0aGluZyBuZWVkZWQgZm9yIHBhcnRpY2lwYXRpb24gY2FuIGFsc28gYmUgDQpm
b3VuZCBhdCBodHRwczovL3NhbWJheHAub3JnLg0KDQpBbnkgcXVlc3Rpb25zPyBZb3UgY2Fu
IGFsd2F5cyBjb250YWN0IHRoZSBMT0Mg4oCTIGp1c3QgbWFpbCB1cyBhdCANCmxvY0BzYW1i
YVhQLm9yZy4NCg0KU2VlIHlvdSBhbGwgb25saW5lIQ0KLVJhbHBoDQoNCi0tIA0KUmFscGgg
Qm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8N
ClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFt
LXNhbWJhDQo=

--------------ZySEAD2S8yxmgVQbbkd0aEU4--

--------------91nL3XhCwc3xEilAKbEv3mUM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmW2e+wFAwAAAAAACgkQqh6bcSY5nkaL
vhAAtVXLvHCnUElql1PCHgRzgl56ReD3jDhx2SJHAufJL6WirBsF1GB/GEZXSd5lBgpuX4qioZfJ
PdpQaPojeq4cplQgkkzkaVSyTI/TqLIpIVYKac+SqpklIi5o/9C76dl89LPV/bctc0dy1rIT5GRP
+PK+nkLJy+DSGkQAwGFlOryxL6T/Ho8T+9HahQ+yewwCUFQGAN6yst/QRe0tlNvhyNo9JPXy/bgp
gH47XlzMlphAUbaEh/Xb5mzQUTSRkBXnbYV9JVzvstOyM5zkBm/0/PLLw4NSUQJKQgSMSd+NFCDb
NuhERpSyDBfjQAkSxtiDUOvct3RaJw4zX71WfaKTtlRTsWMbY+ng2k46STrcnl2+KjN+B4IaHyGB
ka5eLEni6sihoffDik5W1Q1Fj1G7ct+ilxH+/ZvlVe+qhZhjTKD4/CtkFeiOGWFrdnzpsMCnu2Hc
8L12dED8VhXAFo2sETDYJ/WA3yAGSfLSTq4Y9hJvxT97a9HPn/1dgOWgTNVD3aZPNofMk1ZYSXJp
ZB8sC1LWfEf3ZT7kYUpc2cIFWE1AtlcYNWD4CMG5fXXKjN/jNkl175pncRGAAbqLUgFkO9nln+fM
BUl3p/jH7MQqmv6L/vgiiQLtfkJXAPOkg7K11IQGoVCHjSs9qVuN8U9fJiy8wEkSOa0FAMH/VIzT
7Z8=
=/v2s
-----END PGP SIGNATURE-----

--------------91nL3XhCwc3xEilAKbEv3mUM--

