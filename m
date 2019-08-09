Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC11B87264
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2019 08:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=f5BdYf2VxjFQeRG9XU2qySM06ti948zR3kioNg1wVJ0=; b=WhyH8CbTNp2RFOMadknMAn1e4G
	D+IYIn7Nn3QlJS8Z+e05zXl3htJlYskEfKaQAowCQI+LQ0cr060CL0E8lBWzyW37rCjXxE6AXGGyo
	RC79trT30+7ScWd0qs/ltNOyptjMyt38RjpmXJoArLpIF79buQlOKsZhCi4SKE7RGm1UyqZ1Vb68l
	l+mab9nJ4bAaRh9IPdLE7GQg9kAa9OL76Dr4WS58K0/ns/WBY2FpCORqPsxhKpkxI+SOi/vabpTov
	07f3xKCmjJfRUpTzR6UUZft28Dr4bMs8WxggYtuEGixcIH1L4dgs9DWIXn9wQmTpbOAsxqgoF3fWD
	tpE97aQw==;
Received: from localhost ([::1]:46440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvyi4-005KJU-Vv; Fri, 09 Aug 2019 06:49:09 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46604
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hvyht-005KJN-LD
 for samba-technical@lists.samba.org; Fri, 09 Aug 2019 06:49:00 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x796lFqu062969
 for <samba-technical@lists.samba.org>; Fri, 9 Aug 2019 02:48:48 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u92w7j5kc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Fri, 09 Aug 2019 02:48:47 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Fri, 9 Aug 2019 07:48:46 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 9 Aug 2019 07:48:42 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x796mfHh46071956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Aug 2019 06:48:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A98F4AE051;
 Fri,  9 Aug 2019 06:48:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A2D3AE045;
 Fri,  9 Aug 2019 06:48:41 +0000 (GMT)
Received: from sig-9-145-184-125.de.ibm.com (unknown [9.145.184.125])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  9 Aug 2019 06:48:41 +0000 (GMT)
Subject: gitlab merge requests
To: samba-technical <samba-technical@lists.samba.org>
Date: Fri, 09 Aug 2019 08:48:36 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-0rxX6Jzq2mEphOn4hxJs"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19080906-0012-0000-0000-0000033C9FC6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080906-0013-0000-0000-00002176A485
Message-Id: <3e4d2861214f7ff38277e374a9c1955369b9fe30.camel@linux.ibm.com>
X-Warn: EHLO/HELO not verified: Remote host 148.163.158.5
 (mx0b-001b2d01.pphosted.com) incorrectly presented itself as
 mx0a-001b2d01.pphosted.com
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
From: swen via samba-technical <samba-technical@lists.samba.org>
Reply-To: swen@linux.ibm.com
Cc: Volker Lendecke <vl@samba.org>, Christof Schmitt <cs@samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-0rxX6Jzq2mEphOn4hxJs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew, Christof, Matthias, Volker

first of all I want to thank you for your reviews.
It is not very often that I'm getting 4 team-members
to review my patches.

That brings me right away to my first point.
Could some please push MR 679,=20
https://gitlab.com/samba-team/samba/merge_requests/679
as it got now four RB+ but is still not pushed :-)
Thanks for that in advance.

Regarding the extensively discussed MR 677
https://gitlab.com/samba-team/samba/merge_requests/677
Most of the patchset is pushed already, thanks for that Andrew,
but it does miss out on the hunks for talloc/testsuite.c
After yesterdays initial modification (moving talloc_free() to the end)
the gitlab-ci testruns failed.
This caused Matthias and Andrew to remove their support for this patch.
Because of this I removed the hunk in question (testsuite.c:1030) and
re-pushed...now passing the tests again.
For this version Christof provided his RB+, so I believe it is good to
go upstream if you (Andrew, Matthias) could revisite the changes and
verify if you could support it again.

Meanwhile, I figured what the issue (failing gitlab-ci) was.
It was the move of the talloc_free() passed the torture_assert() check
which verified the number of times the destructor was called.
Obviously that number is different depending on where (before or after)
the talloc_free gets called.
I verified this by triggering another pipeline-run
https://gitlab.com/samba-team/devel/samba/pipelines/75530514
which does include the original hunk=20
(talloc_free() at the right position).
As you can see, all gitlab-ci tests passed successfully.

If you agree, I could resend this one patch seperately.

I know this mail is getting a bit long now, but I don't want to miss
the chance to point you on those 3 merge requests.

lib: set right context for libnetapi_get_error_string to prevent
memleak=20
https://gitlab.com/samba-team/samba/merge_requests/699

Sswen torture fixes found by asan=20
https://gitlab.com/samba-team/samba/merge_requests/700

loadparm: fix mem leak found by ASAN
https://gitlab.com/samba-team/samba/merge_requests/701

which fall into the same league as the ones discussed.
Aiming for the option to run tests with ASAN support enabled.

Therefore I would really appreciate if you could find some more time to
have a look at those as well.

Thanks again for your support.

Cheers Swen


--=-0rxX6Jzq2mEphOn4hxJs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl1NF0QACgkQug2knLYP
YaualhAAhCppFORraGvYYHuEnv53YP3bQBOUZRI2bXyN43xAem5jnPdpMoNvEYw+
rEL1HYv5Uy1lowsczw3yQQoVzK+/oS3RznUPGcw6a3z8AFKt8VBGdXUtCfcOLePs
kwGJEC02oXhmwZC0X6WV74Bd66K/zidCL6OvAOznpNhYfkeKspX9zSLNMvXiECDe
keuwPol3agK+qy4PUlwWisNLETv3iXd57S784EczR99reI5tQLyJrS3J6an8Lgi7
uIcC/JR8FINWladRcXnJywY70psj0Gl2xVHJ8STp7D3wDtJ2WknPMGcCdf9nvVZi
QXfbtVKhIR5+BTqDcgdRU2JJXDjLTu6E1YIL8NjhlDKJbeBYXzccOL/gb0f6YQm3
8BVwE/kLckzSNA+BQHbMAVQy7/bV+m0i5CZhQ6ZC4POBSxWoTt5WCJpFMeGuxnPA
F2MoiUBmS3zbak8cJ4aAneJs8IHsyjH8Gg7qUBakX59tFKQaH1aDy5xLbdGZmvR2
71I2tbA/ph49d9U0hzT7V+qlfSE3HIoMgxtRhmlymq3FGvnCB0uqMZyrMPFwc14L
p/JEiy8So1WU0IcfQdb0h+/Bv0+ryIRYZgpg/zRVLVs4xz4ezFcctC8koW6PmTMl
Jl0Zv02fmY3xKbWAcyuB+TdlFtvyvsDYfKCLAKFt60K3Z+To+e4=
=qvYF
-----END PGP SIGNATURE-----

--=-0rxX6Jzq2mEphOn4hxJs--


