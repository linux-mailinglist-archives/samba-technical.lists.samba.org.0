Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2B994279
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2024 10:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Hm5otLLhbWBorCl/HTdsaF1Y1gQn1T7Xa7TB+mZVSNI=; b=5Ur2YLJSKVkArgYVVaTKIqe2hv
	u/IfouSHv91+7lgXAxBOsiVigyroExYia4gitrz7S7d9G4iv6KTsjORFWLxdAgnbyC5gQA7D40zwE
	RDfUAlrUAebie/pfmJvCXRrCRm+p6W/99AdqnX2MOKjYJOCb5TrmeKs44IwgOj6Dbfu3VM1g5wsu8
	Ty1AU7P7GFAFl29itYNUxXymS0LGY14a7EmUEqPJl6woEdwiP7Gl36oDZinFh2W3u3JE9P4dX9Zk2
	Vvh5+fHlgx3t5wWjZBmAIAFN425NHaLTnJevWnclgX7DXvcZCLAw4+t1bMdXn99KiPWuqOny5bfm5
	bHmpmZLA==;
Received: from ip6-localhost ([::1]:21208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sy5qa-003GER-SN; Tue, 08 Oct 2024 08:45:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18488) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sy5qV-003GEK-Qm
 for samba-technical@lists.samba.org; Tue, 08 Oct 2024 08:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Hm5otLLhbWBorCl/HTdsaF1Y1gQn1T7Xa7TB+mZVSNI=; b=VoSyU/m8cAyiTHfwQ7leVbURLZ
 r/jk0HRgwdkVKIfj/0iGWZAbrA/q2Oce1XymUVabaxA0Jy2wXpL50fa8vKvSiUn42g6+qgb/1wFnd
 3Yop/kLPnYgaVS4yziZc/fZ0p7VtLjQJZG8smJxNESln/xMesaIiK+KbI7txNb2N4LqO6CLyOTVyu
 xr9LvOKqVO9kadjZgICP0+iMlAa/2PoTg1tJmrDDD0lpektOe6v1i6fQTWP89psz1E2iLx9CFy7KP
 qU9ryH81qsIxDt7EhXoDpeN1JQy1p+1Ew6I0FV01H2bpAaKmQKFc7zqlJvG4EODmeQUXxym2Y4wtY
 87+sAAhEie+E2f9qjtNmP7Kd7b9MfpEaMz1KHR86dgvhLLEYCRGRaxtmRjHmcCl0uErKjuKj95Yi7
 JQFK1cD9s1X2Yl81gY9CxZFNHt8d2O2sd+ExtDcQ03vWdFt+tU568r5Q8vnBhCxHYbdEeQWTrozas
 HhCUtLaBPMflTJ9zogsiWz2R;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sy5qV-003tHG-0K; Tue, 08 Oct 2024 08:45:31 +0000
Message-ID: <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
Date: Tue, 8 Oct 2024 10:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
To: Steve French <smfrench@gmail.com>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HzMG1mJ8gb3FdEBRqLdklFOE"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HzMG1mJ8gb3FdEBRqLdklFOE
Content-Type: multipart/mixed; boundary="------------gOEJz0wNBYs0scASZTBXlzaW";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE on
 copy_chunk
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
In-Reply-To: <77aff6ef-291d-4840-82e2-b02646949541@samba.org>

--------------gOEJz0wNBYs0scASZTBXlzaW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvOC8yNCAxMDo0MSBBTSwgUmFscGggQm9laG1lIHZpYSBzYW1iYS10ZWNobmljYWwg
d3JvdGU6DQo+IFRoZSBwcm9ibGVtIGlzIHRoZSBPX0FQUEVORCBvbiB0aGUgZGVzdGluYXRp
b24gZmlsZSBoYW5kbGUuDQo+IA0KPiBXZSBwYXNzIHRoYXQgZmxhZyBpZg0KPiANCj4gIMKg
wqDCoMKgwqDCoMKgIGlmIChwb3NpeF9vcGVuICYmIChhY2Nlc3NfbWFzayAmIEZJTEVfQVBQ
RU5EX0RBVEEpKSB7DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmxhZ3Mg
fD0gT19BUFBFTkQ7DQo+ICDCoMKgwqDCoMKgwqDCoCB9DQo+IA0KPiBJcyB0aGlzIG9uIGEg
cG9zaXggbW91bnQ/IE90aGVyd2lzZSBpdCBzZWVtcyB0byBiZSB0aGUgY2xpZW50cyBmYXVs
dCANCj4gcGFzc2luZyBGSUxFX0FQUEVORF9EQVRBLg0KDQpnYWgsIGl0J3MgYW4gIiYmIiwg
bm90IGFuICJ8fCIsIHNvIGl0J3MgeW91ciBjbGllbnQgSSB3b3VsZCBzYXkuDQoNCg0K

--------------gOEJz0wNBYs0scASZTBXlzaW--

--------------HzMG1mJ8gb3FdEBRqLdklFOE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmcE8SoFAwAAAAAACgkQqh6bcSY5nka6
NRAAgEKwVS4gatj+mfuzuDGrEb/R+SPidj9/6pqdP2pbpLzQYZSxwt2NbcPzDAnh3DZelfOgmVK2
kwDL/sd92a2HZJS6rI8ybTvX5J+IkR8q8TTWY84gH6nnFBpwL5f2yBh9JwIGXjrJC2IJg7oYIoRF
WcQSQcpuXvvX2knh4HrY1awefl7hH8FJVPFw/mfrNWW1JnEkbCo7DVldwzU7JchlZBLNToR0cc6X
78aqixYassYibBZHMzybps9dxXJH1Kh95GtbDwfEM6EMjjwg70xm9LGI59/su2zmUZ7gS9f7z7CJ
IvFDPBeDIl3A+u3t6rK8DXQYpxC6R65KciLo4SEUjQFUo0kUnP5Mlaroxp1593jFvRIO21TOztuS
9MDWFaMoj+Cz4MJiDAMBLpXmFRVbQo05HjIOvglRxCkGk+/7qt4JOyjPb4viR5N/ArXPpzZLIemM
7EkrvsRQQA4+E8mna+k430gtXo7OLI7NijguZik0GVrLG/K7VLXwnyTF7aPX9LtqV0ensCPrnwbx
ruQYL2DwwZMuoRpGvrQwC7M6PMx3xq77aszdla2ihQsQF1xc9+zWJ7DYvnU++V9VEs8LJIQroiDq
qyQ+93d3hwSD/drz76fp2gcOYS/Y4Z3iVw4xO53jfUukKk0QEo6Ptza2VTEGRyLPuwanELvdOe0T
Cjo=
=Tv/Q
-----END PGP SIGNATURE-----

--------------HzMG1mJ8gb3FdEBRqLdklFOE--

