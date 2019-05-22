Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF26025E7D
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2019 09:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ogvy8+nZ3mQIfQ9vszNzTMNh1jQmLZ/R8F2hm8D7fqs=; b=smyNWJ7HdpQBZy8hm4tauTv3NA
	bJJLZaAa7CKfL7WAkkt6gEnBqQ+GGJUDICYvsI9Bk0Elvyc1/Z/sOeL+BgJR9aVXYrmLvVUqiEySR
	ewFR3HEKUBQEdDJcHR8kv9zFUC1Nx3BB62OtDIEvmEbN+yswYaYAJ9NXMZ5bNcbucO4/6i/u72qOg
	CpzjwD2KYOG585ZptDGb1zBDNC6gPkHrxtBALgniXqjpwkTryfOr2P70qt+UH2IcWpJD8j3CKanKH
	8lVOOy/67s7COfKAVo7FhE9pVa9PaZGsIsx3mO92UVWAunlvG+3fe0fEiANCGt+YoJ7LWnc+kknra
	7sK+mYKQ==;
Received: from localhost ([::1]:44202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTLJu-001BNk-Bj; Wed, 22 May 2019 07:05:50 +0000
Received: from [2a01:4f8:192:486::147:1] (port=51238 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTLJn-001BNd-Hi
 for samba-technical@lists.samba.org; Wed, 22 May 2019 07:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=ogvy8+nZ3mQIfQ9vszNzTMNh1jQmLZ/R8F2hm8D7fqs=; b=VJVEIxnAuNe+Bj9Y2d8Snd5SFZ
 /tfjaEYcYLjCM+Nipzq/BSnzZORfzfFMArEhKP/1ybpuvA7Fp7ZSzVIuKobcidMWP50NMzjY0WDwo
 d2mJx83ihxtsnXnLhazLa3IGe5qPsBn0pTjneWcE5+X6vc3avEti82egW65QuSw52wIU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTLJd-0003Ml-In; Wed, 22 May 2019 07:05:33 +0000
To: Martin Schwenke <martin@meltin.net>
Subject: Re: New csbuild run
Date: Wed, 22 May 2019 09:05:32 +0200
Message-ID: <5821468.3VxPKbcTHU@magrathea.fritz.box>
In-Reply-To: <20190522163104.5c7b8e98@martins.ozlabs.org>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <df4e9e89-12cc-e8c2-7905-8dd6c401b31c@suse.com>
 <20190522163104.5c7b8e98@martins.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Noel Power <nopower@suse.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, May 22, 2019 8:31:04 AM CEST Martin Schwenke wrote:
> Hi Noel,
> 
> On Tue, 21 May 2019 10:47:18 +0100, Noel Power <nopower@suse.com> wrote:
> > On 21/05/2019 02:36, Martin Schwenke via samba-technical wrote:
> > > Hi Andreas, On Fri, 17 May 2019 16:34:42 +0200, Andreas Schneider via
> > > 
> > > samba-technical <samba-technical@lists.samba.org> wrote:
> > >> I've started a new csbuild run with ctdb included:
> > >> https://gitlab.com/samba-team/devel/samba/-/jobs/214444970 csbuild
> > >> normally checks a commit range for added errors. With a force push it
> > >> will check the last 20 commits. This means it will go back 20
> > >> commits, compile everything, then checkout what you pushed and
> > >> compare the diff of the output. If there are newly added errors, it
> > >> will fail. However it reports a huge amount of problems so that the
> > >> log exceeds the allowed size of 8MB. However we should try to address
> > >> the issues it finds to get to a smaller size. I normally try to fix a
> > >> few of those issues form time to time because it finds a lot of valid
> > >> once. It will lead to a much better and cleaner codebase in the end!
> > >> Please help fixing those bugs.
> > > 
> > > How can I run this locally on my laptop? peace & happiness, martin
> > 
> > The way I used it last was to run it in docker,  that way at least as
> > well you are sure you are on the same page as Andreas with respect to
> > any error messages etc. (and you know you don't need to set up anything
> > extra :-)) you can find the details of the docker image you need in the
> > job output above (there probably is a way to see what images are
> > available from the gitlab/samba project registry but I don't know how)
> > 
> > docker pull
> > registry.gitlab.com/samba-team/devel/samba/samba-ci-fedora29:b4dc3f0b446db
> > dc20779ae2090de0f5c0da9caef
> > 
> > docker images # which should show something like
> > 
> > REPOSITORY TAG IMAGE ID CREATED SIZE
> > registry.gitlab.com/samba-team/devel/samba/samba-ci-fedora29
> > b4dc3f0b446dbdc20779ae2090de0f5c0da9caef 85af60d25c85 4 days ago 1.32GB
> > 
> > 
> > you can then use the image id with to attach to it
> > 
> > docker run -it 85af60d25c85
> > 
> > inside the container you can clone samba git repo and csbuild is
> > available for you
> 
> Nice idea!  Thanks...

All of that as one command:

docker run -ti registry.gitlab.com/samba-team/devel/samba/samba-ci-
fedora29:b4dc3f0b446dbdc20779ae2090de0f5c0da9caef /bin/bash

You can also replace docker with podman :-)


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



