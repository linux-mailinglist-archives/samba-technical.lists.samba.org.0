Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C21AA37698F
	for <lists+samba-technical@lfdr.de>; Fri,  7 May 2021 19:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=4DORgXW4xoB9BWWUmJ5qP1zTVwriOinHnBMdS2CLrek=; b=6Er8NzY3p2ZUwo9ER0mB2iapB4
	d/bQ1SV4ipE5hGVR6wcVOX5+QS4zKx3O/sxtWfrAZg3lzaf0r8sxqRbY9ONdHlUM5b8s7QioEa1gD
	JPnJdjND0lw5Z7y7nti+hTCdtPJxDrDlNT9QboMORSLWH/3MHNZODel9LRSQrW+hCa68FyBG6VZD1
	Zpsmxs6bGXaDbCvxPxqI9giYDb+c1NRyo8NgGTGTwPMG3da2obIyrdhPMqVO9x9+z2fjAsSeUYNjH
	ERjLioK+YNwvGdBRVKESkRwDB9IcRUkC7AhJzWRehD9xUMmsHDppEwrMPTM4pCQqvueI7c04p2yaW
	5yeLpLJw==;
Received: from ip6-localhost ([::1]:49408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lf4PQ-00GO1m-0j; Fri, 07 May 2021 17:37:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lf4PJ-00GO1d-S1
 for samba-technical@lists.samba.org; Fri, 07 May 2021 17:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:To:Date:From:CC;
 bh=ESNofvIzKAwNPrGkOA8l4oWFMZk74/e+b5J44uyCZHc=; b=dp9Ac//BEpO8sOCEa0f1n1tZKX
 GzUNIRCtMwR/LsP0IFmxYDIIUqhtTXDPJzjjlD5zndXMA3ViJDAphNx1mnj/pGH/7D1UVIrBy3G0u
 PRQFqrZKIBFcYWn69X9v/JM3r+G9m6RFXo8yRb4jG9FCXqzhpe5kjAwEm+im5XTjA1EL0wQmSRIzn
 FkgVvtLZqSvLypeuM/C1vqIlfICzFtexmFjxzz2tpLvPi1KZt+FgSGH2iPQSZqnXpD13tvafVOtvC
 EGvMBhjBUZct2X9Zd2xQq9frwQbJhw3WcurUBbNmd1bBlCQUj1aJCu93YJd+dm7q6WI1S34qBLtzC
 lNra/0HiBPqNPt1T15BuRe+4cjHKpm7v4VPVibaeCf49pM5NX3XXRm7NRN5QGBmS3xwzF+1D4jPTD
 UxHQf/3uNOdO0uEa0grkgfKnFnptzr1KYDTD8m/J2+we466aOSVNfFR86Aavigm4/0k8Egbdz4u+n
 WKupZx+QNP2QGRd0fUYcOC8j;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lf4PJ-0006Ld-07
 for samba-technical@lists.samba.org; Fri, 07 May 2021 17:36:57 +0000
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Introducing the samba-in-kubernetes project (SINK)
Date: Fri, 7 May 2021 19:36:56 +0200
References: <29083327-12B7-4BB3-B1F9-273DB79C789A@samba.org>
To: samba-technical@lists.samba.org
In-Reply-To: <29083327-12B7-4BB3-B1F9-273DB79C789A@samba.org>
Message-Id: <5E18C0F5-C1BC-45DC-8D40-B1958F304435@samba.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Update:

The slides for the presentation can already be obtained here:

=
https://github.com/samba-in-kubernetes/samba-operator/blob/master/docs/pre=
sentations/samba%20in%20kubernetes%20-%20sambaXP%202021.pdf =
<https://github.com/samba-in-kubernetes/samba-operator/blob/master/docs/pr=
esentations/samba%20in%20kubernetes%20-%20sambaXP%202021.pdf>

This newly created page contains the old presentation slides and video =
link too:

=
https://github.com/samba-in-kubernetes/samba-operator/blob/master/docs/pre=
sentations/README.md =
<https://github.com/samba-in-kubernetes/samba-operator/blob/master/docs/pr=
esentations/README.md>

Cheers - Michael



> On 6. May 2021, at 22:28, Michael Adam via samba-technical =
<samba-technical@lists.samba.org> wrote:
>=20
> Hi all,
>=20
> At last year=E2=80=99s sambaXP conference, I introduced kubernetes =
concepts and possible use cases for samba in the era of the container =
platform and demoed the prototype of a samba-operator. Slides and =
recordings can be retrieved from the sambaXP archives [1], and the video =
is also available on youtube [2].
>=20
> In the meantime, the prototype has grown a real ecosystem:
>=20
> We have created an organization samba-on-kubernetes (SINK) on github =
[3], containing a few initial repositories:
>=20
> - samba-operator [4] - the operator code
> - samba-container [5] - samba container (file and ad containers)
> - sambacc [6] - configuration tool for samba in the container
>=20
> We have also created a public =E2=80=9Csamba.org=E2=80=9D organization =
on the quay.io container registry [7]. Pull requests on the code repos =
are tested in kubernetes and container images of the operator and the =
samba container are automatically built and published to quay after =
merging. The quay.io space can of course be used to host other, =
community-facing samba containers!=20
>=20
> Today, at the sambaXP conference, John Mulligan and I gave a =
presentation of the current state of the project, including a demo, and =
an overview of the work that is currently being done as well as an =
outlook of things on the roadmap. The sambaXP website [8] will be =
updated with slides and recordings (will also be available on youtube =
with an ETA next week as I heard :-) .
>=20
> Contributions to this extension of the samba ecosystem are of course =
highly welcome! - Issues, pull requests, and also the github discussion =
board work in addition to discussions on the samba-technical mailing =
list.
>=20
> Cheers - Michael
>=20
>=20
> [1] https://sambaxp.org/archive-data-samba/sxp20/sxp20-d2/=20
> [2] https://www.youtube.com/watch?v=3D8u74SDHxD6A=20
> [3] https://github.com/samba-in-kubernetes=20
> [4] https://github.com/samba-in-kubernetes/samba-operator=20
> [5] https://github.com/samba-in-kubernetes/samba-container=20
> [6] https://github.com/samba-in-kubernetes/sambacc=20
> [7] https://quay.io/organization/samba.org=20
> [8] https://sambaxp.org/=20
>=20
>=20

