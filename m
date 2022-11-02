Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BDE616E91
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 21:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=P5kQREYV+0+Ib+Bj2lAmd0nlSHiyma28+bAkuAUlTfY=; b=0mG/TK1SiUh1z81DeSzWi+dKE9
	H91VWN4s/oVwrQwJ3SHsMt5WRxUjN9XnvmsG9K8L+JDB6JaU3E67scX1PuMOIYCj29zsJk/CXQNSS
	qi8vwwgAeuZHTPLXjVPSpVRokkJ+dIUYt1dRB2DY+zY7051lloKgddtndcn2TvSjAQ8kXvCkcHhTX
	GgVaQBXNgGPf7QecI+ENu++d8IFqIHsVeYpWb0BKcIDyIagxQYWQh/5RyyoTdM9x8h480k5bx+r/w
	i3+lsUvqF1iS8AxwNUzlXTAU10d7o/zUL6a1IpSjdLh+/jypmBPNQhI7m6vHaXoXi+MM0i34NtdIS
	tPYCcPZA==;
Received: from ip6-localhost ([::1]:45550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqKHw-00AAmI-4D; Wed, 02 Nov 2022 20:24:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60628) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqKHr-00AAm9-PE
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 20:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=P5kQREYV+0+Ib+Bj2lAmd0nlSHiyma28+bAkuAUlTfY=; b=qCtmfPnJ8hC3DZ3EqsHZqA07eD
 hFR4wnTRC+7L6RsB45shfnfRNlKQiixCBblyiU8GqkiH1phEk9e/PnyWFxWOY513wfg2Do8GmKVvm
 svhAahehp7giv3PElc4mfiCUUXTx7oGXV1dw4iz8Crmpm7e457ZnWgK2lvolYMFuKZefmSfJeAiz2
 J1Zs8mDHizhQslwsQAUxxHo11ULV+J6TO4hbROPieLungXR5uQbzUCJdsrylsli6FSqg6HlyBWBme
 gEUPaQ1WMNZ2GGqG0UoUu16UJKMmiyCRxk/fPXloq2YGSFVW3QwVK+IGa8OICvrxVntJMj33zdwPH
 Emw565nzBxuyzlOjXxWOTudnWeYpSbjUn+k89g5NLZB2KgDfZbxVY7qki7e6axytPDrswcXcim6ZJ
 DOJCYWqsbnAen5EpLG1oOImaF6mvKbHTICNf/9MAzx4NJ0ynOghsKy0qjeORM4AQ0L0G6xH6XbCJh
 PvpPZSpiz5hz5MJLNNjcxrd2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqKHq-006v9E-Cl; Wed, 02 Nov 2022 20:24:34 +0000
Date: Wed, 2 Nov 2022 13:24:31 -0700
To: samba-technical@lists.samba.org, metze@samba.org, abartlet@samba.org
Subject: Re: How to push to a non Samba Team member branch on gitlab ?
Message-ID: <Y2LR/7ytNMuNPxDV@jeremy-acer>
References: <Y2LRam/bPaaRWRjy@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y2LRam/bPaaRWRjy@jeremy-acer>
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 02, 2022 at 01:22:02PM -0700, Jeremy Allison wrote:
>I'm working with a new contributor here:
>
>https://gitlab.com/samba-team/samba/-/merge_requests/2741
>
>and want to push a modified version of their patch
>that corrects some things to help them work with
>us here on the Team. Pushing to their branch
>helps them see what I corrected so is a very
>desirable thing to do.
>
>The gitlab page above shows their branch name as:
>
>vporpo/samba:master
...
>git push gitlab +HEAD:vporpo/samba:master
>
>fails, as does:
>
>git push gitlab +HEAD:vporpo:master

git push gitlab +HEAD:vporpo/master

pushes, but not to MR 2741, so isn't
desirable :-(.

>I can't see any logic or patterns in this, or am I just
>missing something about git (again).
>
>Jeremy.

