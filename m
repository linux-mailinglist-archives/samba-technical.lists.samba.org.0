Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A996A6E15FB
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 22:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=J5EHv1h/JxpDiwCE84Tlx5s+/PUWjuI5d6Uuk2uVa40=; b=wtBqP8lg2K47t4rpxh8jkQwONd
	T1fogZ5uKxHvCpD3zu6Hk+9wslj22FVe3r1d1WjPdfFwX0vscXl5PM8JlQ8VcU+TMeHpfJqaWBpS1
	RglA4BFxp0cwRmW9IMqOXsuXI6ogkmITqflQDCFbeKcIk7r9N/CfVvEesWMWjIXVOULArHWzuoFKE
	GiwGifHguBP0/w85d1RTHKJ09/bRIqmvLHHYdFk/Bf2G+98HDHB9gXH+i0gGTNgejDcuE+ywDzn60
	kXcfPECV9zRi1ULQ0i3RMXH1udSbT8AzwIH5dv91WARq7Sm12zc2xeXlaEIZnyj13XoaSDqFqi/Qk
	M1FUh/GQ==;
Received: from ip6-localhost ([::1]:28592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pn3gx-001IVQ-0O; Thu, 13 Apr 2023 20:37:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pn3gs-001IVG-1F
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 20:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=J5EHv1h/JxpDiwCE84Tlx5s+/PUWjuI5d6Uuk2uVa40=; b=JaWw4nexf6MJJJrnX9PNOYbXFQ
 uP9C58Sre2o/M1PHXYgbxr+6ZoMjprUit8BYZijPYo98q4kKlp1pMEjn0zu1lfukZJcF5drnwviCg
 DSzS5dqhR/oKCTJw5E9OItJsQgyzAptVRmar1rVzjfiKvutyjqlKqaFOjTRi0FF6Rc2VRiWrv216k
 lFY4R0FkjpJ1oQDjg/CbQgBN8PsGfDk085dVtD15GKE4tzxphZSrRyDyEPi2Shmwqrlu55On5e8lt
 ydox1bDZQfMUdgOqnXQu16/nGH9EQYt6bWtp0qv11VExUg7AyiF0AwNyDxX6+Cf981cdWOmPZPcAA
 XRYVnMPvY27mjRo0sB5hGSc+2FQefTbpYDqjIsnnayLe2a6DncoGXlKaw/iQhRXsQOO0bSVz4RdqM
 fP2aT3S/G5fHbrGu6oLQdoWH/ha+SxlcZkwSxZ505rVqfMoYIwESxbGngcmkSmZ4Dbw5ADQ29B8a0
 u2gYWk8tD2VjHMjBEzseHkix;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pn3gr-0010jU-1m; Thu, 13 Apr 2023 20:37:09 +0000
Date: Thu, 13 Apr 2023 22:38:52 +0200
To: Luiz Angelo Daros de Luca via samba-technical
 <samba-technical@lists.samba.org>
Subject: Re: DFS mounting wrong path
Message-ID: <20230413223852.4587e83b@echidna.fritz.box>
In-Reply-To: <CAJq09z59X6btqEMnRvdSze_5nOq0XVfg9odE_765Ci-5Of4exQ@mail.gmail.com>
References: <CAJq09z59X6btqEMnRvdSze_5nOq0XVfg9odE_765Ci-5Of4exQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Luiz,

On Thu, 13 Apr 2023 16:41:20 -0300, Luiz Angelo Daros de Luca via samba-technical wrote:

> Hello,
> 
> I have a strange situation with the kernel following DFS directories
> to the wrong location.
> In a share with a couple of DFS entries, sometimes the kernel follows
> the wrong path. Something like this:
> 
> server: /share/dir/subdir1 -> msdfs:server\share1$
> server: /share/dir/subdir2 -> msdfs:server\share2$
> ...
> server: /share/dir/subdir11 -> msdfs:server\share11$
> server: /share/dir/subdir12 -> msdfs:server\share12$
> 
> And in the client, we have:
> 
> client: //server/dir/subdir1 on /mnt/share/dir/subdir1
> client: //server/dir/subdir2 on /mnt/share/dir/subdir2
> ...
> client: //server/dir/subdir11 on /mnt/share/dir/subdir11
> client: //server/dir/subdir12 on /mnt/share/dir/subdir11 <<< (should
> be subdir12!)
> 
> It always happens with older kernels (5.14 from opensuse/sles 15.4),
> where the first DFS is always used everywhere. However it still
> randomly happens with newer kernels like 6.2.9-1-default from opensuse
> tumbleweed. I can always reproduce it if I do a "ls subdir*" but it
> does not happen if I first "ls subdir12" and then "ls subdir*". It
> looks like a race condition, but it might be an off-by-one case as I
> only observed that with the last DFS in the directory (12th in my real
> case).
> 
> Has anyone seen this behavior?

Yes, I've seen something like this, but didn't get a chance to look
closer. Please raise a ticket on openSUSE / samba / kernel bugzilla
tracker of your choice and add the reproducer details :)

Cheers, David

