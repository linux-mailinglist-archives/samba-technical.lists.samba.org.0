Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E202B7915F0
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 12:56:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=3LvxHryZw9sh/8Hd7yq0Jo5c8a6oovNp4dBU2KrDTEY=; b=A/ci4uWhJDL+5h60MnauNB4lNC
	jJjFtv21lirN9vKcMJ1CLAJ9mlTW435eJT3R9JNTbSV7DWqSHJ/VoL1ubbAGxUO130K9ewe4qYcrg
	hFWh0FjB0i1sIVWmkyCDvbAtrdIZ4Z+uKeP2TzFaVxuEh6nnvdBm0a/1FHgeyrQ+W6gttZhb2fVpS
	M38/WuUIbCPOlp/Y2iLkOiOlOQteQi+63DLtRhQ+h0ve9TeSvuE3WKcGS9AeOSfIQc3k03RoqFt5O
	W141y6UqsmrqeLH+VtftFXpyZWHdRvSfn54nTms/dMwgfPq1s/+o32hV6pcXVwheEr/3Or3qcNHbi
	H29OFHZQ==;
Received: from ip6-localhost ([::1]:55894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qd7FD-000KOV-Pg; Mon, 04 Sep 2023 10:55:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qd7Ez-000KNQ-Na
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 10:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3LvxHryZw9sh/8Hd7yq0Jo5c8a6oovNp4dBU2KrDTEY=; b=om1Vz8QwEWD2oZU+LdVMqbLfYt
 xVYnqnx4q1MPSp9138BMJNOla4iZLWZWa2eFpETDK4bYwn8/c+C8fMC81owJG8kXT6lVNbOD3wjbY
 FerjXc82p3PLgs6CvXFEmQsMFlu1QrzJKs/aEngnz+Kw6KCPQirY0NHSHz49gKhDA1BV2Kbtogab4
 5d7N/fErK0Y3M3E9CN0UTtgo+tIIE6lZvZ2qUhTtMizluh1U7ut6tjTIgYxhjK0/QEwAT8GbCJ7pj
 +uK+4Ky1Tn5wVg9fV5u1oIce0Qq0CXP/DOWQtmbfRfCD4lG46zEppsgCkgjkejUEnPBn37NBPXVIn
 Hjv2YH2aeqTy63i4CaVecM5JJ82gkkGI4XQ57p+spwzMa3fdHyK8vSS0w7VysHIbystRGWQeuyqlV
 Y5gqKArf8jDn3y3ebIJqxCSlXofVcT2dWKNLRSB3lw70T/4/+nLzVkFTXS1u04M5Tdup0lyBm8AGq
 WrNvfH7H70I20PC0n5FjmWo3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qd7Ey-00Bh2W-0b; Mon, 04 Sep 2023 10:55:32 +0000
Message-ID: <f7e663eb-7fdf-8830-5637-4ceda0e9e90d@samba.org>
Date: Mon, 4 Sep 2023 12:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: `allow trusted domains = no` and `Unix Users`
Content-Language: en-US, de-DE
To: Andreas Schneider <asn@redhat.com>, samba-technical@lists.samba.org
References: <2306152.ElGaqSPkdT@magrathea>
In-Reply-To: <2306152.ElGaqSPkdT@magrathea>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gYrHyAt9hTPM9O0XTtY1ELyZ"
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
--------------gYrHyAt9hTPM9O0XTtY1ELyZ
Content-Type: multipart/mixed; boundary="------------fLpOGZjOEDQNxy05qINs2pZ1";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andreas Schneider <asn@redhat.com>, samba-technical@lists.samba.org
Message-ID: <f7e663eb-7fdf-8830-5637-4ceda0e9e90d@samba.org>
Subject: Re: `allow trusted domains = no` and `Unix Users`
References: <2306152.ElGaqSPkdT@magrathea>
In-Reply-To: <2306152.ElGaqSPkdT@magrathea>

--------------fLpOGZjOEDQNxy05qINs2pZ1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8gQW5kcmVhcywNCg0KT24gOS80LzIzIDExOjA3LCBBbmRyZWFzIFNjaG5laWRlciB3
cm90ZToNCj4gSXMgaXQgYnkgaW50ZW50aW9uIHRoYXQgbG9jYWwgdW5peCB1c2VycyBmYWxs
IGludG8gdGhlICJ0cnVzdGVkIGRvbWFpbiINCj4gY2F0ZWdvcnkgb3IgaXMgdGhpcyBhIGJ1
Zz8NCg0KSSBndWVzcyBpdCdzIGJ1ZyBhbmQgaXNfYWxsb3dlZF9kb21haW4oKSBzaG91bGQg
Y2hlY2sgd2l0aCBzb21ldGhpbmcgDQpsaWtlIHNpZF9jaGVja19pc19pbl91bml4X3VzZXJz
KCkuDQoNCi1zbG93DQoNCg==

--------------fLpOGZjOEDQNxy05qINs2pZ1--

--------------gYrHyAt9hTPM9O0XTtY1ELyZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmT1t6MFAwAAAAAACgkQqh6bcSY5nkaG
IA/8DvcKwWOJDEQGi9h6C5eDwyh9Lyjcpt11cXenODrK1aU2texzYzhOJuIRIL6zmIb2Oq+oH3Nb
LiXppfJEgyayzKumnDF8jEvRf3O5Pna7uP73PO0Fus+BEDVAHE2VJOnQ6xifB/jkocWNQOO6L763
P8ai+oZHjvem8I8JnjFoErzxOSsvPza2qK1H9Kj49NHxUX+QuoA22Zw/QyaXHnZkhs4f5PHovkqp
hVU1GJCWUzxcTfgnX/g6RCnrMa2eLL8zbB9ZqU4Uz8c6NiEm5TiYr1X/NBcaD5ywxhXXBtbU6I5y
j/QfNe/SspOuyIJov3hxakDO+W+aHyg4Xgv0trk9wzRKj0+m/9pgo/GL3cBCUrvVLEpN2HhcfBKu
M8rqmPO4UP0h3xJoMN5NZeeC5QdZD0Y9RBNM11rMVDVma8AdoCYqJsk0YTRPVDq1dVhAQKQ3jPzv
6+cRM4y/IHLS/iiFDPkIFYg1MSxJG2z9373O2ML5LVexAeCCqrHiP8QbA1QmUe908QVB1qKHEPg7
gxJm0+c4ZMu6CFCxhbVJuNOCKnw+R4B0kKhUsdltdNQIZCZBOUtu4GEG8FDsGnlQ0/QA+nU/mDsA
q031oPvs8bXqoSS3UXZD7iJAEXg/6nAqAfjuID03qk5hw8f+Wb6yg4WNkKC5J71mBLh3SafW+4BI
fww=
=Xt6s
-----END PGP SIGNATURE-----

--------------gYrHyAt9hTPM9O0XTtY1ELyZ--

