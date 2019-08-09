Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 329268738A
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2019 09:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=a7DhCwvw+7r/eHhst0si3+IYT6SLWgZ/nh9c3SE184s=; b=HHfVAIm6Q4U1ju/8Gk97Tl3HkO
	rJqDtJIMbRTWZ0otLa2E3zRjCw/HB97peu/eA+9lRuXLEMrwrPi2LOQMRKvtvrjVvK0LEmE2fkB8s
	bgc9pFeUdBt2YyraLdXb9fcSS1dX5QEcrIvDzvL5t+281U69JSGRckwdVkRqY7SrFnvd7QzWm63ia
	wAz7uapu6yiYtmfUNZP67dqhKUAqbhwla0a48dwAKcb7l9DEyJNmJ+/R5JEabqbPrEutR5TquqkTM
	5A3bjz+XQt95lkwV0LvGWm7ooAYHNTO1C7Pgf5NknZoMB9xAJT/tkqbVnUmkrwEMz6xLOV+0Z1i4V
	KHjY/TUQ==;
Received: from localhost ([::1]:57820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvzlT-005M0r-J5; Fri, 09 Aug 2019 07:56:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13096) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvzlL-005M0k-R8
 for samba-technical@lists.samba.org; Fri, 09 Aug 2019 07:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=a7DhCwvw+7r/eHhst0si3+IYT6SLWgZ/nh9c3SE184s=; b=qae5/Gx03LWQxazX1cCpNJbs1y
 HZfE3z8EVruVCrofHirbS80Y5hLZDn82llmy11Q5IfmXaQqC7wHN/BeX1lv0j4+ldS4dW8hmF/pxe
 yF2fGHOW02B0CJD4m3RuC4Xw95OxXIL7+0vo8faIWxh1F/hc6fxziLAY8OUEuwxcvnyc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvzlI-0002kp-Rp; Fri, 09 Aug 2019 07:56:33 +0000
Subject: Re: gitlab merge requests
To: swen@linux.ibm.com
References: <3e4d2861214f7ff38277e374a9c1955369b9fe30.camel@linux.ibm.com>
Openpgp: preference=signencrypt
Message-ID: <e3971e2e-ebec-b0a4-aa09-c896ec47efbe@samba.org>
Date: Fri, 9 Aug 2019 09:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3e4d2861214f7ff38277e374a9c1955369b9fe30.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bDJPvairFefpDrB7fe1sEu6HZV2owf4i3"
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
From: =?utf-8?q?Matthias_Dieter_Walln=C3=B6fer_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Matthias_Dieter_Walln=c3=b6fer?= <mdw@samba.org>
Cc: Volker Lendecke <vl@samba.org>, Christof Schmitt <cs@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bDJPvairFefpDrB7fe1sEu6HZV2owf4i3
Content-Type: multipart/mixed; boundary="oYGtE69TXT9ME0YFZwUw31RdNYR807oBM";
 protected-headers="v1"
From: =?UTF-8?Q?Matthias_Dieter_Walln=c3=b6fer?= <mdw@samba.org>
To: swen@linux.ibm.com
Cc: samba-technical <samba-technical@lists.samba.org>,
 Christof Schmitt <cs@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 Volker Lendecke <vl@samba.org>
Message-ID: <e3971e2e-ebec-b0a4-aa09-c896ec47efbe@samba.org>
Subject: Re: gitlab merge requests
References: <3e4d2861214f7ff38277e374a9c1955369b9fe30.camel@linux.ibm.com>
In-Reply-To: <3e4d2861214f7ff38277e374a9c1955369b9fe30.camel@linux.ibm.com>

--oYGtE69TXT9ME0YFZwUw31RdNYR807oBM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-AT

Hi Swen,

I gave you my approval.

Matthias

Am 09.08.19 um 08:48 schrieb swen:
> Andrew, Christof, Matthias, Volker
>
> first of all I want to thank you for your reviews.
> It is not very often that I'm getting 4 team-members
> to review my patches.
>
> That brings me right away to my first point.
> Could some please push MR 679,=20
> https://gitlab.com/samba-team/samba/merge_requests/679
> as it got now four RB+ but is still not pushed :-)
> Thanks for that in advance.
>
> Regarding the extensively discussed MR 677
> https://gitlab.com/samba-team/samba/merge_requests/677
> Most of the patchset is pushed already, thanks for that Andrew,
> but it does miss out on the hunks for talloc/testsuite.c
> After yesterdays initial modification (moving talloc_free() to the end)=

> the gitlab-ci testruns failed.
> This caused Matthias and Andrew to remove their support for this patch.=

> Because of this I removed the hunk in question (testsuite.c:1030) and
> re-pushed...now passing the tests again.
> For this version Christof provided his RB+, so I believe it is good to
> go upstream if you (Andrew, Matthias) could revisite the changes and
> verify if you could support it again.
>
> Meanwhile, I figured what the issue (failing gitlab-ci) was.
> It was the move of the talloc_free() passed the torture_assert() check
> which verified the number of times the destructor was called.
> Obviously that number is different depending on where (before or after)=

> the talloc_free gets called.
> I verified this by triggering another pipeline-run
> https://gitlab.com/samba-team/devel/samba/pipelines/75530514
> which does include the original hunk=20
> (talloc_free() at the right position).
> As you can see, all gitlab-ci tests passed successfully.
>
> If you agree, I could resend this one patch seperately.
>
> I know this mail is getting a bit long now, but I don't want to miss
> the chance to point you on those 3 merge requests.
>
> lib: set right context for libnetapi_get_error_string to prevent
> memleak=20
> https://gitlab.com/samba-team/samba/merge_requests/699
>
> Sswen torture fixes found by asan=20
> https://gitlab.com/samba-team/samba/merge_requests/700
>
> loadparm: fix mem leak found by ASAN
> https://gitlab.com/samba-team/samba/merge_requests/701
>
> which fall into the same league as the ones discussed.
> Aiming for the option to run tests with ASAN support enabled.
>
> Therefore I would really appreciate if you could find some more time to=

> have a look at those as well.
>
> Thanks again for your support.
>
> Cheers Swen
>



--oYGtE69TXT9ME0YFZwUw31RdNYR807oBM--

--bDJPvairFefpDrB7fe1sEu6HZV2owf4i3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdTScwAAoJELAeRMgQzsyASpYQAJB0/ihBcNNIcaQAiuCuCzMu
HEBEJCR+Uo/VLtdAQ31CeD3z8tP3A6mTh8VF1YaunvuvmoCzqWWeYgVuARHEU3Fb
79GqOCjYCXHWIMyVofUQxlirgmAQgzAGrKZ1SKcEmrKgP291tIx2/wowmQpUt33N
YTm8svNJa8RffDKn0+0vIBC4natXP1ldjZw53cIN19+Rsh36dAZB2rS9LB561H/3
3QfHnNOP1LsZnMr1XOc0jOfRBH4YU/LRutKOWNm2cMIRQBCEA85Xb5K5bfBP0BJE
zRn6Q5xozNBimZCJnCSxRheoDkGoURH21kFXq68XL2NTC8ORdEZAEbDStKsH6bJy
nw9jpz9EBejt1fPf3Buf4z6i88BdHhfoeT4pHOg6k6/HikIKaosDVgOJbgUq+Heb
GQ4TPheDmB6aJqqyxxDPzVB+NLgFieW2RWHzggCLmgDWNwiFzJDMhrM9DMyHi5q+
f/vsfIm5Nv6h7vZZQPl81L9+HP0AIu13v4WvjkFG/lMF9D3nI4AjV6quudmEF6Jk
8Biel7OnuGxZXomCWQOcLHacYQ1HD29hyyRAIPfBFMw6byZCiFqlAa8q5spHHuoQ
x+ICQSCCMyqhmf9RsMColz3uFxjQ3fk3Bfk8Rw3dglVaSaquUG1R3e5AyAuv0h8R
knHcqBkQKgkysB5RlInM
=M10e
-----END PGP SIGNATURE-----

--bDJPvairFefpDrB7fe1sEu6HZV2owf4i3--

