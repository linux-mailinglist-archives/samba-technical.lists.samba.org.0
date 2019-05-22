Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51A25E0E
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2019 08:32:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JPNKAAZ2IxrQ3pFb10qSk+RMAF6mfAlqiQ3b+n83V34=; b=Yey/ft3FwRRAtwBD1iS8qCWBfU
	q38vbkQgRiTmuJ4OrycITSxUcIqeOPQVswRAikbjUamBqlx5RDy7dgRXK3XdDRfK6EP5mOflBXhoj
	YT8Yuvi3AjNT8RgsBa0SdHYxtzfvDTHnadjhFR9j6N5xcIuY7IAx4GoEsaFlY7dVN+agjziIvGnyb
	OwzCbvAOTqaPlN2CT2jrStBpYQG7kpGe7c2z359bGS1Q1vNKlN0yrVZiXnqjt8sTnbswbqktjRlw3
	8qvgrWZ85IKfvbPWDS5vMcYwXEPXmGhzu4a7sMwHofHWpHxEgCNXtETBLXpF1NBVCpAEJ0MviTmvX
	9099kSag==;
Received: from localhost ([::1]:43466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTKmo-001BEr-UY; Wed, 22 May 2019 06:31:39 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:44583) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTKmX-001BEk-W6
 for samba-technical@lists.samba.org; Wed, 22 May 2019 06:31:26 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4582p25hSKz9s5c;
 Wed, 22 May 2019 16:31:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1558506667; bh=3usjgO12WMyl7Rf0FUBB8AmpPupVzoGxLvEYd8nq7As=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H/m72BL/dhST7g/l8oZN6GMyCJRDto3A5bRCSjgrieCuK1rj5GCu57AucL9zm5nSh
 SMrl/B1ICB9u4Axn1CMmwOLrKB9WK+HuX50nsz+l3hJZO1gNy7BM9hs3YV/RrelcT9
 yak5O53MnMLpy0EE5zDQEmwd3LxH/0aYDONgZ5pkJYB0rXXPRQGgr/DOsf4i51oZbt
 w6Ai7NnL196DhJSB51eNKQdlmoWN3pdf10I3Ni0Q0QYydmfn/ynQjBAiZJj3l+1jxj
 IGQhWH8TaexJND7x42BrsZLEE3FWQQFqRcCsxCajpvgDeiFIEe0CHn11osYypMyxyL
 Jrblx/T2AxmWA==
Date: Wed, 22 May 2019 16:31:04 +1000
To: Noel Power <nopower@suse.com>
Subject: Re: New csbuild run
Message-ID: <20190522163104.5c7b8e98@martins.ozlabs.org>
In-Reply-To: <df4e9e89-12cc-e8c2-7905-8dd6c401b31c@suse.com>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <20190521113607.55e693da@martins.ozlabs.org>
 <df4e9e89-12cc-e8c2-7905-8dd6c401b31c@suse.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Noel,

On Tue, 21 May 2019 10:47:18 +0100, Noel Power <nopower@suse.com> wrote:

> On 21/05/2019 02:36, Martin Schwenke via samba-technical wrote:
> > Hi Andreas, On Fri, 17 May 2019 16:34:42 +0200, Andreas Schneider via
> > samba-technical <samba-technical@lists.samba.org> wrote: =20
> >> I've started a new csbuild run with ctdb included:
> >> https://gitlab.com/samba-team/devel/samba/-/jobs/214444970 csbuild
> >> normally checks a commit range for added errors. With a force push it
> >> will check the last 20 commits. This means it will go back 20
> >> commits, compile everything, then checkout what you pushed and
> >> compare the diff of the output. If there are newly added errors, it
> >> will fail. However it reports a huge amount of problems so that the
> >> log exceeds the allowed size of 8MB. However we should try to address
> >> the issues it finds to get to a smaller size. I normally try to fix a
> >> few of those issues form time to time because it finds a lot of valid
> >> once. It will lead to a much better and cleaner codebase in the end!
> >> Please help fixing those bugs.  =20
> > How can I run this locally on my laptop? peace & happiness, martin =20
>=20
> The way I used it last was to run it in docker,=C2=A0 that way at least as
> well you are sure you are on the same page as Andreas with respect to
> any error messages etc. (and you know you don't need to set up anything
> extra :-)) you can find the details of the docker image you need in the
> job output above (there probably is a way to see what images are
> available from the gitlab/samba project registry but I don't know how)
>=20
> docker pull
> registry.gitlab.com/samba-team/devel/samba/samba-ci-fedora29:b4dc3f0b446d=
bdc20779ae2090de0f5c0da9caef
>=20
> docker images # which should show something like
>=20
> REPOSITORY TAG IMAGE ID CREATED SIZE
> registry.gitlab.com/samba-team/devel/samba/samba-ci-fedora29
> b4dc3f0b446dbdc20779ae2090de0f5c0da9caef 85af60d25c85 4 days ago 1.32GB
>=20
>=20
> you can then use the image id with to attach to it
>=20
> docker run -it 85af60d25c85
>=20
> inside the container you can clone samba git repo and csbuild is
> available for you

Nice idea!  Thanks...

I've built a csbuild image on top of samba-ci-fedora29 (with the
csbuild package installed) and have a script to run a container with a
git worktree directory from my home directory inside the container.

I'll bundle it up and put it somewhere when it is reasonably
stable.  :-)

It'd sure be nice if the latest samba-ci-fedora29 image had a "latest"
tag...  that'd make life much easier!  Does anyone know if that can be
done?

Thanks...

peace & happiness,
martin

