Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0033297
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2019 16:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PJUuummdkXrD8qjVxstB755bkUeix4lMuV3LLJWbiUo=; b=HtrJ4gKKAqJrWJ9NRhGIvGJ6Wl
	7AcdkiK5B4nlUpx/H4ZA9Q71gYyCWYbYsRjrEJsXn14EokCAxCIfKc+eFpxNLyMV90V750agoVUNE
	jOWtG4MnIy2skXYyFZ8JsCNnSmNBu41wcCM9xZH8lJWZD/K77cTG4bTZEU0a8LMfrCvf5pj0hu6r7
	m5VGzND8R3NsmhZfUria+D7uirwjFUmvGfZ/JO/pRmmDSlFUXLKoFG9PQdzl967Xywop0Pfu5NxmC
	kQWePo7Dgl6O4CiEhdScsSn1HupBol9bHtrgmwQXkW+Hp6y9wEpusLjJaQoaLEn1sEmEmaUpHXb2b
	NUiqfG3w==;
Received: from localhost ([::1]:24872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXoF9-004s7b-Az; Mon, 03 Jun 2019 14:47:23 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35825) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXoF4-004s6m-1s
 for samba-technical@lists.samba.org; Mon, 03 Jun 2019 14:47:20 +0000
Received: by mail-oi1-x242.google.com with SMTP id y6so9400666oix.2
 for <samba-technical@lists.samba.org>; Mon, 03 Jun 2019 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJUuummdkXrD8qjVxstB755bkUeix4lMuV3LLJWbiUo=;
 b=AU9SbtivYpoGyY2TuGFOJfQIHSS1qZK87xoFtxp5hoKYFwBEzYrIJwoeYtrAcRQC9g
 8Jc76UedqpQkD4vEwm+iTJpknJabeyh9fBCFSJgryvdGBUO6wIEli4XV3vGiTkdW5Lye
 82dhQ/2TAQlrWZQqsQKYQBFRLeGoS+lCxsQlmHZhM3bMRdbWsS201b5UjVqvT58Gvr2q
 wy7DLiLqM1TTesDgQ52g79O+4oO1l/ZFkXECcJKq9SRr1/FPuWNcg/0OyudpbDUHe6Kn
 aivBQQMphMlZJM6DhFmzWGEyKVzAA5n4s8ukDP4eg91OIzD0IRMtDHWNlm94yKS/ZfWA
 V1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJUuummdkXrD8qjVxstB755bkUeix4lMuV3LLJWbiUo=;
 b=bpin982uIv6S/bO4BK1jdueFCyk9AvZnQZ216b0CaImokW5nb78kugE/uGKPXOJscC
 YjcuoVCDmI6vHeQkgfpQcXZy+ERceGCqrzSambBMtcJd5rB6LcTB69wqtLclAYIFPQBu
 CiHBwdsOz56ay/vOkZytOZYA9uBIO+ub0Y9HbZK1nCgF47TsCLcxTYxBUKyQyEC3SS2F
 7809pRcwu5sZzFPTrh3smUcIJL41dmMswGOKgMd3EWW6HeItr2vNLEXPZLGY136SsLpC
 EscidPnoY0HwyiPmnZjS2Er21LNQOQCZXlI8N2b307DOGFhpXj79ChGSXQy1j52t/BN7
 cUNA==
X-Gm-Message-State: APjAAAUVwy+DN5a8rP/wY4c7ECeAxA5OziQwxjRpTMzVt2Y3WfwpBben
 2uqWxjFxCsHWGt6KDN2a5gJUiDg2rZrtIR2rjfDCbKG7
X-Google-Smtp-Source: APXvYqy5gi9KxRZ1ixj4db24Cmy4FX2jrzkclZ9Zb8QTh0zgAxNazRviOWVxl42VJ3wgOmh0psHkPjJfCPjLQS/FpvI=
X-Received: by 2002:aca:f002:: with SMTP id o2mr1150779oih.31.1559573235053;
 Mon, 03 Jun 2019 07:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190603024415.9581-1-rafaeldtinoco@ubuntu.com>
 <20190604004059.6b52af7c@martins.ozlabs.org>
In-Reply-To: <20190604004059.6b52af7c@martins.ozlabs.org>
Date: Tue, 4 Jun 2019 00:47:03 +1000
Message-ID: <CAJ+X7mTNwN+E4=g0B8Djjh1B=Rkiy7kjNJYMM7y-LYQ3zuy1CA@mail.gmail.com>
Subject: Re: [PATCH] ctdb-scripts: Fix tcp_tw_recycle existence check
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 4, 2019 at 12:42 AM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Sun,  2 Jun 2019 23:44:15 -0300, Rafael David Tinoco via
> samba-technical <samba-technical@lists.samba.org> wrote:
>
> > net.ipv4.tcp_tw_recycle has been removed from Linux 4.12 but, still,
> > makes sense to check its existence. Unfortunately, current check does
> > not test for the procfs file existence. This commit fixes the issue.
> >
> > Signed-off-by: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
> > ---
> >  ctdb/config/nfs-linux-kernel-callout | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/ctdb/config/nfs-linux-kernel-callout b/ctdb/config/nfs-linux-kernel-callout
> > index def69a04649..71d8ecf8074 100755
> > --- a/ctdb/config/nfs-linux-kernel-callout
> > +++ b/ctdb/config/nfs-linux-kernel-callout
> > @@ -281,8 +281,8 @@ nfs_startup ()
> >      basic_stop "nfs" || true
> >      basic_start "nfs"
> >      _f="${PROCFS_PATH}/sys/net/ipv4/tcp_tw_recycle"
> > -    if [ "$_f" ] ; then
> > -     echo 1 >"$_f"
> > +    if [ -f "$_f" ] ; then
> > +         echo 1 >"$_f"
> >      fi
> >  }
>
> I actually prefer this version.  The script already guarantees that
> PROCFS_PATH is set, so let's not complicate this fix with an
> unnecessary check.
>
> Now that I'm old, I also prefer the explicit if-statement in this
> version, instead of the && pipeline in the later version.  The more
> verbose if-statement is easier to read.  :-)
>
> Reviewed-by: Martin Schwenke <martin@meltin.net>
>
> Can the 2nd reviewer please add:
>
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=13984
>
> to the commit message before pushing?  We will backport this fix to
> stable releases...

Reviewed-by: Amitay Isaacs <amitay@gmail.com>

Martin, you can push the right patch with the required bug tag.

Thanks.
Amitay.

