Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E7D33259
	for <lists+samba-technical@lfdr.de>; Mon,  3 Jun 2019 16:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cd7gK2PCi3jMwChSoVGTMOuWKnFuM5AZeHp+9J8SGFk=; b=Xm1weKJrrWTJeyEB8GwcY+dv7A
	HH/OEBelMIrRYQwH/IZPoef9ZexU+t+gxiWWd091mp7YEqsr9iMGSh2TaTqigN9AOxMOSpDzCUjUa
	SrrVHMcKZyZw2jT4OGHTlJgdSew3j06q1BVFCSXp87KTfoWGyQCECS3vElETi6Nms8ILAW1PdRNbG
	Ej6nVJ9YV9RxgSep7oPeA4zOXKeZWaAf5W9a8Ce6bRhhKn7U2rhPHvdOaDCb4eXE4jLihdaOWaQDy
	OX+BboKWC8rE389e1QC85QkaOgl6dHNaDPzkDe9/HhvHgtwYLFeexXyJGXsjwyAVfyuNQ+pZRNQVP
	lOCPZLaw==;
Received: from localhost ([::1]:21882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hXo9O-004riu-Ii; Mon, 03 Jun 2019 14:41:26 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:44265 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hXo9J-004rin-Tl
 for samba-technical@lists.samba.org; Mon, 03 Jun 2019 14:41:24 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Hd5x5qsnz9s1c;
 Tue,  4 Jun 2019 00:41:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1559572871; bh=tLNfz3lTcjYoLQLTEefC0bw2ZpiAYLLWBb12THvp2Pw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=P+/W7jAvXw20O0+kUnfAVzOh+XJDVyDfEYRFPayX7em2aQXrfjT8XMg1waX0k9yL2
 AeeB20uMD3zx9VPkHfwoXpegWlzmtGbAnlxJA7bM4UWpAxd2EQT0/O4Q9ZotulZs3N
 02MYTl3rMcfQBqmjmV/wkREiILPXx6DDwOIThWtQOZ+ncKAnNCxFNKpojTzVRi8NoT
 tdcx4zjp2nfX15wMsQzcReNNcXC0egD15Tdz/1bKAW71epGJ9csSBv85imEB6ZTic6
 A0vVbLvvyj4pdwkH3Dyny4JLmhYGm8D/bcP/zd0Gj0dP9lIVeX7kD6Mzru230Fn7Uk
 fSPeGvtrc0rMA==
Date: Tue, 4 Jun 2019 00:40:59 +1000
To: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
Subject: Re: [PATCH] ctdb-scripts: Fix tcp_tw_recycle existence check
Message-ID: <20190604004059.6b52af7c@martins.ozlabs.org>
In-Reply-To: <20190603024415.9581-1-rafaeldtinoco@ubuntu.com>
References: <20190603024415.9581-1-rafaeldtinoco@ubuntu.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun,  2 Jun 2019 23:44:15 -0300, Rafael David Tinoco via
samba-technical <samba-technical@lists.samba.org> wrote:

> net.ipv4.tcp_tw_recycle has been removed from Linux 4.12 but, still,
> makes sense to check its existence. Unfortunately, current check does
> not test for the procfs file existence. This commit fixes the issue.
> 
> Signed-off-by: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
> ---
>  ctdb/config/nfs-linux-kernel-callout | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ctdb/config/nfs-linux-kernel-callout b/ctdb/config/nfs-linux-kernel-callout
> index def69a04649..71d8ecf8074 100755
> --- a/ctdb/config/nfs-linux-kernel-callout
> +++ b/ctdb/config/nfs-linux-kernel-callout
> @@ -281,8 +281,8 @@ nfs_startup ()
>      basic_stop "nfs" || true
>      basic_start "nfs"
>      _f="${PROCFS_PATH}/sys/net/ipv4/tcp_tw_recycle"
> -    if [ "$_f" ] ; then
> -	echo 1 >"$_f"
> +    if [ -f "$_f" ] ; then
> +	    echo 1 >"$_f"
>      fi
>  }

I actually prefer this version.  The script already guarantees that
PROCFS_PATH is set, so let's not complicate this fix with an
unnecessary check.

Now that I'm old, I also prefer the explicit if-statement in this
version, instead of the && pipeline in the later version.  The more
verbose if-statement is easier to read.  :-)

Reviewed-by: Martin Schwenke <martin@meltin.net>

Can the 2nd reviewer please add:

BUG: https://bugzilla.samba.org/show_bug.cgi?id=13984

to the commit message before pushing?  We will backport this fix to
stable releases...

Thanks!

peace & happiness,
martin

