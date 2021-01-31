Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC74B309F41
	for <lists+samba-technical@lfdr.de>; Sun, 31 Jan 2021 23:35:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=XYVfIgpqyhSzOpytQfVQxaGsR3Q4IdOtnCjlniizedQ=; b=WgkotWhiH7ensUu1VGvoiMuQPR
	d6TrJyA4UwnuWLCGv5DIu3avDyWCb0oX+X0E7JKJloNv5fGV6s3iFGyfRjIFewdQKx3TxohNhnwWW
	Do9Mr23cKrrvFDM7Jvp2FyOyUvaJNqfFk1emJoY2uioXZO/Ff8r9JkD08VrZj+bNnDbsOe62NqiPo
	Xtw2GFej6u4m8pOJ9oqwOoVuR7TM46QOl7dgGc+CIo6rYYnEJqvDw3yCTzUqIdpAfdODmtfhPs4Cq
	Thnd5WUM6dx+t6NpRt0ckADwOnHzTbsY4ZKWcR5/eS4jugVj+E+zT+7geSEEK7nxmeedNp/9iUmrz
	Tvb5ln6g==;
Received: from ip6-localhost ([::1]:60536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l6LJA-008Ac8-Kd; Sun, 31 Jan 2021 22:35:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53700) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l6LJ4-008Aby-Sh
 for samba-technical@lists.samba.org; Sun, 31 Jan 2021 22:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=XYVfIgpqyhSzOpytQfVQxaGsR3Q4IdOtnCjlniizedQ=; b=A/I3U6w6RSRrn1i2iwLxGOU8+5
 88YAGwXNHyVq9c3oxDUfACZEhmsWeVCjoJOhWLJfwaCI08bhOsrtAjH5pQEjyEgPxC/lu2UUuPYnC
 ZOkNrgr6kHpFz9ZjXzNXqk6JLPSCg/lWEiM+lZyg2yZWZ2LyGegqBPVt5Zbh19arxnt7D3KxAhXJK
 Do98NO+1cAY6DQx1MTXvphrrM0UmbK1ddjCNjRWc5CbaibYCex4xZEuT0Lmk4AGQ5ScFEsmd6KlVt
 10Y1LNgBJgFhqBQej4H33xMZAtTp9/vO6M3wknZlZRkE45th+/H6c/y8xmchipYuk2lldcm4VTesy
 zv49V7EWtgjEhZE6WEnuGJRvjemskQHYtEhqxFX2dnr3ATHCy+o9jiakI/uh08cUNLUfPCumWjkYp
 JkWR1/8E79e9M4OiPGR2mH4MihiQSQ/TJKCp8AZ4IpZMrZ1C/d1QhQRQYWH7gjnigpsUc7BoHf34E
 x0i25u6CtPYxRQAnfvriWXTy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l6LJ3-00008r-7C; Sun, 31 Jan 2021 22:34:58 +0000
Message-ID: <05788626002ed4445acfaf8caa355bc76e9041e5.camel@samba.org>
Subject: Re: [PATCH] [virusfilter-vfs] update for talloc changes
To: "Trever L. Adams" <trever@middleearth.sapphiresunday.org>, 
 samba-technical <samba-technical@lists.samba.org>
Date: Mon, 01 Feb 2021 11:34:50 +1300
In-Reply-To: <18d7764e-06c0-9d1a-999d-98396681a69c@middleearth.sapphiresunday.org>
References: <18d7764e-06c0-9d1a-999d-98396681a69c@middleearth.sapphiresunday.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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

Any chance you can file a GitLab merge request?  Patches here often get
lost.

https://wiki.samba.org/index.php/Contribute#Submitting_Patches_via_GitLab

https://wiki.samba.org/index.php/Contribute#Mailing_patches_to_samba-technical

Some details you need to follow like adding your Signed-off-by are here:

https://wiki.samba.org/index.php/Contribute#First_Merge_Request

Sorry,

Andrew Bartlett

On Sat, 2021-01-30 at 14:24 -0700, Trever L. Adams via samba-technical
wrote:
> I believe I saw a warning about this posted a bit back. Recent talloc
> changes break this module. Attached is a patch that resolves the
> issue
> for me.
> 
> Thank you.
> 
> Trever
> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba



