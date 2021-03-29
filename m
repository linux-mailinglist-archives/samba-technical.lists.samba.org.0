Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359B34D8D9
	for <lists+samba-technical@lfdr.de>; Mon, 29 Mar 2021 22:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yKKhBLdEXvfloakMbRzNuqcfP+PPTCuWpKxBIWP8yaE=; b=KO5SXmjYhgbyzM5sXhscbyq/dK
	FL8iH2l4Otd2PY/2LgOUhj0lR337kD/W8no0WYWY9XjucFVCX10xrwgUqFqmXZeFSCwTLi65c9nrP
	VOKWtZeBd19dBR1yfzYa3y2/Tm3OsPuvs011mithCiuGAmiLPMYPS6Fu8fyv6PgX3Loz3N14T8VAu
	dqxIHlzCZWouuK0A6jyuvNz7V+YPV+oArVL4o6kfFtqru3ghoRx8kJ9CnUE30mZ1peiKfEhFmX5I5
	9LGboC4X2XLmRQQPNiwmO8ZvSeno2MGqwPxN5SzyYDfmPHt7XP9ohp9unxXab0mU1sxum3ZzV7TjK
	cx/0gC5w==;
Received: from ip6-localhost ([::1]:27056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lQyAT-007E1p-GH; Mon, 29 Mar 2021 20:07:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lQyAO-007E1i-9H
 for samba-technical@lists.samba.org; Mon, 29 Mar 2021 20:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=yKKhBLdEXvfloakMbRzNuqcfP+PPTCuWpKxBIWP8yaE=; b=Ek8ZqkgQ2p56/wQkxRHZZ1DkX2
 UwbRMqdufcP8VEGsWLet2nJulOTTQwuLzpO9bbFHBWYwr5cM9PvlnhRrt+L1VJiHvU++5ZhobYgtY
 KTExeS8HGznPaK9onzZcGiCju+4IAh/FFYZIEqTcQ4sAfHfDcIoXbhqzHQUz0gUCRjQWHjFb/iVyy
 YeKqHWHwvs4KNjZc1bdiJJvatjcNlqrqbXqxtmOmwaEqzlrdTY7+3Wl5ZnlZIeKUET7fjRvHN9S7G
 ltb4OZgtlo/AbS25CRmtrIqane2wumi9PiFKj5A9gC7lBB8lNuBUUIpFKmVuTXvEahG9dqgDqBGMp
 GmTLmtn5I5KJrP0K1GUjqz82hGoePJd7YmUY/Mknc7jpYPuoEbd/ufy5uwi7R+OLv9kYcMPUS9aKL
 VYgJid8sHK1bNIjUEqeengZciPnWV2VMjEw1WeBoUTWvA+7HoGmRQabzZUhz2gaJOycujeWcHoO0+
 ouDWW1CL59M11+bLX3rISwda;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lQyAM-0007S5-LI; Mon, 29 Mar 2021 20:07:15 +0000
Date: Mon, 29 Mar 2021 13:07:11 -0700
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: vfs_full_audit annoyances on major version upgrades
Message-ID: <20210329200711.GA1317852@jeremy-acer>
References: <CAB5c7xpuL7-_AqJX1szNA9QBjHtOTGmPODoOgr2bvu2EUqVoTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAB5c7xpuL7-_AqJX1szNA9QBjHtOTGmPODoOgr2bvu2EUqVoTg@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Mar 26, 2021 at 08:38:04AM -0400, Andrew Walker via samba-technical wrote:
>I've noticed that several users (including one in the samba lists just now)
>got bitten by vfs_full_audit on major version upgrades. Due to VFS
>modernization, user's full_audit:success / failure configuration strings
>may be invalid post-upgrade. A concrete example is "full_audit:success =
>unlink". What makes this particularly painful is that full_audit will
>default to logging _everything_ if it encounters an unrecognized parameter.
>
>What do you think of doing something like the following:
>https://github.com/truenas/ports/blob/truenas/12.0-stable/net/samba/files/patch-source3__modules__vfs_full_audit.c
>
>Basically:
>1) expand table for vfs_op_names to include an "old" name to use for
>lookups as well (so that "unlink" logs "unlinkat")
>2) fail Tree Connect with a concrete error message printed at DBG_ERR if
>logging parameters are invalid.

I like this patch, although is one "old" name enough ?
Do you think we need an aliases list ?

The VFS is still undergoing churn at the moment as
we move to 100% (or as near as possible) handle-based
calls.

+1 on (2). That's a sensible default.

