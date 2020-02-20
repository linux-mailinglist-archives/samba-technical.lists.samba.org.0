Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD4C1654FD
	for <lists+samba-technical@lfdr.de>; Thu, 20 Feb 2020 03:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NKT8YKHzAjQ85ph/7xTi1DUtOlGXYPNOpx9J6c/d3lE=; b=sgqjOBuAyAFUJzbQMDf3FbPtes
	5kmFtmebJfCNwlH47PG6BVYujXeb6PXbpxFKjLBRJbw0C+lV3E0lshqa11JvNiHBToXgL58M54ZoA
	fR/yzI8Ne22UUySY+nVXQM2SZT14rrllqASM2SME3527Niz3pLvhHd8dbCwVepiKy5QVrfhiNrBu6
	E1pFQdWh6Ed1Ejtqg403b00VyqRncA5AlbAW6VaUfUgU4KiD42Bonb8WEcqsuFrFk+Tu4iFD8Uq2x
	CTFopDwv9AdA7xn7owmWAnfUzIgLOitPYGkDZVZM6dmk+51ljawZxGxlg3Pzwk5VBHKm4euENQtJ5
	mmuZZYXg==;
Received: from localhost ([::1]:42642 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j4bTR-00AiBA-Bj; Thu, 20 Feb 2020 02:21:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58322) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j4bTJ-00AiB3-Bf
 for samba-technical@lists.samba.org; Thu, 20 Feb 2020 02:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=NKT8YKHzAjQ85ph/7xTi1DUtOlGXYPNOpx9J6c/d3lE=; b=jr67foP0UknCfe8Ts9i9M/hMy1
 Tehiw1xgJor7BUMBHYmQUnryLXeouahYwbUq2RDT3bbzD9o5tWUS6d6l1M6MXsZhLeLf4rXGi4RJk
 eEv4HZzYj/8VDCxbEC7I9IDvRn8kV7vk+Q0pHQBt/8S9mROBWsy0f9A5oKlW+7P2biw6xtNrvzW9Z
 exduMzcjmDQ+ILLT45l5AQAzpDoUvVM7NufNSSyoahX3v19ZsxYpBV9uBIeAfWeQ5W3fgB2ZbUAvy
 YgUP9J/5k6BySR0u6ynho5H6qERiZLYt2iF3uyOouVPMwj+echnfPYY8SyZvhbphSy4Ka6mWmquvR
 2+zdmKgCMGV/b2eQr+GE5dcaGHiEOJ2YjKnxpI5X3H3Xx7Lp1B+MNDESPMuZFiKSutA5N13683cLm
 01ufy6fzxwUB3Q91yN7f3DBUPSOOt05MWAV0aw7ApfcM00PR5Wl47XykA8F67gOu47BTGDQapXTiN
 8+/VIKEHgKNldQNDeH0bMtfG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j4bTI-0006av-2r
 for samba-technical@lists.samba.org; Thu, 20 Feb 2020 02:21:48 +0000
Message-ID: <bc4cc8f0b211ea0746ff66724edb3c1890c16836.camel@samba.org>
Subject: Re: GitLab CI back
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 20 Feb 2020 15:21:44 +1300
In-Reply-To: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-02-14 at 18:01 +1300, Andrew Bartlett via samba-technical
wrote:
> G'Day,
> 
> A big thank you to everyone for their patience, the GitLab CI private
> runners are back now.
> 
> There are still things I would like to do:
>  - ensure the alternate configuration for really old Samba versions
> still works (I think that image ID also changed)
>  - decouple the system from the catalyst_samba key and use an
> ephemeral
> key instead
>  - provide a top-to-bottom script that pulls a docker image, installs
> the required software and runs ansible that only needs the
> credentials
> as input

I've done these last two steps.  I don't have time to sort out the old
image id for Ubuntu 14.04, but I'll carve out some time for that in the
near future.

This means anyone with Rackspace access and who knows the ansible vault
password can rebuild the runners with just one command.

Ideas on where to put the 'ansible vault' password most welcome.  The
valut contains the runner tokens, which in turn protects the GitLab
server from a rouge client offering to be a runner (runners are passed
sensitive credentials). 

I would very much appreciate another Samba Team member putting their
hand up for access and giving this a go, so we know others can rebuild
this also.

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







