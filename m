Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC2F7F022C
	for <lists+samba-technical@lfdr.de>; Sat, 18 Nov 2023 20:04:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Y4a1li6NPqKpnItnc/VdTw+3whMOcrtid/aRLJVBR1Y=; b=mIoXmHz1OxCJgerG4vSR2f+9Lp
	/Eh5lAVtNRKDvmE2XI3Wz3mB5ubd7n7hGcxh8Aaug0HoL1CXnMjJgSwHuilp3xHsUhZK8jDfPUYSo
	jKqFWVulfZNbqBVuFm93XrSSzsNOIcefMTOvUo3aQvi/1swkYqGpaKHBXGDjT4NBrULP+f/Yltz1E
	lIopJm0IEOTfkWld++SrKtGdzsK7kT85kdess1hFC5fX7UmVi7kPraEX+F0jmbQwqRuDxOVDvaDV3
	bszKcLcxsI5d/HZZLsqRFoPRoSbdZ9z0TseVnN/X+tqS2bL27kLfsTxQVlZa1pbcqcqJutwSIu8Sz
	SjlmGF9Q==;
Received: from ip6-localhost ([::1]:41142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r4Qb1-008qnd-8Z; Sat, 18 Nov 2023 19:03:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63176) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r4Qav-008qnU-5H
 for samba-technical@lists.samba.org; Sat, 18 Nov 2023 19:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Y4a1li6NPqKpnItnc/VdTw+3whMOcrtid/aRLJVBR1Y=; b=Ny2ECNyqjRUNiQElax1+aWAm/7
 5hxXYUMvTXgJBhdHSKXrzcPPN06Brt/67hbnWGR1daznUunQ2EHZFfQQz+bXOuUW8gKanTeY2zgY7
 /5ZRXmL6dtBDpb+NEJAbMWxk0AjnincLe9lIUnRNcpjZZ4Hx+8LfdqR6Q0ZlbXCQK3Kf8GBXMQEgk
 0L/KCXVDvlpZd0jw5rfWIbpvpoWxUOxzw1HhyeCLsHrSKDKf0vBmF9qhPqd0NNrlla219Gu36XXgU
 R4bhH8ssdfF2PUGauhNoGeznCO4QDYZvbHeWo0BzWAyS+J7UK2QnjOqY/EJBM4QruP5Z2jznXl3M0
 H4nzMMxWIDppLFtH0JP4sa+e/Cm41gBhE1oFyzTH0eNyl/AK7N0aU9M5Jpcf6LMs3oAS70bT4EtTX
 BWQSamYsTpMHid2R37zxEW5DsQ2Kii7la33jq1pPNNsdiV4qhfYe79KYLUIKzeASMTP2ywsFW1RqG
 F57MHyd6giVX33el3eD9YNzS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r4Qam-006uOS-0C; Sat, 18 Nov 2023 19:02:56 +0000
Message-ID: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
Date: Sat, 18 Nov 2023 20:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>
Subject: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HferfaGqjfPItgIENtvEIgQe"
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
Cc: Volker Lendecke <vl@samba.org>, Steve French <smfrench@gmail.com>,
 Stefan Metzmacher <metze@samba.org>, Tom Talpey <tom@talpey.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HferfaGqjfPItgIENtvEIgQe
Content-Type: multipart/mixed; boundary="------------c5gULPbzKiyN3g7X5D0NGc10";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: Volker Lendecke <vl@samba.org>, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>
Message-ID: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
Subject: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC

--------------c5gULPbzKiyN3g7X5D0NGc10
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCkkndmUgd29ya2VkIGEgbG90IG9uIHRoZSBzcGVjIG92ZXIgdGhlIGxhc3QgMiB3
ZWVrcy4NCg0KSSd2ZSBtb3N0bHkgZmluaXNoZWQgUE9TSVgtU01CMiAodGhlIGV4aXN0aW5n
IHNwZWMsIGZpcnN0IGxpbmsgYmVsb3cpIA0KYW5kIHdoaWxlIHdvcmtpbmcgb24gdGhhdCBJ
IHJlYWxpemVkIHRoYXQgaXQgbWFrZXMgYWJzb2x1dGVseSBubyBzZW5zZSANCnRvIGhhdmUg
ZmlsZXN5c3RlbSBiZWhhdmlvdXIgaW4gUE9TSVgtU01CMiwgc28gSSd2ZSBzdGFydGVkIGEg
UE9TSVgtRlNBIA0KZG9jdW1lbnQgYWxvbmdzaWRlIFBPU0lYLUZTQ0MuDQoNCk5hbWluZyBj
b252ZW50aW9uOg0KDQpJJ20gZm9sbG93aW5nIE1TIG5vbWVuY2xhdHVyZSwganVzdCByZXBs
YWNpbmcgdGhlIE1TLSBwcmVmaXggd2l0aCBQT1NJWCwgDQp3aGljaCBnaXZlcyBQT1NJWC1T
TUIyLCBQT1NJWC1GU0EgYW5kIFBPU0lYLUZTQ0MuIFdpdGggdGhlc2UgaXQncyANCnBvc3Np
YmxlIHRvIGhhdmUgbmljZSBhbmQgY29uc2lzdGVudCBjcm9zcyByZWZlcmVuY2VzLg0KDQpD
dXJyZW50IFdJUDoNCg0KaHR0cHM6Ly93d3cuc2FtYmEub3JnL35zbG93L3NtYjNfcG9zaXhf
ZXh0ZW5zaW9ucy5odG1sDQpodHRwczovL3d3dy5zYW1iYS5vcmcvfnNsb3cvZnNhX3Bvc2l4
X2V4dGVuc2lvbnMuaHRtbA0KaHR0cHM6Ly93d3cuc2FtYmEub3JnL35zbG93L2ZzY2NfcG9z
aXhfZXh0ZW5zaW9ucy5odG1sDQoNCkkndmUgY3JlYXRlZCBhIHByb2plY3QgZm9yIHRoaXMg
dW5kZXIgdGhlIFNhbWJhIHVtYnJlbGxhIG9uIGdpdGxhYiBoZXJlOg0KDQpodHRwczovL2dp
dGxhYi5jb20vc2FtYmEtdGVhbS9zbWIzLXBvc2l4LXNwZWMNCg0KV0lQIGJyYW5jaDoNCg0K
aHR0cHM6Ly9naXRsYWIuY29tL3NhbWJhLXRlYW0vc21iMy1wb3NpeC1zcGVjLy0vY29tbWl0
cy9zbG93LXdpcA0KDQpUaGUgaG9zdGluZyBvZiB0aGUgc3BlYyBvbiBDb2RlYmVyZyBmZWVs
cyBhIHNvbWV3aGF0IG9kZCBhbmQgaGF2aW5nIHRoZSANCnNwZWMgaG9zdGVkIHdoZXJlIG1v
c3QgY29udHJpYnV0b3JzIGFscmVhZHkgaGF2ZSBhbiBhY2NvdW50IHNpbXBsaWZpZXMgDQpj
b2xsYWJvcmF0aW9uLiBXZSBjYW4gb2YgY291cnNlIGNvbnRpbnVlIHRvIHB1c2ggbWFzdGVy
IHRvIENvZGViZXJnIG9uY2UgDQppbiBhIHdoaWxlIHRvIGhhdmUgYW4gaW5kZXBlbmRlbnQg
aG9zdGluZywgaWYgdGhhdCBpcyB3aGF0IHNvbWUgbWlnaHQgDQpwcmVmZXI/DQoNCkknbSBw
bGFubmluZyB0byBmaW5pc2ggUE9TSVgtRlNBIGluIHRoZSBuZXh0IHdlZWtzLiBJJ20gaGFw
cHkgdG8gdGFrZSANCnJldmlld3MsIGZpeGVzLCBpbXByb3ZlbWVudHMgYW5kICJ5b3UgY2Fu
J3QgZG8gdGhpcyEiLg0KDQotc2xvdw0K

--------------c5gULPbzKiyN3g7X5D0NGc10--

--------------HferfaGqjfPItgIENtvEIgQe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF4BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVZCl8FAwAAAAAACgkQqh6bcSY5nkbR
kg/3bDEs3y0it250Ab3/mVj1gUF6q/MtrXrLAIsQK3cRFydtgWwa8gKmIm8vTwBza4i7yg0b1P54
EOUMofzGW3mpxDE3W4rPpOzfjpvtps0YtvLR1DKkP0NwGvLivDkyGoA0Ir1o351jIww866pFKck0
KSWMmAbQlgqm/+spYh0VlJV3iaUFfU3bKQ4etBeT8OQnMYRNYy7eDjTmYGORxTypma0XmjPeH6L3
xsz4LqjUtk92A7ohjz+XuG7CcPfdwCaH41N8MKvS/2ZvCM48gu8+kRxfgZuOry+/mCYWFJYsdMDR
4cTuiP3ETW5tN2RAP1d6h4WL7y+pPCQjV2PiMZvAC8TPBw/HA/QJ6cxIldBpXz350X/b5IBnHzpS
U7qGNIan+irD3vC/MziF/gDuMZfHAr5wGsANMl5txnnnLPcshutKeXLHnArv0VLDLFhAB5ZN7Vt8
TW/KsxPJD7arhiLSkihEhrCHUAfPQMwVKWoUt9RWIH5tE+Y+jgq28Q/yZDe9S+uV44JXTed4AnUj
2rsFH9u+xs74twqW2MbibLMdz+RePqTuk4uwqLTfDkYcUxpkVo47NYqPvFRDkMsL4rfg/d2dAANO
mlbkbRzbMH4Aqog8y09C2wSkXKmUf769O6mbJjJS5FZDkYWImCs4YrQNbITTyXNXL6fF11DUofwA
6Q==
=YA8Q
-----END PGP SIGNATURE-----

--------------HferfaGqjfPItgIENtvEIgQe--

