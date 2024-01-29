Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC78840AAA
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jan 2024 16:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=1chksm26mG3e+NnlrL2RZTy8gVox1T4WXaUwlvmZRBc=; b=DjAcksV6JWJqLb5E/bPRIsfOBx
	6NsTkAj4w7fmsnOKOweb0bVGfWE9Er63Iwk7Fw9hZguSPVj359DprIYPRdSdGSlx9XkXDaK+cnuD8
	MKxdZTJuIC1cm5eMUNJa5owSsgQMnZ6+5pxRmyMOG700ItqKyr0DAiXD+bolFPUcTbwl2ndNwnM0Q
	0tgdAaXnIOk9fwa92uGOTp5YcDz9W3ARR/jMeBbWWhi5eQwK520Uz8WmzZ/VofN8NOVl2DVOcu/PE
	vMAYzp4Fe3erZkYmpvzfHAE86BtPSSE2Na0r1rK2aBti2IyfteVb4DWdPorRdIhn8xBjdKNRN8CGN
	kcRTeVvw==;
Received: from ip6-localhost ([::1]:60694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUU0w-004uzw-OC; Mon, 29 Jan 2024 15:57:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20654) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUU0n-004uzK-DP; Mon, 29 Jan 2024 15:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=1chksm26mG3e+NnlrL2RZTy8gVox1T4WXaUwlvmZRBc=; b=CGZhvpKFJh64LVyBA18QyeqXDX
 5jmlqjxd/6yNBG0Xd8E2Evq9GdhKxxj0pv37jTJ1R7cTvSWpTifZYOHOkB48ugM0wKyCZH9TSWzDM
 J/jezi5GE8KyMhvdT0xpy4zu67/bCXUeOlzfbPqeb+7Xi2HQKJSPNz6G8YY4vygnFSEOF1iCUzLWZ
 j67OGZyWUBHjFrVn8RS3TaVqLcz/9M/d0Od9O96zEdoOssp52fbe0Q4G9rawgvpfZVMDMhl1/pnFr
 5XfAhsbWnLyVD6Fq2GQmubkrDBg9rM2x8ahZ82ehbGi1rOZO8PrX9c7AGlxHDlHuB7UOFXsqqE1fN
 aSa7hUEVUmLrgi6f+E5S/9JAA28ZpSGiY4kDD85hZD/T71ZrS/6/mcbALooYHgvdNkjExaEUK0Qn0
 1XNDmxiA+dRfBHRxzwUR6Pzlu3qrLljpdrROlmChtV3yV7EI+dBcFkhsyRzc23YbFDCL21QqLGlH9
 Cc2srPKekDRo3X+UvRfXZWqI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUU0m-00AODL-2N; Mon, 29 Jan 2024 15:57:28 +0000
Message-ID: <5d803c66-5740-4943-8985-edfb6e690f4f@samba.org>
Date: Mon, 29 Jan 2024 16:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Samba] Invitation to SambaXP 2024: digital & free - 17th and
 18th of April
Content-Language: en-US, de-DE
To: samba-technical@lists.samba.org, sambalist <samba@lists.samba.org>
References: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>
In-Reply-To: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A1yhZdZYGTb6pfhJyXI5OwMo"
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
--------------A1yhZdZYGTb6pfhJyXI5OwMo
Content-Type: multipart/mixed; boundary="------------SRW39QAqnqT2uZXA1KtrXXgq";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical@lists.samba.org, sambalist <samba@lists.samba.org>
Message-ID: <5d803c66-5740-4943-8985-edfb6e690f4f@samba.org>
Subject: Re: [Samba] Invitation to SambaXP 2024: digital & free - 17th and
 18th of April
References: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>
In-Reply-To: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>

--------------SRW39QAqnqT2uZXA1KtrXXgq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gU2FtYmFzLA0KDQpNeSBhcG9sb2dpZXMgdG8gSmVyZW15IGZvciBtaXN0YWtlbmx5
IG1lbnRpb25pbmcgaGlzIGZvcm1lciBlbXBsb3llciANCnJhdGhlciB0aGFuIGhpcyBjdXJy
ZW50IG9uZSwgd2hpY2ggaXMgQ0lRLCB0aGUgUm9jayBMaW51eCBmb2xrcy4gU29ycnkgDQph
Ym91dCB0aGF0IQ0KDQpMb29raW5nIGZvcndhcmQgdG8gc2VlIHlvdSBhbGwhDQotUmFscGgN
Cg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBz
Oi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2Vy
bmV0LmRlL2VuL3RlYW0tc2FtYmENCg0KDQpPbiAxLzI4LzI0IDE3OjA4LCBSYWxwaCBCb2Vo
bWUgdmlhIHNhbWJhIHdyb3RlOg0KPiBIZWxsbyBTYW1iYXMhDQo+IA0KPiAgRnJvbSAxN3Ro
IGFuZCAxOHRoIG9mIEFwcmlsIDIwMjQsIFNlck5ldCB3aWxsIGJlIGhvc3RpbmcgU2FtYmFY
UCBmb3IgDQo+IHRoZSAyM3N0IHRpbWUuDQo+IA0KPiBUaGUgT3JnYSBDb21taXR0ZWUgaGFz
IHB1Ymxpc2hlZCB0aGUgYWdlbmRhIGF0IGh0dHBzOi8vc2FtYmF4cC5vcmcuDQo+IA0KPiBT
YW1iYVhQIGlzIHRoZSBhbm51YWwgbWVldGluZyBvZiB0aGUgaW50ZXJuYXRpb25hbCBTYW1i
YSB0ZWFtIGFuZCBpdHMgDQo+IGVjb3N5c3RlbSBvZiBkZXZlbG9wZXJzLCB1c2VycyBhbmQg
dmVuZG9ycyBhbGwgYXJvdW5kIHRoZSBnbG9iZSBzaW5jZSANCj4gMjAwMi4gVGhlIDIzcmQg
Y29uZmVyZW5jZSB3aWxsIHRha2UgcGxhY2Ugb24gMTd0aCBhbmQgMTh0aCBvZiBBcHJpbCAN
Cj4gMjAyNC4gSXQgd2lsbCBiZSBoZWxkIGZyb20gM3BtIHRvIDlwbSBHZXJtYW4gdGltZSB6
b25lIChDRVNUKSBhcyBhIA0KPiBkaWdpdGFsIGV2ZW50IHZpYSBab29tIC0gb3BlbiBtaWMg
YW5kIHZpZGVvIHdpbGwgYWxsb3cgdGhlIGNvbW11bml0eSB0byANCj4gaW50ZXJhY3QgaW4g
YSBiZXR0ZXIgd2F5Lg0KPiANCj4gVGlja2V0cywgd2hpY2ggYXJlIGZyZWUgb2YgY2hhcmdl
LCBhcmUgYWxzbyBhdmFpbGFibGUgdGhlcmUuIFRvIGFsbG93IGFzIA0KPiBtYW55IHBlb3Bs
ZSBhcyBwb3NzaWJsZSB3b3JsZHdpZGUgdG8gcGFydGljaXBhdGUgdGhlIHByb2dyYW0gd2ls
bCBzdGFydCANCj4gYXQgMyBwbSAoQ0VTVCkgdG8gc2VydmUgYXMgbWFueSBkaWZmZXJlbnQg
dGltZSB6b25lcyBhcyBwb3NzaWJsZS4NCj4gDQo+IFRoZSBhY3R1YWwgY29uZmVyZW5jZSB3
aWxsIGJlIG9wZW5lZCBieSBjaGFpcm1hbiBKZXJlbXkgQWxsaXNvbiAoR29vZ2xlIA0KPiAv
IFNhbWJhIFRlYW0pIG9uIEFwcmlsIDE3dGggYXQgM3BtLg0KPiANCj4gU3BlY2lhbCB0aGFu
a3MgZ28gdG8gdGhpcyB5ZWFyJ3Mgc3BvbnNvcnMgR29vZ2xlLCBNaWNyb3NvZnQgYW5kIFNl
ck5ldC4NCj4gDQo+IFRoZSBjb25mZXJlbmNlIGlzIGtpY2tlZCBvZmYgb24gQXByaWwgMTZ0
aCBieSB0aHJlZSB3ZWJpbmFyczoNCj4gDQo+ICogU3RlZmFuIEthbmlhOiAiRnVuY3Rpb24g
TGV2ZWwgMjAxNiB3aGF0J3MgbmV3Ig0KPiAqIENsYXVkaW8gSi4gQ29uY2VwY2nDs24gQ2Vy
dGFkOiAiQ8OzbW8gY29uZmlndXJhciB1biBkb21pbmlvIFNhbWJhIDQgZGUgDQo+IEFjdGl2
ZSBEaXJlY3RvcnkiDQo+ICogQmrDtnJuIEphY2tlOiAiU2V0dGluZyB1cCBTQU1CQSBvbiBB
SVggYW5kIHBpY2tpbmcgdGhlIGxvdyBhbmQgdGhlIA0KPiBoaWdoZXIgaGFuZ2luZyBmcnVp
dHMiDQo+IA0KPiBEZXRhaWxlZCBhYnN0cmFjdHMgYW5kIGV2ZXJ5dGhpbmcgbmVlZGVkIGZv
ciBwYXJ0aWNpcGF0aW9uIGNhbiBhbHNvIGJlIA0KPiBmb3VuZCBhdCBodHRwczovL3NhbWJh
eHAub3JnLg0KPiANCj4gQW55IHF1ZXN0aW9ucz8gWW91IGNhbiBhbHdheXMgY29udGFjdCB0
aGUgTE9DIOKAkyBqdXN0IG1haWwgdXMgYXQgDQo+IGxvY0BzYW1iYVhQLm9yZy4NCj4gDQo+
IFNlZSB5b3UgYWxsIG9ubGluZSENCj4gLVJhbHBoDQo+IA0KPiANCg0K

--------------SRW39QAqnqT2uZXA1KtrXXgq--

--------------A1yhZdZYGTb6pfhJyXI5OwMo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmW3yugFAwAAAAAACgkQqh6bcSY5nkaF
bw//TbvjOSssyWyrR7LAZudBEVlfwkNC/E+X8/ghoxqlR5HvNohy/+9kpStYmLQRvzQlzuPCmwJD
TQU7tIXcAgZaQV9/ztdBBkrDCaQ+eoBsbCvR49ZCXuJejUG+17Avib8Fdih6vunuVmWUjeio3woc
CeMqYLU+jRRegd8OCUUcuIirVN24G/Cpmg3IaYgppciuxvzdQMTny3geGLo1nlKXFv9qcW/lqal1
skzrR1xeclMdfb6fF6ZERF6RFJSjl4GVZuv/IIV5tqybv9OB07K4zZ5TyyTE2zlMGUgGvjzVi2LJ
M8i026w3WR46uMcCUYOO96e9DF/8CIdNbXxFsGo5XvUP2uUn9XBfuylBuQfvbLo/ocPmaERObEzp
z2C4eJKNAqi0z4nqNvjMe6aVs9MnZC7nY09r5YoPYWS4nsDOR4/tX58Deg7qLm3hJIOkO9lcSFle
NBZugBUIh8SAd/D9/8EKc55cKeg0OzOkpjmjEPyzazhGqlCV+/7FN/oekHsg5oYg3Z1EQtqrVPyL
iwMZjWGBiyPryW1WjQcAkHRFEVZi2AzzkPpr7WGBfOyZghcsZznJHgE+/uwZqej+M5gJwqPig/IN
BzoN9T/udMBoDcIPEoWsmY8q+imtiWZoD1ZYy5GTuDtkg9aGW7BDZzi0DnXIWWqy1hiVW3urxjFM
ge8=
=N3fK
-----END PGP SIGNATURE-----

--------------A1yhZdZYGTb6pfhJyXI5OwMo--

