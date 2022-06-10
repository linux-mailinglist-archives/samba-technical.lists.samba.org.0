Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B3546001
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jun 2022 10:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PKARHXwGe8yGdP1qHEzHZW6WZEf/pv+KQR59Df0CsMU=; b=0H2InT6wh8vz+ndYxiM/DRSHPr
	wqo00jhWkglbCBOjXNGIprTNFHivHdFfqmbeWEbtlVWKyFy2VHlnopulE2a4gkgZNSinBrXF+FZLx
	I/Zs4UgGSNACOAdWPV0aAsm98qc/aJgTqlwKxFc1c6KYsGrDTDfoUO0kfdHQZtzsbgjjBuGy1cxfQ
	iQPI7c4HwL/VwLgWQ8KOaDIEmLlKRSbKxCQ7V/rZY0SL3Ban0SMTW85WJLVk4Iha6oDaWA0aG+/ai
	qQntYl/1EcCrquPCuiHQkJDXHNwCEOcldPvu01lqYPuwVxZ1WLXG83Z13pjCCoFVlCqmOqUw2PWNU
	PoyufKkQ==;
Received: from ip6-localhost ([::1]:63250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nzaJ9-0096l2-L8; Fri, 10 Jun 2022 08:47:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62232) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nzaJ5-0096kt-19
 for samba-technical@lists.samba.org; Fri, 10 Jun 2022 08:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=PKARHXwGe8yGdP1qHEzHZW6WZEf/pv+KQR59Df0CsMU=; b=yyI4dFm9nQR2WPwxx6nKv7JAIC
 334HxfSCMTsJqSkiHuJgedC+wAlFSxYd3KKb5b/GiQGGd3I9GDtCVEjT1oNsaznxL7FTgjI8w9QAn
 Sgqz7Cc3TILuycvuK/vsZWNlCJLYrs/+q6ogl8WRAvMOs8IlrFN0SQ+/gW6GMddBHiX2IB49MieZO
 GqNcwsrHDD8Y3jQZF7detUTlP1yU9nJoWIhoz67UWk9i/rlKdtkpH6PZS/WWnEbtm+C5jCbQ6hHae
 7v9rl7u7wj/IDV+wUcwHaJoKUt7SecwwaahTm3QYKvWHqrgQyrUc7aiMKurE98X6obbi7GcMQPiBD
 q/z4GgJ84bnlJ1mpW/4XUU3nx4BA4mPEbhn3OY+uq5Kd+ssDrPJzCMiW5FTSUrYMe3+UabBQdFHMT
 cd5xDD/UBAM/J9bQOOk6rA1heHGd9lMXtBmcWP+qcd3wkbvuyvYeCZCKCeA8mfOepE46ty/2nrHYZ
 guytO23JVilLd0DTTxna39IA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nzaJ3-004yu0-Sj; Fri, 10 Jun 2022 08:47:49 +0000
Message-ID: <c4611b9a-84c9-0a9c-2a6b-b8b30ea52ee1@samba.org>
Date: Fri, 10 Jun 2022 10:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Samba] Samba in Kubernetes (and Containers) - Release v0.2
Content-Language: en-US
To: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
References: <3245098.9o76ZdvQCi@pretzel>
 <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
 <26648066.1r3eYUQgxm@pretzel>
In-Reply-To: <26648066.1r3eYUQgxm@pretzel>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AlfYLA1psqY8MdXHkfZm8SvE"
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
--------------AlfYLA1psqY8MdXHkfZm8SvE
Content-Type: multipart/mixed; boundary="------------khmPd2oj3uownCtvJLaK6Rgz";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
Message-ID: <c4611b9a-84c9-0a9c-2a6b-b8b30ea52ee1@samba.org>
Subject: Re: [Samba] Samba in Kubernetes (and Containers) - Release v0.2
References: <3245098.9o76ZdvQCi@pretzel>
 <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
 <26648066.1r3eYUQgxm@pretzel>
In-Reply-To: <26648066.1r3eYUQgxm@pretzel>

--------------khmPd2oj3uownCtvJLaK6Rgz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNi85LzIyIDIzOjI2LCBKb2huIE11bGxpZ2FuIHdyb3RlOg0KPiBJbmRlZWQsIHRoYW5r
cyBhIHRvbiBmb3IgbWFraW5nIHRoaXMgaGFwcGVuIHNvIHF1aWNrbHkuIEkgY2FuJ3Qgd2Fp
dCB0byB0cnkgaXQNCj4gb3V0LiAgSSdsbCBuZWVkIHRvIG1ha2UgZ29vZCB1c2Ugb2Ygb3Vy
ICduaWdodGx5JyBidWlsZHMgdGhhdCBjb25zdW1lIHByZS0NCj4gcmVsZWFzZSBzYW1iYSB2
ZXJzaW9ucy4NCg0KZndpdywgdGhlcmUncyBhbHNvIHRoaXMgTVIgZnJvbSBKdWxlIGZvciB0
aGUgc21ic3RhdHVzIEpTT04gb3V0cHV0Og0KDQpodHRwczovL2dpdGxhYi5jb20vc2FtYmEt
dGVhbS9zYW1iYS8tL21lcmdlX3JlcXVlc3RzLzI0NDkNCg0KSXQgd291bGQgYmUgYXdlc29t
ZSBpZiB5b3UgY291bGQgZ2l2ZSBpdCBhIHdoaXJsIG9yIGF0IGxlYXN0IHRha2UgYSBsb29r
IA0KYXQgdGhlIGV4YW1wbGUgb3V0cHV0IGFuZCBsZXQgdXMga25vdyBpZiB0aGUgb3V0cHV0
IGZvcm1hdCBpcyBzcG90IG9uIG9yIA0KaWYgdGhlcmUncyBhbnl0aGluZyB0aGF0IHNob3Vs
ZCBiZSB0d2Vha2VkLg0KDQotc2xvdw0KDQotLSANClJhbHBoIEJvZWhtZSwgU2FtYmEgVGVh
bSAgICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1iYS5vcmcvDQpTZXJOZXQgU2FtYmEgVGVh
bSBMZWFkICAgICAgaHR0cHM6Ly9zZXJuZXQuZGUvZW4vdGVhbS1zYW1iYQ0K

--------------khmPd2oj3uownCtvJLaK6Rgz--

--------------AlfYLA1psqY8MdXHkfZm8SvE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmKjBTMFAwAAAAAACgkQqh6bcSY5nkZH
rhAAmLaP1HZGH6XUcFk0njNxrq6BwYX0VUYThTv/uJcBeSrXuxNR0o2mNNsH8VFgt+4dqm6wEUrf
FtP3uQHrvpflUO6cXk7+A9Fyh72EFhG6xtyJr54RUGYn63Uy5i2EKHk89wp7dEJNwbDXoAp92QBh
DKuaanKaWt66em3cUlZT3UGj3wWuXUeePXkK+V/WUVaL+3oeOel1y53jV+jIdsN/SkoOzR7Ko8yR
MrQJ+wQt0mtivSPxyZKb1k8r8Z3wib8pP4rH4HEZFljZPjUBeDHwc8nVNi7iOQmgrgqu9hiP8AB2
pLfuDavSWd0pW85ul8g3CyIl503/yxg+HF5uglPIlN6nf1g6R//s+6ABm0pBZClECiktnoaq/EgO
VWbgNuRznqYbU0zVmSNwE1zm2TrrrBnWlZTSZ3UY502L+qiAUP3w3E2tpgT+O738kvJXpIHDBngh
wb9hY1SUC8HvcX0qvS8Eu1L39yuT032InLw5/ytUMZjrLFhZ7dxgv3Tap2gE+FQb2zXBw80dQThi
F/959HSxTNxyfOvJwrXMlULTys/3d5xry1yNzhc+kOzRkF12uHss/g/jm7UmcN7A+OtZ8yv1Mgpv
yEthg4iSFJ1wXF6Ky5Ba4qTwVRQduZ0IQJEw1ONpJL5P0P3LlOvC4BOkIKKWzQMuUszCEs69g22e
cBg=
=Og2N
-----END PGP SIGNATURE-----

--------------AlfYLA1psqY8MdXHkfZm8SvE--

