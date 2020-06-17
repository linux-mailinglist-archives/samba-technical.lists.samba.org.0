Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C491FD28A
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jun 2020 18:48:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oZ15Fltq+uhcaeSU8Xtu24/AGdu74IytTY6dCBxQJOA=; b=yibsjOUvBaO/D4aIMWNsOZYCo9
	Q/CBJ0ZgAMulyPZCglI5IRQL9myk5MSJ/nx/+jyM2/aLlDZ1GlGsIjqUZifOj/LwyFP5Xu3B19VRY
	xP6vQ2C/TH1IIaMC/cU9FWbiuvqAVtI90bfkGevWnqqjBbrJsu134gymcVPrfc42ph+R+lqZAsm3d
	7qy/pCvwVmBPMT6bKcLNrJPXgAi04IgE2G+2oL7p2fAuVRDkq2QkVhV72cvkZkvANQPLYPBSFaBzj
	2Iye19tRZqB3RmIdrb4JXCRsxopL5nccvycMigSG8LgV/TSMUgz4XupixlQlDTER1sLepjm6srG11
	sbj0R3jw==;
Received: from localhost ([::1]:46612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlbEj-0010pJ-Kv; Wed, 17 Jun 2020 16:48:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30374) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlbEe-0010p8-4S; Wed, 17 Jun 2020 16:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=oZ15Fltq+uhcaeSU8Xtu24/AGdu74IytTY6dCBxQJOA=; b=Vvgc2Q4cAK1gBdbFL8w0nV94n1
 A+ssYlmbD+/GAVfUQLy+E96+MSDL7ehOf71Ye1OO3COjbXtAcEJbOFVKtbRcNsBbp81AkOIuKXaY5
 5DiWXxqhWd7j8xl6n2GAOnYQdHEIimnccH/zWQt92k3FlyTvr08zPtcdyntju8IwpY+ZMcUym83xj
 DIyiMI2A218CuRwLtYeJt6Uf+2FOJBkeD+bZaQWK+l4caZ42nO5CuiT0RFFrqXolOMAmi3RJJGKLZ
 rGK63f+PD2U/Txxc90/mF9J7R/EWjHJ21NBrJVh3AGvgLLv583qyruHoO1DkB98q5eLBVJn7L4s3B
 20aQdu3g9mdzOg6peFIDY4scEtC9iSFYxgsc78SZXsBRKSrEUwBZ9aWQrw/dXtytw2wNebX9j/fKy
 jWEzSxfpGN/hxUVrz/xRve1W+7WfXiNJnxh8PPhi5KywQhNnf46n1ivJatobjdrT4lknnLjXZhyR8
 Mm4eO/j0pL2YdMApFlOsE5Gk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jlbEc-0005J3-Mo; Wed, 17 Jun 2020 16:48:23 +0000
Date: Wed, 17 Jun 2020 09:48:20 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200617164819.GB7686@samba.org>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba@lists.samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 16, 2020 at 12:04:19PM +1200, Andrew Bartlett via samba-technic=
al wrote:
> With all the recent talk about ldap stacks, I wondered if we could
> discuss deprecating and eventually removing pdb_ldap?
>=20
> The reason is that pdb_ldap is primary user of smbldap.  smbldap is in
> turn yet another of our ldap stacks (I have found four so far), in the
> sense that while it uses OpenLDAP under the hood, it replicates with
> libads, ldb and tldap the 'get AD-thing out of an LDAP reply' part.
>=20
> I've huffed and puffed about so much over the past little while that
> sometimes it isn't clear what I'm really most frustrated by, but it
> comes down to:
>  - number of LDAP ASN.1 parsers
> and in particular
>  - number of incompatible stacks (structures and helpers) above those
> parsers
>=20
> For example, these functions all do the same concept:
>  - smbldap_get_single_attribute
>  - tldap_talloc_single_attribute
>  - ads_pull_string
>  - ldb_msg_find_attr_as_string
>=20
> We likewise have the client-side handling for paged searches in:
>  - ldb (paged_searches module)
>  - libads/ldap.c
>  - lib/smbldap.c
>  - tldap
>=20
> Of the two, I (perhaps strangely) actually care most about the upper
> 'helper' layer, because it is in this that we encode Samba and AD style
> LDAP on top of LDAP.  If you look around the functions I list there you
> see so much borrowed, but never made common between them.
>=20
> -
>=20
> The extensive smbldap layer, largely in duplicate with the others, is
> provided for pdb_ldap (and the pdb_nds for Netware, remember that?),
> net sam (for pdb_ldap installations), idmap_ldap and idmap_rfc2307.
>=20
> While it would hit a significant number of large and legacy sites that
> still have not made the move the AD, but I wondered if we could
> deprecate pdb_ldap? =20
>=20
> pdb_ldap has never been automatically tested, and is primarily in
> support of NT4-like domains (which we should deprecate at the same
> time, for consistency).
>=20
> Merge work is hard, particularly when the users are untested.  Removing
> smbldap would reduce by one the number of LDAP stacks, and allow us to
> focus on finding a common way forward for ldb, tldap and libads without
> needing to accommodate smbldap as well (presuming that the idmap
> modules can be migrated).=20
>=20
> What do folks think, can we move on from these features in 2021?

=46rom what i see, this is still being used. The main usecase i see with
users is having a stand-alone file server with all the backend data
(including the Samba/SMB specific objects and attributes) stored on a
LDAP server. One of the reasons is probably to not depend on Active
Directory.

If we decide to move away from this code, i would vote for a long
deprecation period, so that we can get the message out and users can
prepare accordingly.

Christof

