Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35449A25F54
	for <lists+samba-technical@lfdr.de>; Mon,  3 Feb 2025 16:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=HsyAMMtPHi8g3lCaRrexX5w/RyKtdFrbTLYETOmVdP0=; b=DZcXYVSd5Hks9mjB61e5LcvIZ+
	VaJVT4lxLf04uTTo6vXQZMvmryEZ40hGhuXFupj81wE303G7vFTe1ChYlIo19bCq6rkh1QihIHWcx
	GvwE+8z0Cx1bbs9RAbR4bpdc91dwDe4er31TuFga7pN3dU+8gKel2gYAWqKs7q6uS3CiNacLoOzfc
	6VqjtH5BY51agFMoQWvhFufX98qQEg7RnnmqnnNe7QC5nszXZnhgyZvDIcBxsAoT4u0LVW5zCfnMg
	Q/G9rVGVS9zQHZS8TpsvRxjJH6eLDwFE+U8z7ptO/vRayvZNme9YBl8OQehTAzcIIIyR0RXh68SAf
	7R89zHjw==;
Received: from ip6-localhost ([::1]:32320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1teyoX-00Bka8-4i; Mon, 03 Feb 2025 15:56:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55516) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1teyoP-00BkZj-U3; Mon, 03 Feb 2025 15:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=HsyAMMtPHi8g3lCaRrexX5w/RyKtdFrbTLYETOmVdP0=; b=OjpDB6JZapU/UXAZz9ubj19L5K
 KgaBOa8wkaB2+wbTuhqe6GUQ5eidjerMhKz85X0vfG5mXD8WCJMnG5V0BD61Hk2KutvIAmVM4ee58
 8LallWW8WmBNh5FbkY1pIvR3u8qZ6eZxEirxzHqQWF9cwFrzv1iPtvZUwXzpuox+HJSFtXummjX4w
 su4RyLUiSnEHuphEtiaHtxL9MaHuVU1auSBkMd7JJISeYQhOe1avGzIfVBNlNwJPgOjK35j1fSKrP
 E3VRElQLh0ntxI6kd7dg17a/n7BwEcGmGmCqZMtOXJHBv6Tbbx6x8lkvbpzo99UWRTzz3iB1vUWIm
 5Y3o5kTfcO5yJEVUhh4kfHLWf+Easo/XEq+vERk5SdrcHu/0HGMKXOsa9YNhZlftEHrYh/9O2i1+l
 9Sd99eVh+cV63yu6PFOKtS97d7prtva0fzpAX+jHaaO9aFxSMsMWfjP/HNPmoP0xbsIMfHceWyEM8
 u7yxolOJ48LawC6ZPJZNkx6Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1teyoP-000w5S-1l; Mon, 03 Feb 2025 15:56:37 +0000
Message-ID: <63a51802-42e2-4f01-8f9d-c9d6ec817639@samba.org>
Date: Mon, 3 Feb 2025 16:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Fwd: Announcing SNIA SMB3 IO Lab EMEA alongside SambaXP
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Xp4iKf0jDTI07uYpRhD2H0Ph"
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
--------------Xp4iKf0jDTI07uYpRhD2H0Ph
Content-Type: multipart/mixed; boundary="------------24ryShxqDDLjr82Mp42YIgsS";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <63a51802-42e2-4f01-8f9d-c9d6ec817639@samba.org>
Subject: Fwd: Announcing SNIA SMB3 IO Lab EMEA alongside SambaXP

--------------24ryShxqDDLjr82Mp42YIgsS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCk9uIGJlaGFsZiBvZiBTTklBLCBJJ20gcGxlYXNlZCB0byBzaGFyZSB0aGUgZm9s
bG93aW5nIGludml0YXRpb24gdG8gdGhlIA0KU05JQSBTTUIzIElPIExhYiBFTUVBIHRha2lu
ZyBwbGFjZSBhbG9uZ3NpZGUgU2FtYmFYUC4NCg0KU2FtYmEgWFAgaXMgYmVpbmcgaGVsZCBB
cHJpbCA3LTggaW4gR29ldHRpbmdlbiwgR2VybWFueS4gVGhlIFNOSUEgU01CMyANCklPIExh
YiBFTUVBIGlzIGJlaW5nIGhlbGQgQXByaWwgOC0xMCBmb2xsb3dpbmcgU2FtYmEgWFAhDQoN
Cmh0dHBzOi8vd3d3LnNuaWEub3JnL3NtYjNpb2xhYmVtZWENCmh0dHBzOi8vc2FtYmF4cC5v
cmcvDQoNClRoZSBwdXJwb3NlIG9mIHRoZSBJTyBMYWIgaXMgZm9yIHZlbmRvcnMgdG8gYnJp
bmcgdGhlaXIgaW1wbGVtZW50YXRpb25zIA0Kb2YgU01CMyB0byB0ZXN0LCBpZGVudGlmeSwg
YW5kIGZpeCBidWdzIGluIGEgY29sbGFib3JhdGl2ZSBzZXR0aW5nIHdpdGggDQp0aGUgZ29h
bCBvZiBwcm92aWRpbmcgYSBmb3J1bSBpbiB3aGljaCBjb21wYW5pZXMgY2FuIGRldmVsb3Ag
DQppbnRlcm9wZXJhYmxlIHByb2R1Y3RzLiBTTklBIHByb3ZpZGVzIGFuZCBzdXBwb3J0cyBu
ZXR3b3JrcyBhbmQgDQppbmZyYXN0cnVjdHVyZSBmb3IgdGhlIElPIExhYiwgY3JlYXRpbmcg
YSBjb2xsYWJvcmF0aXZlIGZyYW1ld29yayBmb3IgDQp0ZXN0aW5nLiAgVGhlIHBhcnRpY2lw
YW50cyBvZiB0aGUgSU8gTGFiIHdvcmsgdG9nZXRoZXIgdG8gZGVmaW5lIHRoZSANCnRlc3Rp
bmcgcHJvY2VzcywgYXNzdXJpbmcgdGhhdCBvYmplY3RpdmVzIGFyZSBhY2NvbXBsaXNoZWQu
IFRoZXJlIGFyZSANCnNldmVyYWwgbmV3IGZlYXR1cmVzIHRoYXQgaGF2ZSByZWNlbnRseSBi
ZWVuIGFkZGVkIHRvIHRoZSBTTUIzIHByb3RvY29sOg0KDQogICAgIFNNQiBhdWRpdGluZyBp
bXByb3ZlbWVudHMNCiAgICAgU01CIE5UTE0gZGlzYWJsZSBvcHRpb24NCiAgICAgU01CIG92
ZXIgUVVJQyBhbGwgc2VydmVyIGVkaXRpb25zDQogICAgIFNNQiBvdmVyIFFVSUMgY2xpZW50
IGFjY2VzcyBjb250cm9sDQogICAgIFNNQiBzaWduaW5nIHJlcXVpcmVkDQogICAgIFNNQiBh
dXRoIHJhdGUgbGltaXRlcg0KICAgICBTTUIgYWx0ZXJuYXRpdmUgcG9ydHMNCiAgICAgU01C
IE1haWxzbG90cyBkaXNhYmxlZA0KICAgICBTTUIgZ3Vlc3QgYXV0aCBvZmYgaW4gUHJvDQog
ICAgIFNNQiBnbG9iYWwgZW5jcnlwdCBmcm9tIGNsaWVudA0KICAgICBTTUIgc2VydmVyIGRp
YWxlY3QgY29udHJvbA0KDQpUaGUgSU8gTGFiIGlzIGFuIG9wcG9ydHVuaXR5IHRvIGxlYXJu
IGFib3V0IHRoZXNlIG5ldyBmZWF0dXJlcyBhbmQgdGVzdCANCnlvdXIgaW1wbGVtZW50YXRp
b24gd2l0aCBNaWNyb3NvZnQgV2luZG93cyBwcm90b2NvbCB0ZXN0IHN1aXRlcy4gIER1cmlu
ZyANCnRoZSBJTyBMYWIgeW91IGNhbiBkaXJlY3RseSBlbmdhZ2Ugd2l0aCBXaW5kb3dzIFBy
b3RvY29sIFN1cHBvcnQsIFRlc3QgDQpTdWl0ZSBEZXZlbG9wbWVudCwgYW5kIG1lbWJlcnMg
b2YgdGhlIFdpbmRvd3MgZGV2ZWxvcG1lbnQgdGVhbSBhcyB3ZWxsIA0KYXMgbmV0d29yayB3
aXRoIG90aGVyIHByb2Zlc3Npb25hbHMgZnJvbSBhbGwgb3ZlciB0aGUgd29ybGQuDQoNCklm
IHlvdSBhcmUgcmVsdWN0YW50IHRvIHBhcnRpY2lwYXRlIGJlY2F1c2UgeW91IGZlZWwgdGhh
dCB5b3VyIFNNQiANCmltcGxlbWVudGF0aW9uIGlzICJub3QgcmVhZHkiLCB5b3Ugc2hvdWxk
IHN0aWxsIHBhcnRpY2lwYXRlISBUaGUgU01CMyBJTyANCkxhYiBpcyBhbHNvIGEgZGV2ZWxv
cG1lbnQgb3Bwb3J0dW5pdHksIG5vdCBqdXN0IGEgdGVzdGluZyBvcHBvcnR1bml0eS4gDQpJ
bXBsZW1lbnRhdGlvbnMgc3RpbGwgaW4gZGV2ZWxvcG1lbnQgYXJlIGVuY291cmFnZWQgdG8g
cGFydGljaXBhdGUuIEl0J3MgDQphIGdyZWF0IG9wcG9ydHVuaXR5IHRvIGdldCBoZWxwIGFu
ZCBsZWFybiBmcm9tIHRoZSBleHBlcnRzIQ0KDQpUaGlzIHllYXIgd2UgYXJlIHBsZWFzZWQg
dG8gYW5ub3VuY2UgdGhlIGZ1bGwgcGFydGljaXBhdGlvbiBhbmQgDQpjb250aW51ZWQgc3Vw
cG9ydCBvZiBNaWNyb3NvZnQsIG91ciBTTklBIFNNQjMgSU8gTGFiIEVNRUEgdW5kZXJ3cml0
ZXIuDQoNClJlZ2lzdHJhdGlvbiBpcyAzMDAgRXVybyBwZXIgcGFydGljaXBhbnQsIHdoaWNo
IGNvdmVycyB5b3VyIG1lYWxzIA0KKEJyZWFrZmFzdCBhbmQgTHVuY2gpIGZvciB0aGUgZXZl
bnQuIEZvciBjb21wbGV0ZSBkZXRhaWxzIG9yIHRvIA0KcmVnaXN0ZXIsIHBsZWFzZSB2aXNp
dCAgaHR0cHM6Ly93d3cuc25pYS5vcmcvc21iM2lvbGFiZW1lYQ0KDQpTZWUgeW91IHRoZXJl
IQ0KLXNsb3cNCg==

--------------24ryShxqDDLjr82Mp42YIgsS--

--------------Xp4iKf0jDTI07uYpRhD2H0Ph
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmeg5zQFAwAAAAAACgkQqh6bcSY5nkY3
dA/+KbRqcJAV3FhAlmKCCJwUmcrZ8P27VpphfOFhExPidp4qBNZuALa2XmG2t89Bh9obIxSxVR7Q
uNCPGXbRAHu1XoUtOlzY3omDudBm0neVr5bQn/nenpIjIf+39Fo0DCLj5wgSN2CZ7XmuTeZc0cL9
XISrCfFdBB7Quz75r3dw7D3E+XbMWxJmWDXU650t6qPqe8lAqrJUsSUZJrajOhtVrbayZKO+XgRL
dGp9pLS3LE5pDxHzMxqoFcbp7lYKzXYO/z5anjaS2HVfZ8soUdiyI72nHtpVXxZT3lUEWoGsf2h8
rMctSi4KDpamEjfRs4xrrP6EMxbZUXRY9VBFglQRbzTS/in/d4Q1KrT8Cv3/JA0UeFtU97S50s0/
DHQRlnkLu85CjI4irkb2lCmOKK6CkWV6xqEvi3b5RwqNV5IIoR7KIh/8OXyKttOpkgnJ7LqDTiLh
tDXyXzKvsRW2N9R03YPaJ1cc+eAjtnl5SBhS0YAvmLGRnmGP1mYxvuqKubanl24AakvHcaQh4ImG
Vz0yjbsMCcx/FcpeBnNGv/iA6wnVFAmbgeJkEJYbIA6Bhyw1w51P/QFFWyYXZfvbFpteuC9O1T3X
/yq8276IcruqwB5R+hdYpmZm+NVHBovr/8Q2/4LVIVfygwALo+tEXRkzLmGGZq0QxFskIMHa9Tqw
En4=
=uOR8
-----END PGP SIGNATURE-----

--------------Xp4iKf0jDTI07uYpRhD2H0Ph--

