Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB33E95A27F
	for <lists+samba-technical@lfdr.de>; Wed, 21 Aug 2024 18:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qVwRaNUS929dJN12CJsugsT1bxV7ktNGouRjht4AW7w=; b=I/EtSvHVtzR5sjIXv+YcuC5dpU
	MK0V0g/LKHJb00aoS4UPH1hYBHPJOZ8/dUxhpcubHl0wWy72XkiLo+OPW9oqPpylSVKmdUIllvoJb
	lx3w/fRscCcsffFZxnYBkimjq1kxj+n6gAD42jQrVWIxJrSO3EjkEeeF64cXyQ78lScGDNQCetMsO
	kkOs02JP5tyd38broyLifntYkMlJYHRYILN5JNCJxoQnTtBiQWyRWFdKHxsdWEPosent0f1tT4PcV
	I+oFHrVcWizJQRZQgowWjmRlmVuXu4tQAFRqQVD40WZ95wYX8YJ7r0BBnjgi2VHaXpUbYUauaqEBQ
	Bu5YDB7Q==;
Received: from ip6-localhost ([::1]:56622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sgnw4-005AtZ-9D; Wed, 21 Aug 2024 16:11:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59476) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sgnw0-005AtR-NO
 for samba-technical@lists.samba.org; Wed, 21 Aug 2024 16:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=qVwRaNUS929dJN12CJsugsT1bxV7ktNGouRjht4AW7w=; b=kTYYHtpV/elApte76iKn+BkbXz
 GYMtiZ6vor93hPbS4v0b+JetDPfS/+dGTsVwlTDuhK9REVj/kFX96WbQGOg3MRpI12B+j4O7i4pCI
 gzOvjp98wx5MkYfFBItXCUyDpfXmCd9w7t9n7m+sWwKrQThM7vjrWkClB8sEnj2d7mLUgekteXTVA
 0ChwooNbcAOGoOdfQc9fx94Az1MxA4FzJWAjfDgwWKpx6v/he+EdwhUm8Fo4DIBvh/rJnXm248bYf
 mdKPKED8Wnc+bHyQNagmBjSWF4yCOJvbm21aG3V++tEFH9emqSI4EaBZb4dzvtEcA+iQeeXOgwkk7
 zl2iRVP2q8DDmF6B37QNGNPg0332GwUImqp4wLOmLZ7HZC/Po69oJ2G85iP3x//pRR8qnihv1S3NB
 aIY4cxSPZNd7gIIy1Qp2CBpnskxEU493KYrxR+2NuHdv1+g+Cp905lDd6ACUEVdBj5g5FdqOSefej
 F6GDcDavKEbuk3Ajk13kwVtc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sgnvz-007V4y-1h; Wed, 21 Aug 2024 16:11:43 +0000
Message-ID: <f1bc4bde-f1ff-4b52-9cf4-822f94b31a75@samba.org>
Date: Wed, 21 Aug 2024 18:11:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba server multichannel session setup regression?
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAH2r5mtUTOFgaQMbsWwkAD-XDRiVwyAGT=Q7n9i5Sd6Wf=9q+Q@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mtUTOFgaQMbsWwkAD-XDRiVwyAGT=Q7n9i5Sd6Wf=9q+Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Df5GuAkqejEExWAZtpG1RR6N"
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 Paulo Alcantara <pc@manguebit.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Df5GuAkqejEExWAZtpG1RR6N
Content-Type: multipart/mixed; boundary="------------EF4z5S2hfCFiyF8MmTKKKTp5";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS
 <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@manguebit.com>
Message-ID: <f1bc4bde-f1ff-4b52-9cf4-822f94b31a75@samba.org>
Subject: Re: Samba server multichannel session setup regression?
References: <CAH2r5mtUTOFgaQMbsWwkAD-XDRiVwyAGT=Q7n9i5Sd6Wf=9q+Q@mail.gmail.com>
In-Reply-To: <CAH2r5mtUTOFgaQMbsWwkAD-XDRiVwyAGT=Q7n9i5Sd6Wf=9q+Q@mail.gmail.com>

--------------EF4z5S2hfCFiyF8MmTKKKTp5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk9uIDgvMjEvMjQgNTo1NyBQTSwgU3RldmUgRnJlbmNoIHdyb3RlOg0K
PiB0cnlpbmcgdG8gc2V0dXAgYWRkaXRpb25hbCBjaGFubmVscy4gIEFueSBpZGVhcyB3aGF0
IGNoYW5nZWQ/DQpjYW4geW91IHNob3cgdXMgYSBuZXR3b3JrIHRyYWNlIHBsZWFzZT8NCg0K
VGhhbmtzIQ0KLXNsb3cNCg==

--------------EF4z5S2hfCFiyF8MmTKKKTp5--

--------------Df5GuAkqejEExWAZtpG1RR6N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmbGEb4FAwAAAAAACgkQqh6bcSY5nkaL
BRAAxDBnNnBv46NfK0LFZDP9G7UNyk/dBy+odDrEx4/PnfuSi7ylUYYkdcNC2Cc6adk8bCvIQM7o
Xes7aGJ2yRFLoWqman8gkGOzmXZVGQpP3Jh8oZretmzoWmVE0HS88WTUAxjQndaFsCpSRaUHaR9e
Gfi6CUf1SJxoKef7x/hClByYB0+4s4Y+qmdyU/x6XkYqD03+WsnIc3VFrV2zTjGy1/d4ssC5YP62
01TKGirKvOs2vciouiw2rQgvRARqNrFx5fS9F8AdhsUf/TZSWhqMLJo4BnQSE8q723V7EAd76bxr
V16RvxMSEQWOw+PXdd3sSytnGX8yyk/YH1yHuuISHr4rzRR8TR9S3AUA/hhFmN7Fo9pQ50W7rI5S
J9Eb8ojCoA6SK4+LRg/bvMDCnQIlmPUa5Z55D6LyUb+YnEWsVnYxbXsnDGZNTmMFHaGOARHJcoV2
T9p1MIR2Nk6nsJO6Kygk17D4ThgbxjCdDJ1TnXwOZ6zMAfGadSNje+Qt//EU/XbpEjzLqBzY9VDs
RXXg6CF6qxZCiHEGTUBjBFAhLOc/1uVSc4NBJy9HqulILowGRLvco/Xyslpndw3YzKEh/mPP6nNA
vMUAFpIzi4lS0ObMDaK5pVeK+Yib7EwzK9mzUmQSqnCHkl/TXjqeQEtUINpcjuUc+86D6LZVHNHZ
sRw=
=qFC5
-----END PGP SIGNATURE-----

--------------Df5GuAkqejEExWAZtpG1RR6N--

