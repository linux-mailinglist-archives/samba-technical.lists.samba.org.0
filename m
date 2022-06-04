Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB83E53D4D3
	for <lists+samba-technical@lfdr.de>; Sat,  4 Jun 2022 04:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iK4Cfu2M1s/k9VfxBRfFil1oQMpfK8T62DHaAgeJECk=; b=M+od5Wj1CqCb73flWUzThT4/rf
	qPbuEY+m1zfKu9DN5xwP5ApUm6w3AZ+IXqryclgkGp4zL9OZegUy2Q70ttBM/rK+cJkA23UaIXM0O
	k3F9MdOszIAwJ30HiBys5O/qh7ea+vVuy47rPZ/K5sDBumzdueuCXjd7jVI+rj+MYZpTW+CT7K5Sr
	hDtY2d7B3BNCvsu3E4mDnMQuLi+JUHhqBI+jKqzPxfpxb4UAbw2GFKMuX1BJnCB0iScZ/J3yGLChJ
	59fj+Qcy1QK3A3lEJWX3MrvAVkEwwh7IHoIKS2p0xZrkMzqRNsHDbtUmBJiZM7wVwpZeVnpBxGhK/
	Js1mGEWw==;
Received: from ip6-localhost ([::1]:39770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nxJJV-007A7r-QF; Sat, 04 Jun 2022 02:14:53 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:33652) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nxJJQ-007A7i-Pa
 for samba-technical@lists.samba.org; Sat, 04 Jun 2022 02:14:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id i10so15448245lfj.0
 for <samba-technical@lists.samba.org>; Fri, 03 Jun 2022 19:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qjOBWLRLg5hvXF1tOv0312YFq/wEhA5CPfBpgt/Znus=;
 b=WHkpw/zkkNARqMf11K6snR1NDkPCgy8+XD/Qu6QO03oBq8GLcemQOolyYxG1sA6L+Q
 YeOHsijXjyAb1Ifby/8816XwnPee2W++V44JrB0ItZMG+VixRpdlbBOG1aEInVV6n1pt
 MD8yvyPtAcHFtx7g2ONQK6NiYoIVYjPwUunaE5uYTKH6XL/nIcx/ebfCBUbyUndEGJ0h
 ve6S/jPwtTLNJLj72/zoRfDcS8vTn4b8RKsEqtWOaIz3H3tOgwbiNTFjWaY63Tf5TIAC
 thvtc0MPC8aoq9uQFLgWl1Xifj7YeV/Hxvy4PgN6JKzyf3YZDefGxXIg5cgJRCZoKbtT
 sj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qjOBWLRLg5hvXF1tOv0312YFq/wEhA5CPfBpgt/Znus=;
 b=HobUjjpkXZa1diw8FkBaULVsAuPaBAgrqvS/YDJ/2UXQ9vuE/t2MUhhyeUGMPXDloC
 CvQoHLIFosbCKpJF0C/6d975IvapgNnjLujWwA8+qJpePnca2qO4pvZlRwM3Bf16p5GI
 PR7IHE5JR7Y89D+Fgp6L31fGEW8TchASvLzXfYkULbSPqQYtl1dU3XmvU1GJHaMTSCbF
 iP4fTnowgU8h1yYwd5Uay6WoqwUpgkw7kAi6Jcsm2v3+vJmO+uoz6tExfJhDemWL/hdE
 xqQ8BCPEeegfnGZgaGmYDOvYBL9ZMciA6UiF2q0RmniH4YDlXrtjdoLwo77X20RJi7dI
 o9Vg==
X-Gm-Message-State: AOAM532nxwywUxzX99S4fTVQIgwCMlZmVSVfvJX7OMs7EpCPI+dl80cF
 mudEJnpswj0VACVtgJPjB65fr/bI6TYGjUFCz/5STQ==
X-Google-Smtp-Source: ABdhPJwWgtrhR+5M4B4MV2q++FFTehVaTmFXq1LcKuhb0XJIsINeMKO8mMnYRae2vNm9XqazhZUSyqcNA+nbR/yMMwQ=
X-Received: by 2002:ac2:5463:0:b0:479:15cc:5cfe with SMTP id
 e3-20020ac25463000000b0047915cc5cfemr5334598lfn.656.1654308882741; Fri, 03
 Jun 2022 19:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <5979975.vuYhMxLoTh@edfu>
In-Reply-To: <5979975.vuYhMxLoTh@edfu>
Date: Fri, 3 Jun 2022 22:14:31 -0400
Message-ID: <CAB5c7xqLEgastp-QE0AR0DYf6k+D0yda1rDOX6GW0D00gnpS+A@mail.gmail.com>
Subject: Re: AD DC option to use acl_tdb rather than acl_xattr?
To: John Mulligan <phlogistonjohn@asynchrono.us>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

For what it's worth if ZFS is an option for your container host, once the
VFS plumbing is in, you can use our ZFS patches to ZoL to add support for
native ZFS (NFSv4-style ACLs). I've tested this before in containers before
and ZFS ACLs work as expected. The primary gotcha is that there is unmerged
work in upstream ZFS to add overlayfs support.

My PR to add it to OpenZFS is here:
https://github.com/openzfs/zfs/pull/13186

You can use the samba VFS module and parameters listed in the PR or you can
grab my samba work from here:
https://github.com/truenas/samba/pull/111/files

If you have grab the lib/zfsacl and lib/sunacl code and related wscript
changes from that PR you can make vfs_zfsacl work on Linux. lib/zfsacl also
provides python bindings for interacting with the native ZFS ACLs.

A CLI management tool is here:
https://github.com/truenas/nfs4xdr-acl-tools/

These things combined provide "rich" ACLs that will work in containers
without having to rely on exposing the security namespace, storing in user
xattrs, or writing to tdb files. If anyone is interested in taking this for
a spin, feel free to email me about it and I can give more detailed
instructions.

Some things are still WIP. Today I finished writing samba support for ZFS
DOS attributes, but this is somewhat irrelevant to case of just providing
ACL support.

- other Andrew
