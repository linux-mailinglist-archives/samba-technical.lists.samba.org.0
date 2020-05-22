Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F06E61DE795
	for <lists+samba-technical@lfdr.de>; Fri, 22 May 2020 15:03:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=KFQW4uFMlgflvkIR3KFpgFon41o5wkWluY36cYLkLnc=; b=Upw4AMppGt3tNO/Ddd7oqDytqy
	wFOXm0jA5TTEpBUkshkz7San7bXE4NHqSAjeGOtvvu9VPWVNIOfAqN0AMRGQqViFyMN1pFB9ttIBU
	vb9llvQlNaKj1wDbqrUx/NNQg6wks/RCNm0dbiHJFpnjb+Id8j3RUNyXbTRd9rzqGPyAKh0fgKb1k
	2+k6vY3/sYyNXCUQrxjLE3kOhS72/ZCHMZa9Y8Imeab+I1EPTH9hvaJFs/Jmy4V+CYWycLEn3PQj4
	euy9I7/zo29+LEXHvbgDGbk4f8OrY0nqFcggbpCw/GbYwT+0UML1vnHi+5kePZ6zf7JTbRr5ayuBf
	ebJtx0kA==;
Received: from localhost ([::1]:46906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jc7Jz-005WVg-Iy; Fri, 22 May 2020 13:02:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36600) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jc7Jr-005WVY-Rm
 for samba-technical@lists.samba.org; Fri, 22 May 2020 13:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=KFQW4uFMlgflvkIR3KFpgFon41o5wkWluY36cYLkLnc=; b=3N3nxh5SJ2qgr8cqIRsKAxWe7t
 b2cAQN/4F3w2XkSYL9y8oBnEX3ghkyuN+Lfmj1qfqgYKnS8dJG2a4gUH76Jg5HX2w1n9oHZXKxMLJ
 XxCJPudMh6IRMZ47hW2ey6MqQWKaus6meo2VouzzyGNFEPAUqTYU0kNeL9++W9bx+/CdbZHVXtzt1
 IK9LX2YC3bS0WrUAS/RnO1i/0zRUSvGulxYa3GCFW7i+bosKEg2ai+dG0AqL4gBQ2RG8FtVEBskNB
 ZT70tWdyRl90z2CLupUU167HPrVtWmSwyhH7CRw/mLnNLLN24fRkO5w+kQqQ8VhdsNADSYWI580tj
 BZOAXvvwzU3QVAZIFSpQkWMH7PJmeY4U3dDt7LGqR2OaAhVYA+BzsuII0pCPOegD+T8caGC0ugjgx
 c+EdyPSnPvXgw/WrH6deS1BzwfHSJrjuCUql6A2XWlFkO3ATJ0/HPyalA8ndZ/at553HcQeqQte/3
 KQ2Q1whZxXDIdC3h8h6yYTxl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jc7Jq-0007ej-AE; Fri, 22 May 2020 13:02:34 +0000
To: Andrew Bartlett <abartlet@samba.org>, Christof Schmitt <cs@samba.org>,
 Jeremy Allison <jra@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
Message-ID: <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
Date: Fri, 22 May 2020 15:02:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9KDro9lfJ4xZ1lTLnnFfwl6wLIfmYNb4Q"
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
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9KDro9lfJ4xZ1lTLnnFfwl6wLIfmYNb4Q
Content-Type: multipart/mixed; boundary="abTDVPiWwNyR0t6AckZSQLGbTPGAUudx5";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Christof Schmitt <cs@samba.org>,
 Jeremy Allison <jra@samba.org>
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
In-Reply-To: <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>

--abTDVPiWwNyR0t6AckZSQLGbTPGAUudx5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

>>> That sounds like a sensible plan to me, but having said
>>> that I'm not going to be the one doing the work :-).
>>>
>>> As we as a community have decided tevent_req is "The Way"
>>> then helping our older stacks integrate better with it
>>> is certainly a good way to make progress IMHO (and I'm
>>> as guilty as anyone as the author of the horrible hack inside smbd
>>> to do async opens which sidesteps tevent_req in order
>>> to reduce code changes).
>>
>> So i am trying to understand where this leaves us. The driver behind
>> Swen's patchset is to move away from libads with the end goal of
>> being
>> able to better control the domain controller selection.
>>
>> Now there is tldap and ldb as possible ldap libraries. Do we need to
>> look at the integration of those components first, before adding the
>> ldap library usage in winbindd?
>=20
> Yes.  I think so.  I know this sucks - being told to stop on a fairly
> simple change because we should do a much larger thing, but I'm really
> passionate to avoid having three full stacks.=20

We already have and winbindd already uses tldap, so this is not adding
something new.

>> The goal of having one ldap client stack is worthwhile. From what i
>> can
>> see, tldap implements the async tevent model, with the exception of
>> the
>> gensec part. Also the async calls are currently not used.
>>
>> I have not looked in ldb much, on a quick look, it seems to use the
>> openldap library again. Would it make sense to have ldb use tldap as
>> backend and eventually move away from openldap?
>=20
> While there is a historical OpenLDAP backend in LDB (a legacy from a
> time when being a semi-independent project was critical, possibly still=

> used by sssd) Samba uses lib/ldb-samba/ldb_ildap.c for all ldap*://
> URLs, which is based on libcli/ldap.  This one brings in the full suite=

> of GENSEC, Kerberos etc.
>=20
> I'm not opposed to the concept that libcli/ldap and tldap are merged in=

> some way and see particular opportunity for tldap to use the LDB
> structures (which would reduce further the code in ldb_ildap).=20
>=20
> For another approach, if the initial issues are around timing handling
> in the OpenLDAP libs under libads, significant advantage could come
> from rebasing libads on LDB.  libads is a sync API (and stuck at that
> for now) so the LDB sync API would be a good match.  Doing so would
> make things like our 'tls *' parameters work consistently for all our
> outbound TLS connections, which would be a big win.=20
>=20
> I realise this is not what you were hoping, but perhaps we can find a
> way forward here.

As you know I like the idea of having things implemented just once!
But as found out in the past this is a lot of work and
replacing everything at once is often not possible.
We learnt that we sometimes have to do small steps with intermediate
states, which we sometimes not like, but at the same time require
in order to make progress at all.

There're a lot of things I'd like to see:
1. The ldb api should not be used for pure LDAP users,
   it's bad enough that the strange async model exists at all!
   We should hope that it's only used for LDAP for command line
   tools in a sync fashion.
2. source3/lib/tldap_gensec_bind.c should use gensec_update_send/recv
3. tldap makes use of the "client ldap sasl wrapping" and other
   options, which are use by source4/libcli/ldap/ and
   source3/libads/
4. We can add some helpers to get/pass 'struct ldb_message' from/to
   tldap c.
5. users of source4/libcli/ldap/ should move to the tldap api
   - lib/ldb-samba/ldb_ildap.c can become lib/ldb-samba/ldb_tldap.c
6. libads should go away it, at least it's low level internals
   maybe it can be build on top of tldap as a first step in
   order to avoid a rewrite of all non-winbind users.
7. winbindd should avoid libads and only use tldap.

But the goal of
https://gitlab.com/samba-team/samba/-/merge_requests/1351
is moving along with 7.

And I'm not seeing why we would require 4, 5, 6 before doing 7.
They would be nice to have, but they tasks for another day.

BTW: I'm not saying that I'm happy with the current patchset of merge
request 1351. But that's a different discussion.

metze


--abTDVPiWwNyR0t6AckZSQLGbTPGAUudx5--

--9KDro9lfJ4xZ1lTLnnFfwl6wLIfmYNb4Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl7HzWUACgkQDbX1YShp
vVbU0hAAqsJ4ubiK49FG4geYvpIycPGYS1Ba1A42SKf1iPETNVklxZM+ySeVYoj4
TWUit2h7Ykv82EJNSM7zoYaHqsnMGehMOVAibcKY8tixKALHt9e6W/DGKj+iCKQJ
j4DbAWIZbRS3FKGcerwlsEQJHyEWNEITfL9VzF4CJ49/9fg51R7SbD+BcrB+gw9/
CNPnv7tv3z9xnos176+bBWMPWX4f2TxNjrHjskwxmVrdCMAJY6SnS9+mURs+Sxe2
sJyAng7dRv0p2CVbyRhzCeFsV5WBnuzBbk5+94teHzDjPl12kZnwBgj8KYcKnFEr
gjRjmtRifZIDBzjlYlWzu0Pu3e3bQdhlomWXbHYChAwg4S/xmli+4VRTmpmTelMo
6HWHFYa+m/9hhpsxtdKZrmwXhVgcKT/K29gTdXY5qKDWO/PRRFYJvXk71tRQgnvz
Ap8gp2Dhjqpi1EDVGObIREyorMf1h6kGeAnJV1I43ZmTpoq0nVGC9YyFUtk6rhig
ttt+mHzz3gP+2pNu1o94ZRRWYRyoi140zKeXGxodhezGFteOd5ITUr3T90DbOnAU
ZcT44grkz0/nhioQkmTXuABbRLIqaiZrP3tn7qCu7Hm/SOX1U4udIdymWxeqp76S
hn6YVL7S9uwH/9J39PCnlsB6r2a08i+T18PjpbacbYkHcjowQ3A=
=NJRd
-----END PGP SIGNATURE-----

--9KDro9lfJ4xZ1lTLnnFfwl6wLIfmYNb4Q--

