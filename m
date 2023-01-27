Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E44567ED7F
	for <lists+samba-technical@lfdr.de>; Fri, 27 Jan 2023 19:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=kch52znOLPAYcNHvTPaHVtMXyD3TICbXw7RLqt3T4Tw=; b=lVXp81vfkjZ/nVSh0EqAPxypt0
	ojcU81dvUGdJcN+Tc0elhxhFJaY2+7LbqnbOTNW5mpA0EFoNH2QsINaMYBhc5rOsx2YJhh1S/8VbO
	IKKy806FwmB+qb+j3UECi4WFyey8OOIHa6MU2OoRJqfxsJ6INJFUKhNv5kpvyMgwdZxhB/XChm48o
	4F/s4jVJI8t0wiDBa+qVY7yOKDkeMbYu60oIDEJsf8sZfQMpYFNIiFksBmDWsTTNgb2mI6kYzX13Z
	SKPuKrJ0BjPPsrNR4dKJ9BWBr+Y8PUrrSbc5jeq23CWzV/cakuAN2avnMzK/+BlrLczlPoDOChsVQ
	h2sMykbQ==;
Received: from ip6-localhost ([::1]:31284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pLTSM-003lRR-0l; Fri, 27 Jan 2023 18:28:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pLTSH-003lRI-B0
 for samba-technical@lists.samba.org; Fri, 27 Jan 2023 18:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=kch52znOLPAYcNHvTPaHVtMXyD3TICbXw7RLqt3T4Tw=; b=mW0fU9ugzh4j9AzuuzGWh9VHSX
 cYTagn+DIBn8sVMgT3TR2RigtjlWfVpHoVOJZDvRrZB7LL5w+rotS6FyzYLGRwE9udpBwFpTHN3Fr
 2VDV9L9bPFJ4Bs8G2BKUNNmcbsbZJFNwQva6+Q96JRXzuohRPc3ngFP2dG2pYB/GZrcLQcpvHAMS0
 uR0aiUgV1IYhgRKecSUn1QcEKU/Qlm/RJBz7Ab5udWk57lhr5ERjJK0d6IBwpgv+YJDwWGf/jflfN
 JWfEnlJzzodAwcScJCVxtCp1K8a28X/uXSeZMyy8sI2iMwzdMS9jJay7JEkKm37JmxEk7Iqc8DLDE
 Fg+5dbZxoSgBUVqP6m1Q86UICbUOc2oi/FFi4XVkqWBh2TLx4mUNksVGljyBwRRx4W0lmGfiOAiFH
 rDB5bGdH4egrQoQzWf5yQbhLgy7Q9632P+9Vx1Dqyor/eMJ3fIxWAIf/23O5tgiKZwcVPS7EiGv7G
 pXWuxh6nnuAO7QYmoagq//IT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pLTSG-00AXng-FG; Fri, 27 Jan 2023 18:28:04 +0000
Message-ID: <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
Date: Fri, 27 Jan 2023 19:28:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
Content-Language: en-US
To: varun mittal <vmittal05@gmail.com>, samba-technical@lists.samba.org
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
In-Reply-To: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RuuC5OWKY6Mh3PklycwkAgOn"
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
--------------RuuC5OWKY6Mh3PklycwkAgOn
Content-Type: multipart/mixed; boundary="------------SrdpEIAvrqScqRbehosI9F3D";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: varun mittal <vmittal05@gmail.com>, samba-technical@lists.samba.org
Message-ID: <6b9c96ed-b116-3cdc-d361-44662662626c@samba.org>
Subject: Re: Does the CreateDisposition flag of a client depend on Server's
 response ?
References: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
In-Reply-To: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>

--------------SrdpEIAvrqScqRbehosI9F3D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMS8yNy8yMyAxOToxNCwgdmFydW4gbWl0dGFsIHZpYSBzYW1iYS10ZWNobmljYWwgd3Jv
dGU6DQo+IFRoZSBTTUIyIHNwZWMgc2F5cyB0aGF0IHRoZSBhcHBsaWNhdGlvbiBkZWNpZGVz
IHRoZSBDcmVhdGVEaXNwb3NpdGlvbiBmbGFnLg0KPiBTaW5jZSB0aGUgY2xpZW50IGlzIHNh
bWUgaW4gYm90aCBjYXNlcywgaXMgdGhlcmUgc29tZXRoaW5nIGluIHRoZSBpbml0aWFsDQo+
IHJlc3BvbnNlcyBieSB0aGUgc2VydmVyIHRoYXQgd291bGQgY2F1c2UgdGhpcyA/DQoNCndl
bGwsIHRoZSBzaG9ydCBhbnN3ZXIgaXMgcHJvYmFibHkgIm5vIiwgYXMgQ3JlYXRlRGlzcG9z
aXRpb24gZmxhZyBpcyANCmNsaWVudCBjaG9zZWQsIGFzIHlvdSd2ZSBhbHJlYWR5IGZvdW5k
IG91dCB5b3Vyc2VsZi4gT3RvaCwgKnNvbWV0aGluZyogDQpzZWVtcyB0byB0cmlnZ2VyIHRo
ZSBkaWZmZXJlbnQgYmVoYXZpb3VyIGFuZCB0aGVyZSBtYXkgd2VsbCBiZSANCmRpZmZlcmVu
Y2VzIGluIHNlcnZlciBiZWhhdmlvdXIsIHNvIEkgd291bGQgY2hlY2sgZXZlcnl0aGluZyBz
ZXJ2ZXIgc2lkZSANCnRoYXQgbWF5IGFmZmVjdCB3aXJlIGJlaGF2aW91ciBzdGFydGluZyBh
dCB0aGUgdG9wIGxpa2UgY2hlY2tpbmcgYmFzaWMgDQpjb25maWd1cmF0aW9uIGRvd24gdG8g
dGhlIGJvdHRvbSBpZSBjb21wYXJlIGV2ZXJ5IGJpdCBvbiB0aGUgd2lyZSB3aXRoIA0Kd2ly
ZXNoYXJrIHVudGlsIHlvdSBmaW5kIHRoZSBkaWZmZXJlbmNlLg0KDQotc2xvdw0KDQotLSAN
ClJhbHBoIEJvZWhtZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAgICAgaHR0cHM6Ly9zYW1i
YS5vcmcvDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6Ly9zZXJuZXQuZGUv
ZW4vdGVhbS1zYW1iYQ0KDQo=

--------------SrdpEIAvrqScqRbehosI9F3D--

--------------RuuC5OWKY6Mh3PklycwkAgOn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmPUF7MFAwAAAAAACgkQqh6bcSY5nkZB
NQ//f0kB1GsYYCOZlN/PTERuIYvBDH48xRqMMiDFhBko+7IUYBuBteX5pcGXTqISdAHpDH8zn/Dl
rWPpRgkpJUaJW4tuN27TZFZ8PWIrRjprtbaXkaktgQJzS6uA3yc2+N2c/lzkBAiebIBf07aBzX/n
LMi/FwYhdICxiX27Wx6kAjUnESq/Vv6txtnYlMgsBV3wg8b9YuNjQJ6nqLP18iXto06GfHjK59Kh
GmMjT1Xtkx0m6BkGMcOIlFXBMbCdtFPc9YCLXa9TnAyShMQvM6xeR1XcJ/KRL16kvedbKOEOZjbo
9K7zT3pgSBW7IRL7pC4ZaZxHNo0w9I3l6+iTi0asg5xbnRpFClF/fOeW+4Twvrj/o8aATIkLyiKs
KfQO6OI34Q+vLB77PsoPtUqq5oAHRmcOBkykCAouJzyRHH0M5e0qe8CZ3D+Yh8V+g3AYbOEomegI
wBMfI2Aec+xwcAphTAZxVoMNhjlOMTxh/5znJqmqEoYkRlI3O4GbJJXYTbeXlrDdzMAD/qn2KPGC
ylICM7I+6wKhKwg5InMK+KIG0u9JXfM3yhP9onQLcaueof62ZA0gZt/OkwM2OEpsyNjxEP3qRGG3
A82sTvXZIMeOC5oLXZET8mG5YCAiCCEl6c0rPVx9nIrsa08Z5oQ+j1Cs9NjmTHy7ZXkHXEPO+4lm
DY8=
=WP8J
-----END PGP SIGNATURE-----

--------------RuuC5OWKY6Mh3PklycwkAgOn--

