Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA7D1FAB67
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 10:38:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=k3fODStdHZI5E8n0JgBjjn4Um0y7zhh7tGfHjhoJmoI=; b=IA1RgicJ0x5pENRYIToPWeubnv
	8+4zXKxZ7tiagn2+dQ4fy8Po7a+H18jb13fUcn9ZpvznrFl8P43JsG+L02775kVcSh4MqHlzLg2jg
	ZB9MTNARH2kr0wEeF0TagFONa+aLQCbMtZW0izd0WggxobXEM7IjA+96ahxR5Dhv92JKjdI/25HiB
	u+37s/XwL9J5FRLU8/MUZJIIOsuyFNoSYDM27IJ12N1PkeGJLCip+/XL8M6YidjGzr7Y8ZDw3RqTs
	d25cO/Kj+giKAKpUG5au32B6OQ532id9P47+KarzILDNqoPCh6JTToj81mnfjnlIdR/Kh5m/n7CmS
	+DNo4uCA==;
Received: from localhost ([::1]:62546 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jl776-000b6T-Cc; Tue, 16 Jun 2020 08:38:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl76z-000b6M-LD
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 08:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=k3fODStdHZI5E8n0JgBjjn4Um0y7zhh7tGfHjhoJmoI=; b=xU/t7/Evg3ad1xGYLt221DbM7Z
 636Rfc1Z5xHnVnKgedGzkh5EiZ4r5Eic+Ne2L5xapyaAYK7IDuVMDIWu8Lh1f67/a5HNRxTqJTtE8
 cV83XWic63lN7MRHg/xnGcTxhGmw3oz/wwRjKQWg31GiEhRiLpz1lz4vj3H0GZm+HTZPubp/b9t2X
 y9vD5JmbrmiKowHVDwg8OjKcEwVLY3rrzFS2Ol9vsrGlSwP57DjXKJfErg+N5wUbvOJUlEXPjWDv6
 jc1qNjvJ1KMJjLdIPrR2uFoskRwqIN/yxhX87QfgsM789T5wEDY4Efntz1IxB5Kh4Lu+Qj/v6IbpH
 ZzSerAGQTmU8wnhbS3z1UCJNOiBIXAzJxTOK6YJQmTInQM6nwweJ3vHrpYByXQziWYeOe4MRkp8sN
 OA5UGQF/krBjxAKuv9L4/yiRbZgLGP8ugbgVA0VR9wE5ahrAgYHYzwKWKx3l5CguQoH27BbBXMcDn
 iRCJZDnnYI2Nsqa34YX9k7zp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jl76y-0003RE-6r; Tue, 16 Jun 2020 08:38:28 +0000
Message-ID: <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to
 allow removal for Samba 4.14 in March 2021?
To: Alexander Bokovoy <ab@samba.org>
Date: Tue, 16 Jun 2020 20:38:23 +1200
In-Reply-To: <20200616082636.GD3036357@onega.vda.li>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-06-16 at 11:26 +0300, Alexander Bokovoy wrote:
> What is required from FreeIPA side is a set of operations to provide
> implementation of PASSDB interfaces that deal with searches:
>  - search users
>  - search groups
>  - search aliases

Can you do that on the FreeIPA side?  pdb_ipa isn't in the Samba tree,
could you handle the maintenance of the code it depends on?

Presumably you have plenty of other ldap client stuff on the FreeIPA
side of the fence you could plug into?

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




