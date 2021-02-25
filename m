Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5731D324FA4
	for <lists+samba-technical@lfdr.de>; Thu, 25 Feb 2021 13:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=i/iesh7EJ7jXXDFhmSYocbHr3w5cUg/GKhtL7mqD4eE=; b=rXzpxUp73Ra/qpFXeMar2PFK77
	TzMuKVHDtPNKV4DQRuFHVCBeT9cK/aKyR9lK5qsdF4WN6vH6BDjBl+LBMcKKDBgpZ/BTog4PjmdrG
	BoeqqpJmku5yi4zltpoEagwOjke7EpmHijjfvwONWPDm1o1rW1ms2E2aC0GXhbQv+nr2Py3HBaieP
	krV5eKR61Mf0H2EHAIDBx47EhANt5ouUaTrDFd8wh/U+C93hI/iQ4K6paO+iNEaNmpYPOH/S5viaA
	lxd3f500c6bwAEZi5H5EHTLBqINypWxv4db+IlrJlGPdD3gRrmW+8YCBB7wSlgQnwbibJRlp/z2A0
	Q4+DzjnA==;
Received: from ip6-localhost ([::1]:22638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFFP4-001OHp-Sw; Thu, 25 Feb 2021 12:05:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45574) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFFP0-001OHi-Hj
 for samba-technical@lists.samba.org; Thu, 25 Feb 2021 12:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=i/iesh7EJ7jXXDFhmSYocbHr3w5cUg/GKhtL7mqD4eE=; b=hq5lUyUdGJMubadWstEKfXo6kN
 wVbd7ezv29CTF3ip48LMKRQg8dwSTCcO8NxbcDDZ7Nu0e/2Oi+D5xlya71sv21b8OevinGQU+nwrZ
 2CLoFB49xpRyXeZvn0YuG/Qy3n4lfnaKTzjFpQA9tlYAUmTRUcm7ZskC+7j9bf8o1gmP48CKkawhY
 HFwkU27w2tLRieeq60lKn3CRaNBk2hkaX3bmaTXiY8SbKk0Vh1PMC2dS/BgOwG52KqaBXDppy5z7J
 7zzuj6FSvWKziuTedT5rj7SyJnu8TxUTj9+XhxEFeDctpYs6k/Ibv0VxNSB4gLvH8Y0KrSLzQC9DE
 HIr1PM6vbxjjNcKO4CSvDA8Bbv58xladgRBcqsARzoHVn1l6Tngq0LT/1reS8L7dCpPC2pTeIvF2W
 83hVuRSjjOmKO6sm8bq5rPPKdy381x+fqhFffqCWE6xxzHyy5iVfHJL7ovWRnG9F0ODMcSl6LJ/Yg
 bE56AtA3dpsRabQdAa4Th/x0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFFOz-00035D-Hm; Thu, 25 Feb 2021 12:05:53 +0000
To: Martin Schwenke <martin@meltin.net>, Amitay Isaacs <amitay@gmail.com>
Subject: Possible bug in ctdb
Message-ID: <4ff83f49-9c37-4067-7ce4-c21ac2a34b0a@samba.org>
Date: Thu, 25 Feb 2021 13:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4TymNbDGD2736urn9m2AUjg2j95SmASGP"
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4TymNbDGD2736urn9m2AUjg2j95SmASGP
Content-Type: multipart/mixed; boundary="Li4w5gXlEsnnxLMDqXxAXMzdObzcoknKx";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Martin Schwenke <martin@meltin.net>, Amitay Isaacs <amitay@gmail.com>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <4ff83f49-9c37-4067-7ce4-c21ac2a34b0a@samba.org>
Subject: Possible bug in ctdb

--Li4w5gXlEsnnxLMDqXxAXMzdObzcoknKx
Content-Type: multipart/mixed;
 boundary="------------03A78684D1C18179D56A4593"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------03A78684D1C18179D56A4593
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Martin, Amitay,

I noticed the following if condition in check_static_boolean_change()=20
(defined twice):

     if (mode =3D=3D CONF_MODE_RELOAD || CONF_MODE_API)

This will always evaluate to true, I guess that is not intended and the=20
fix would be

     if (mode =3D=3D CONF_MODE_RELOAD || mode =3D=3D CONF_MODE_API)

(WIP attached, lacking bugnumber).

I'm currently debugging a ctdb issue where I wondered whether tdb=20
mutexes are actually enabled (I was seeing "tdb_chain*un*lock() took=20
+-10 ms" many times in the logs).

"tdb mutexes" defaults to true, so I wonder whether this bug can cause=20
the default to not become effective, still wrapping my hear around the=20
ctdb config code...

Thoughts?
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

--------------03A78684D1C18179D56A4593
Content-Type: text/plain; charset=UTF-8;
 name="look"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="look"

RnJvbSA0MTc0YWNlNTU1NzNkODk1NGNkOTdlOTMxZWJjM2FlNTZhYmVhMWY0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSYWxwaCBCb2VobWUgPHNsb3dAc2FtYmEub3JnPgpE
YXRlOiBUaHUsIDI1IEZlYiAyMDIxIDEyOjU4OjE1ICswMTAwClN1YmplY3Q6IFtQQVRDSF0g
Y3RkYjogZml4IGVudW0gY2hlY2sKCkJVRzogLi4uCi0tLQogY3RkYi9kYXRhYmFzZS9kYXRh
YmFzZV9jb25mLmMgfCAyICstCiBjdGRiL2ZhaWxvdmVyL2ZhaWxvdmVyX2NvbmYuYyB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2N0ZGIvZGF0YWJhc2UvZGF0YWJhc2VfY29uZi5jIGIvY3RkYi9kYXRh
YmFzZS9kYXRhYmFzZV9jb25mLmMKaW5kZXggNGM3Y2IyZDlmZmUuLjc0Yjc0YTgyNGNjIDEw
MDY0NAotLS0gYS9jdGRiL2RhdGFiYXNlL2RhdGFiYXNlX2NvbmYuYworKysgYi9jdGRiL2Rh
dGFiYXNlL2RhdGFiYXNlX2NvbmYuYwpAQCAtNTksNyArNTksNyBAQCBzdGF0aWMgYm9vbCBj
aGVja19zdGF0aWNfYm9vbGVhbl9jaGFuZ2UoY29uc3QgY2hhciAqa2V5LAogCQkJCQlib29s
IG5ld192YWx1ZSwKIAkJCQkJZW51bSBjb25mX3VwZGF0ZV9tb2RlIG1vZGUpCiB7Ci0JaWYg
KG1vZGUgPT0gQ09ORl9NT0RFX1JFTE9BRCB8fCBDT05GX01PREVfQVBJKSB7CisJaWYgKG1v
ZGUgPT0gQ09ORl9NT0RFX1JFTE9BRCB8fCBtb2RlID09IENPTkZfTU9ERV9BUEkpIHsKIAkJ
aWYgKG9sZF92YWx1ZSAhPSBuZXdfdmFsdWUpIHsKIAkJCURfV0FSTklORygiSWdub3Jpbmcg
dXBkYXRlIG9mIFslc10gLT4gJXNcbiIsCiAJCQkJICBEQVRBQkFTRV9DT05GX1NFQ1RJT04s
CmRpZmYgLS1naXQgYS9jdGRiL2ZhaWxvdmVyL2ZhaWxvdmVyX2NvbmYuYyBiL2N0ZGIvZmFp
bG92ZXIvZmFpbG92ZXJfY29uZi5jCmluZGV4IDBmMTk5Y2JjZDZjLi42MWZlZWRlMzljMiAx
MDA2NDQKLS0tIGEvY3RkYi9mYWlsb3Zlci9mYWlsb3Zlcl9jb25mLmMKKysrIGIvY3RkYi9m
YWlsb3Zlci9mYWlsb3Zlcl9jb25mLmMKQEAgLTMwLDcgKzMwLDcgQEAgc3RhdGljIGJvb2wg
Y2hlY2tfc3RhdGljX2Jvb2xlYW5fY2hhbmdlKGNvbnN0IGNoYXIgKmtleSwKIAkJCQkJYm9v
bCBuZXdfdmFsdWUsCiAJCQkJCWVudW0gY29uZl91cGRhdGVfbW9kZSBtb2RlKQogewotCWlm
IChtb2RlID09IENPTkZfTU9ERV9SRUxPQUQgfHwgQ09ORl9NT0RFX0FQSSkgeworCWlmICht
b2RlID09IENPTkZfTU9ERV9SRUxPQUQgfHwgbW9kZSA9PSBDT05GX01PREVfQVBJKSB7CiAJ
CWlmIChvbGRfdmFsdWUgIT0gbmV3X3ZhbHVlKSB7CiAJCQlEX1dBUk5JTkcoIklnbm9yaW5n
IHVwZGF0ZSBvZiBbJXNdIC0+ICVzXG4iLAogCQkJCSAgRkFJTE9WRVJfQ09ORl9TRUNUSU9O
LAotLSAKMi4yOS4yCgo=
--------------03A78684D1C18179D56A4593--

--Li4w5gXlEsnnxLMDqXxAXMzdObzcoknKx--

--4TymNbDGD2736urn9m2AUjg2j95SmASGP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmA3kqAFAwAAAAAACgkQqh6bcSY5nkaW
TA//RQ6QAWmH6EP0t0CVTNYZwbP7QB2pyQii1qOkRUmAAynbklgELDx3V6QpkzSUi4jvik/7Y1L4
r00WWYKKrtnFF3tGKnQ7eP3dM0OzEzXj+0t6JpgH95J5Nu8cKb8KH2QFM8gGKoG8/2J91lHlErpy
fVZy0TMSxazmeqO5gO1UShbPjmpdxGAikQgDyMZ9jh4WkKNC24ebcuL4HF7uBRjn/x7NQLYs7AV7
vwdLDukP+SwMcXOYw1whJJpHOR4WU3r22kRpWAtslDm+aSRHixZHwaXcuaMg6cBYjO2uAeDllNuF
jmGd1BHBVqbsxcfHk6dGuw3jJdpfdJU7ypiHTuG5JeIA9qRmOXCfAN0p4rg1qvBNOAXZYgcfOCMj
JBbgxbcgDrbdS8DUbKhCM3KJnMEY8z2AP2arqT46QHYlutOnVNWUD4jIB427Ie2QZxb42iM7eqmo
qsr9WxiVyEaSzNtpPwHq2qDrMYdt0Z6i3dHIVmoGgkhh8vN493lTJPqUxoY/w+EV5hkZyT6DUZLw
Ere2ptHoyt6gYF6ZoW5aRzN9+9K/yH7p8hlTWSm0x22KoM4Vs1rOqdZM2m2LL0rcQcFQOqxyGceS
D1rqYIZXgWghw0gFMM526UmvKyxWl+59DMQZCg4FisXKWfgLvQ0+WY75rxTvxco0pxduK5gMBUUB
0Ng=
=ctLK
-----END PGP SIGNATURE-----

--4TymNbDGD2736urn9m2AUjg2j95SmASGP--

