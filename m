Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64E42827
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 15:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=E4rWC9lUDsLJSNMs5KrVmliXIc0kzbfYrQsAj5ZdBcE=; b=kdnVmboJuVCDuQseWUigKlFveq
	QIi2IowuuB1l8wd+G9KGz/KejTIknqVZv5fBa9zJGZ3iE3razaNUqBtYiX/xsUnPKQpi7rFaAbenW
	IjU6WZUnjjaHYJOs94qtlLJDaKhZ2K26SsnmqTeYjBPo8EVM9wFoofhRWSVvt5GAmQNuwpEP/8RUU
	iMz6wi1xYi/CkUv9tBnD3O8/8mpsR485hwIpOB10+0BbF0d05NcBL5BmZflq0onJKXNIZ5Y3CIh04
	S4gRjUf/nTUlVflv3KjTbhhLDd0laitbhxqf70BYApeM3H/j/xFOVNIx6qDrcOWwFQNpMEPMrVn07
	E5O0rqgw==;
Received: from localhost ([::1]:60690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hb3jt-0019nZ-QN; Wed, 12 Jun 2019 13:56:33 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:47317) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hb3jq-0019nS-1c
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 13:56:32 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1hb3jo-0006ck-37; Wed, 12 Jun 2019 15:56:28 +0200
Received: by intern.sernet.de
 id 1hb3jo-0006jU-0q; Wed, 12 Jun 2019 15:56:28 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>)
 id 1hb3jn-00016o-Q7; Wed, 12 Jun 2019 15:56:27 +0200
Date: Wed, 12 Jun 2019 15:56:27 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Some bugzilla work and thoughts
Message-ID: <20190612135627.GA24651@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 Anoop C S <anoopcs@cryptolab.net>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
 <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-12 at 08:05 +0200 Andrew Bartlett via samba-technical sent off:
> > It would be good to have an indication regarding the release
> > version/tag to which a particular bug fix has gone through while it
> > is
> > getting closed as RESOLVED+FIXED. We could either use a bugzilla
> > comment or built-in 'Fixed in version' field to mark the version/tag.
>=20
> Yeah, I generally do that, indeed that search takes most of the time
> when doing triage.  Perhaps one of the bugzilla admins can comment on
> the practicality of extra fields.=20

this is what the "Target Milestone" is for which we already have, which say=
s:
the fix has gone/will go to release branch X and up. It's not meant for set=
ting
the exact version though. The "Target Milestone" is not often used in our B=
ugs
currently, maybe because the flag is not well known? Adding a Target
Milestone value for each release version does not look practical to me and =
will
cause more work and trouble than good. Karolin might consider to add the
upcoming samba version where it currently just says in the comment text "Pu=
shed
to autobuild-v4-[7|8]-test." On the other hand I think it's not too much to=
 ask
for also to look the exact release version up in the release notes (or the =
git
history if you prefer) in case that someone is interested in the exact
version where a fix went in. All the bug IDs are listed nicely in the
release notes already.

Bj=F6rn

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXQEEiQAKCRAxQwafzsNC
PwvBAPwIL5r4A1xb7ZrEqEHNQqdte3Nx190GpjsB/ABxnFQjjgD/VnJb+LcgUB6H
IslsLPJw7e0bZ5n5cQY+iNeW0jOxDAk=
=uzFM
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--

