Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F2BEBB8
	for <lists+samba-technical@lfdr.de>; Thu, 26 Sep 2019 07:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=A21F4hVzLfxBFAPSk9YZUJCMRylT3jII4aZeqyUc6mk=; b=p4A4nV8rPlATsIA/rA5oLalv8n
	Ef2WLHys4iyBF35NvyuaOOX4okBXTrMo5t9h+7YOJTUwU9lb3HlZqIQuVmbGa5Pkbq7c5BoGoJoA0
	d3WrfYo/SvZC+cI4IbLyXboyZ6rns/tc+oRD6+WCLn1r5qAl4oORQDwlberldx0P2XbPpZpRVh96K
	KrGrJrH17OljIV7uXoCQLiBX97oTRmp9L9tE6CuHTe+2H8BvVC7FikOaRno06rwC6TajITgoBJ5bN
	S+Nid0w1dAfaBACG8dAiwAzXlLEn/MImBmqdAW2wN1MW4iiRcjewgtgPo1nVsdmLVorgOgWOfoJ3p
	lTRqCyxQ==;
Received: from localhost ([::1]:40532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDMeK-008jY3-EY; Thu, 26 Sep 2019 05:49:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61054) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDMeG-008jXw-De
 for samba-technical@lists.samba.org; Thu, 26 Sep 2019 05:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=A21F4hVzLfxBFAPSk9YZUJCMRylT3jII4aZeqyUc6mk=; b=IEZKgc56FyG4mtKxjQjcmsoueM
 ZOdTNLNhgfRuR9C9t1VZJ9bbdfOCGfgW1DUQo7Gkk3bQKyK1P1SmMT0ayExdzPQ74gCwqRagPa8X/
 1TbzCijez/eexrxzF/V8dF2EQJlVmruOXCc8Blh8C8yNOo0sT5lGNQ/AO4ciuEPsDdLM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDMeF-0001hk-DR; Thu, 26 Sep 2019 05:49:03 +0000
To: Uri Simchoni <uri@samba.org>, samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
 <a361812a-cc20-40a3-1499-75e381ef1ef2@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
Message-ID: <78fb0221-2127-09cd-a0cf-47a2d3aca2e7@samba.org>
Date: Thu, 26 Sep 2019 07:48:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a361812a-cc20-40a3-1499-75e381ef1ef2@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ZFHVWIL6bMJqPkyj3aD3h2tggVfIiuPZ8"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZFHVWIL6bMJqPkyj3aD3h2tggVfIiuPZ8
Content-Type: multipart/mixed; boundary="ksQ1tLbRq62nsAPXBx8HYhvERKSPrAYqX";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Uri Simchoni <uri@samba.org>, samba-technical@lists.samba.org
Message-ID: <78fb0221-2127-09cd-a0cf-47a2d3aca2e7@samba.org>
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
 <a361812a-cc20-40a3-1499-75e381ef1ef2@samba.org>
In-Reply-To: <a361812a-cc20-40a3-1499-75e381ef1ef2@samba.org>

--ksQ1tLbRq62nsAPXBx8HYhvERKSPrAYqX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Uri,

> Can you elaborate on that sentence, and what is the use case for
> generating passwd for a group? Is it related to a file being owned by a=

> group SID (administrators)?

Yes. And also to support sid history, because the unix token can only
have one uid. When I user is moved to a different domain his primary
user sid changes, but the old sid is still in the token.
And it means we have to change the mapping for that sid from a uid
to a gid.

Another thing is that we don't need to ask a domain controller
to find out if the sid belongs to a user or group, it's just
sid and we just map it to a uid and gid with the same number.
Which allows kerberos authentication without needing a domain controller.=


> I'm not sure I ever understood this ID_TYPE_BOTH thing - I seem to
> remember that my understanding has been that it simplifies the code -
> that some rid backends don't know and don't care if a SID is a group or=

> a user, but they sure can convert it to a unix ID, hence the "both", bu=
t
> that explanation doesn't mandate ability to generate passwd for a group=
,
> so hearing that this is actually what ID_TYPE_BOTH is all about was
> surprising to me.

When you do a ls -l the number uid or gid should be converted.
Or you can use chown with the name.




--ksQ1tLbRq62nsAPXBx8HYhvERKSPrAYqX--

--ZFHVWIL6bMJqPkyj3aD3h2tggVfIiuPZ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2MUUcACgkQDbX1YShp
vVawNg//Q5mkwPFyui9wd0jkzzJsLTOLQ46edC3Kx0+uoSqgwWhcIYfr16BGBr9d
PtBF98UlYAu1Tbo3n7Y9eI+Mc0TFXh7BncFR5oHM/og5wLhN27clIePA/tdSuV6t
wHkAYN9c4a8YzeAFJPiRPtGdRGqXObp+SMrDPDwPLXtcfmbP0vq8Z7ljGwAiUHjq
dlKLy365hCY5ZRhzyD8f5bwA3dySEuvjoJetGgvzx8TE4s9sfWi2AGBBmy+pIZC0
hHBPL2Wr4jWb66QZ2bw/DS2+JNz3nOIMT1m9/CWZROVVgzSIPRGZdOqcmxA0RYGl
CRUPfu9FmD5Vu70sKDGSyw7u9WMVLLyAx/OwUVFJDsFQQ8B2Kbe4m0jvU6yy6fCp
TtNlkYQIT4KJfN+AJ4qprXfZyTrRFGe0B2hRPhkTYI960iPz9mWP5poS9xS8TLFL
wmaCjRStYR3BjhK6kXo8G40Ep0Gb+g8wmevRE972x4Xyd//ullaOB0vPwpViQz/9
fHUk8VWr6nGHSriIBgxSscc9hzD+t4MMsFHrZ6EhTDpV3Bih9kJnuRBZVgcEhm+j
NHWbs1aG0ZEzw6xkpzI1cVW5uNaSKJ80Y08sRBDtXSKUZyIs6PplUiZpm3knXhjZ
N6xQEFNt10bzc6sAzNlLs1VtwPBFYAwX5nMC6yUyjvMQzJ2+K+Y=
=nUNu
-----END PGP SIGNATURE-----

--ZFHVWIL6bMJqPkyj3aD3h2tggVfIiuPZ8--

