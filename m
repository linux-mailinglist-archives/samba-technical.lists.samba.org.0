Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D8647037C
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 16:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=90mR+UcNw/eZu+2vZMAH7onlJy6QJ8wtgP6SA7WCnfw=; b=FcZ7hskm6yKtLkR3Llf/1WFhjj
	MgRLEw4wqSD6Pi5BIVHdB/sbbMHXyo394kEA5plTkH0XrbQhAalO4/biOhigL+IMJAC0QYgCx3wnQ
	SK0kAut9z/CjSU/316ZVkZULZZc3RfXXlmZg1loqyY1fQ3WcJtooCLpvo0+J76Kwq5d7yQPb1lK5c
	OfhNLNVt4ohVvmDiw+x6fgr3BbSzGNwM3cW+XakdkhZHCZ8+wIkBTxt2k+GGLrjA7haqAxOu6Tk9d
	dJ12WzjZsAcoPomqsPahMM/3m/lKFV3ScA0HWXqulI+/hY9xhif01pL1Lf/6S4pKDVMWb23r45b2d
	VT9uLvgQ==;
Received: from ip6-localhost ([::1]:27724 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvhV0-004x9O-Ga; Fri, 10 Dec 2021 15:07:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54420) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvhUu-004x9F-UD
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 15:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=90mR+UcNw/eZu+2vZMAH7onlJy6QJ8wtgP6SA7WCnfw=; b=W+UJ2Xo89EK321PZJKLTDps4pG
 dtwChr5OBvYY/ZwRMNzxSoyGOYHEcyfVjjzZSrV4YYAmblE9YLdenaiR5f6iq1sbDl+3DtxvkLOuK
 yTep6BuQtghsIkWQswIpn0jypf5sbOK2n17X2MYyYFiPnv+mCpen7ZcVk8kjR7S8lyIJaRiWTLd16
 +mGr5lUFE6p1KCyCljh5jOgwb21x8HFFF1ZE66rdgwEr4Hib2QFS6kF0JaE42818V27ot2IVn2RLR
 g0Pj6/ystvnIKcwRvhIXQb9jEwnZrli9lhlC9NRq8+lHgELXUVokXr61YJd/8cPHi0X2GQjDv9t73
 y/aDCPxwYL20e4DQbHgGr0G7wMzdgANUlrgClI5sNWxv72pZo0td5kNiadOewj/sv0BvWFyELfYXG
 wGCtufw6j8hKFD6zSZR9pAXHZyQ4SgXPN0FeFWfBCEovDLuZhfgg97RzS4T35eECFbwjmUa+ozGJp
 TYYh4zLdzIG3eRjyODVodbN5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvhUu-002BBA-KB
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 15:07:44 +0000
Message-ID: <d30b7d7e-787d-9b57-b826-99b0e9dc830f@samba.org>
Date: Fri, 10 Dec 2021 16:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <E1mvhGg-00H6Ho-3p@hrx0.samba.org>
In-Reply-To: <E1mvhGg-00H6Ho-3p@hrx0.samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qWRWjuBVXWvav7htPAnAse7C"
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
--------------qWRWjuBVXWvav7htPAnAse7C
Content-Type: multipart/mixed; boundary="------------y60vxNAnWT0k8yKgRJ1ZTDQY";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical@lists.samba.org
Message-ID: <d30b7d7e-787d-9b57-b826-99b0e9dc830f@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
References: <E1mvhGg-00H6Ho-3p@hrx0.samba.org>
In-Reply-To: <E1mvhGg-00H6Ho-3p@hrx0.samba.org>

--------------y60vxNAnWT0k8yKgRJ1ZTDQY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMTAvMjEgMTU6NTMsIFZvbGtlciBMZW5kZWNrZSB3cm90ZToNCj4gVGhlIGJyYW5j
aCwgbWFzdGVyIGhhcyBiZWVuIHVwZGF0ZWQNCj4gICAgICAgICB2aWEgIGVhMmVjN2VhNWU4
IFdIQVRTTkVXLiBBZGRlZCBzZWN0aW9uIGFib3V0IHNhbWJhLWRjZXJwY2QuDQo+ICAgICAg
ICAgdmlhICA3YjYyZmE5NjdkMCBkY2VzcnZfY29yZTogUmVtb3ZlIHVudXNlZCBkY2VzcnZf
cmVpbml0X2NvbnRleHQoKQ0KPiAgICAgICAgIHZpYSAgNzMwZjdkZmQ2MTUgczM6cnBjX3Nl
cnZlcjogRGVsZXRlIHVudXNlZCBjb2RlIGFuZCBkb2MgcmVmZXJlbmNlcw0KPiAgICAgICAg
IHZpYSAgOWUzZWU4YzQwYzAgcHJpbnRpbmc6IFJlbW92ZSAic3RhcnRfZGFlbW9ucyIgZnJv
bSBwcmludGluZ19zdWJzeXN0ZW1faW5pdCgpDQo+ICAgICAgICAgdmlhICBhN2M2NTk1OGEx
NSBzMzpycGNfc2VydmVyOiBBY3RpdmF0ZSBzYW1iYS1kY2VycGNkDQo+ICAgICAgICAgdmlh
ICBkNTIyYThjY2UxMiBzMzpycGNfc2VydmVyOiBBZGQgc2FtYmEtZGNlcnBjZCBoZWxwZXIg
cHJvZ3JhbXMNCj4gICAgICAgICB2aWEgIDNmYjJmZDQ5NDQ1IHMzOndpbmJpbmQ6IENsb3Nl
IGludGVybmFsIFJQQyBwaXBlcyBhZnRlciA1IGlkbGUgc2Vjb25kcw0KPiAgICAgICAgIHZp
YSAgYTM1MGEwMDBmMTAgczM6cnBjX3NlcnZlcjogTWFrZSBucGFfc3RhdGVfaW5pdCgpIHB1
YmxpYw0KPiAgICAgICAgIHZpYSAgYTAwNzVhMWZkMGUgdW5pdHRlc3Q6IFJlbW92ZSB0ZXN0
X3NhbWJhZnNfc3J2X3BpcGUNCj4gICAgICAgICB2aWEgIGMyYjhjZjA1YzM3IHMzOnByaW50
aW5nOiBNb3ZlIHBjYXBfY2FjaGVfbG9hZGVkKCkgdG8gbG9hZC5jDQo+ICAgICAgICAgdmlh
ICAzYWVlNGMxNzFjMiBzbWJjb250cm9sOiBBZGQgcnBjLWR1bXAtc3RhdHVzDQo+ICAgICAg
ICAgdmlhICAxODg1ODZkZGRkZSBzMzpycGNfY2xpZW50OiBBZGQgcnBjX3BpcGVfb3Blbl9s
b2NhbF9ucCgpDQo+ICAgICAgICAgdmlhICBkM2UxZWNlMWE0NSBzMzpycGNfc2VydmVyOiBJ
bXBsZW1lbnQgdGhlIHJwY2RfKiBoZWxwZXItZW5kIG9mIHRoZSBzYW1iYS1kY2VycGMgcHJv
dG9jb2wNCj4gICAgICAgICB2aWEgIDRkNzVmMDhmZDIyIHMzOnJwY19jbGllbnQ6IEFkZCBs
b2NhbF9ucF9jb25uZWN0KCkNCj4gICAgICAgICB2aWEgIDNjYTdjNjQwZGEwIHMzOnJwY19z
ZXJ2ZXI6IEFkZCBzYW1iYS1kY2VycGNkDQo+ICAgICAgICAgdmlhICA4ZmZlYjE4YjlhMSBk
b2NzLXhtbDogQWRkICJycGMgc3RhcnQgb24gZGVtYW5kIGhlbHBlcnMiLCB0cnVlIGJ5IGRl
ZmF1bHQuDQo+ICAgICAgICAgdmlhICBhNjk3ODE0ZWJhOSBpZGw6IERlZmluZSBtZXNzYWdl
cyBzZW50IGJldHdlZW4gc2FtYmEtZGNlcnBjZCBhbmQgcnBjZCdzDQo+ICAgICAgICAgdmlh
ICBkYTkwYzAyYjE2OCBkY2VzcnZfY29yZTogQWRkIGRjZXNydl9sb29wX25leHRfcGFja2V0
KCkNCj4gICAgICAgICB2aWEgIDk1NjU5MDMxZTQ1IGJhY2t1cGtleS5pZGw6IERvbid0IGxp
c3RlbiBvbiBccGlwZQ0KPiB0c3Zjcw0KPiAgICAgICAgIHZpYSAgMzI4NGVlOTk4NWQgZGNl
c3J2X2NvcmU6IEFkZCBkY2VzcnZfY29udGV4dF9zZXRfY2FsbGJhY2tzKCkNCj4gICAgICAg
ICB2aWEgIGViYzM5MThmN2QwIHMzOnJwY19jbGllbnQ6IEJ1bXAgZGVidWcgbGV2ZWwgZm9y
IG5jYWxycGMgY29ubmVjdCBlcnJvcg0KPiAgICAgICAgIHZpYSAgZjgzZjdiZDZiZGQgczM6
cnBjX3NlcnZlcjogUmVtb3ZlIGRpcmVjdCByZWdpc3RyeSBhY2Nlc3MgZnJvbSBzdmNjdGxf
aW5pdF93aW5yZWcNCj4gICAgICAgICB2aWEgIGE2MGM3YjRmZjI5IHMzOnNlcnZpY2VzOiBE
aXNhYmxlIHJjaW5pdC1iYXNlZCBzZXJ2aWNlIGNvbnRyb2wgY29kZQ0KPiAgICAgICAgIHZp
YSAgYWZkMDE0MjQ1YTkgdGVzdDogUHJpbWUgdGhlIGtwYXNzd2Qgc2VydmVyDQo+ICAgICAg
ICAgdmlhICBkNWZhNjI2Mzk0OCBycGNfc2VydmVyOiBDaGVjayBpbmZvNS0+dHJhbnNwb3J0
DQo+ICAgICAgICAgdmlhICAwMGU0MWQxOThkMiBsaWJycGM6IEdldCB0cmFuc3BvcnQgb3V0
IG9mIHRzdHJlYW1fbnBhX2FjY2VwdF9leGlzdGluZ19yZWN2KCkNCj4gICAgICAgICB2aWEg
IGZhNDQ1ZjE1MzE4IGF1dGg6IEZpeCBhIHR5cG8gaW4gYXV0aC9nZW5zZWMvbmNhbHJwYy5j
DQo+ICAgICAgICAgdmlhICAxYmFiNzYyMjNjZCBsaWJycGM6IEFkZCBuYW1lZF9waXBlX2F1
dGhfcmVxX2luZm81LT50cmFuc3BvcnQNCj4gICAgICAgICB2aWEgIDUzMGZiNGZkZmIzIG5h
bWVkX3BpcGVfYXV0aC5pZGw6IEFkZCAibmVlZF9pZGxlX3NlcnZlciINCj4gICAgICAgICB2
aWEgIGQxOTM0ZTIzMzFmIG5hbWVkX3BpcGVfYXV0aDogQnVtcCBpbmZvNCB0byBpbmZvNQ0K
PiAgICAgICAgZnJvbSAgYmQ5OGUwNDBkNGEgVXBkYXRlIFdIQVRTTkVXLnR4dCB3aXRoIHJl
bW92YWwgb2Ygd2lsZGNhcmQgY29weSwgcmVuYW1lIGFuZCB1bmxpbmsuDQo+IA0KPiBodHRw
czovL2dpdC5zYW1iYS5vcmcvP3A9c2FtYmEuZ2l0O2E9c2hvcnRsb2c7aD1tYXN0ZXINCg0K
d29vaG9vIQ0KDQpJdCdzIENocmlzdG1hcywgaXQncyBDaHJpc3RtYXMsIGluIGhlYXZlbiEg
SGlwaGlwLCBoaXBoaXBoaXAsIGhvb3JheSENCg0KaHR0cHM6Ly93d3cueW91dHViZS5jb20v
d2F0Y2g/dj1rbnRRTmVTZ2U1cw0KDQpUaGFua3MgdG8gYWxsIG9mIHlvdSB3aG8gaGVscGVk
IHRvIGdldCB0aGlzIGxhbmRlZC4gVGhhbmtzIFZvbGtlciBmb3IgDQp0aGlzIG1vbnVtZW50
YWwgaW1wcm92ZW1lbnQhIDopDQoNCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1i
YSBUZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1i
YSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQo=

--------------y60vxNAnWT0k8yKgRJ1ZTDQY--

--------------qWRWjuBVXWvav7htPAnAse7C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGzbT8FAwAAAAAACgkQqh6bcSY5nka2
FhAAr2SGXbjcfXL3nJ7J+6GFCi9Cz9iipApoaxldBppPWeD56i0mEULksVCHKFLn+e6XvzfMhIF1
+XZCmkazBleV5fsJx+H4lUoMAJRzx0pQBePQUTHaoRz8mMH3WQIyBwXpy3IoF8eYQ8oXB2iGb6CR
OmfkrDWGdwV9iUITkE7U6MMeCT40uDTxqd9ZLSHGNJlBf42ITMxhf6u+28z05QbU8P3xRn0U8gFN
WNYEKJWHHMSA3FAg0RMBxu/dmBn/sa8IiXe91WXlQ4Z3JayVdxEpRocyB8uCCK5eEQuriNCv+D/N
a1/8hG+qeg4i84KBK5SY+5AESwNT0st3tljkVXQ2YhZt+WWss4kt/L4iAe78NV94f85e4LLl9rHr
grHeCi8IbgE9vW+umIAdxDUBRnqWzGIA2+MZb+v0gZBveTC2NNTtHTG1KlSJQnIto9RxQyC+sA2v
uqNoF/RDh9Ah2NQ1V/R/vlVaWP9E2S0e5+Erl7BV6/qpaEOlBjSdPMEn/M5he+R4T1erGuCnxUu6
K/kBlKN2hVg5tx9CxoawlLa+fQTeY8ryrusHpRH8LPCFa73vTpTCKnAs/Cjn0AzIjDk93xL8rj/i
1NIQEKCZVO0bYoaMw7TlURPjQOFS459WGV1+sCmRukooP2XmtjRZh2o2NgiOu3GrQisj0kS56y1s
BYY=
=R0re
-----END PGP SIGNATURE-----

--------------qWRWjuBVXWvav7htPAnAse7C--

