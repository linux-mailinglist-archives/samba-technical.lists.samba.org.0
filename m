Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA4E7E7411
	for <lists+samba-technical@lfdr.de>; Thu,  9 Nov 2023 22:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0+c4AXsvYfC1IKA4PcYzVzAWerbbaXUNYiBmV0bg/JE=; b=OrDG1OiV3/piatpm4WX4g47jC7
	MNCYabL+k+wnwAW1YqYmJokL/LIkE5UjdEqkr9CCiz+3SPSXlnfVa2g0DISpT1O/wxqT9J3DjlkTD
	2kcT7VKpFaYVQsMKsjSnWzIEny34BY1JFMdO94h7tWU4o25eywApYSv6nhJdlFoCdcgtG9oV4jL81
	haX1UcQfnveSYuaAtPvf0aZeuCsoBS6FPuejSPU7oIZSAe+kGI6U1OyqsuNU5RPwhlo1HqaOAuy7X
	arW98g/KCAulRQ6TSp02LhtWnUzTFLbd+9zgW8hUWqbL89a0/r7mcewMuLpl5k0AJ/UtnQkQ1uZ8R
	v7s4dBZg==;
Received: from ip6-localhost ([::1]:31554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1D2U-007ONt-AW; Thu, 09 Nov 2023 21:58:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23254) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1D2P-007ONk-Hy
 for samba-technical@lists.samba.org; Thu, 09 Nov 2023 21:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=FiMx059OgE0pby0u15EEH9B0gq0Jza1IfMzyfJiTHck=; b=PEAXn+qU2MGJJCKfDtuXq+tOKO
 e33iFLNpq9EIsI1jpew7jrQkmi1ZxSv+A9bz1C6sCCu8mka5klTgVY+Yyy1h3NaKkq6XgKzWqJ8sj
 01ivBfcgGEcHwRZIosqywZQfBgC+aIvI6fNDQoG4/zhep0ZNBKMc4FheweQWxfAL3Nn9YzufwNmGy
 6S/G3pRU6U8g45nU6/2MXOUShQH63mSDUCcB3+Upuw4feF1Suuk/U6UBYzERR72KWUHYzjFr0QFas
 BYISoPw5gGvxbt2hK/Qn20Jo+6eys2cbkc8Vl82mM8baXx6kpNwazRmK8k014bSTzWPJYobgsuIyc
 loBtOd5B/mrNEVJYfRKAfw8Ko6TpSJVb7FDh+jLJYl8p3g4YdIB6o5gQxtSUB/pmT2dRZMC5sTw/W
 QLSinRmuW5q3fCxAq/oxi7bJ+cE9xDTuFj3UZw4b2M+C/efkGocOOcQnUW0q79Ha8IfQ0qUvr3J5C
 GRbfH+nk2ZG4OhcvhvcwgpPB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r1D2O-005Msz-0D for samba-technical@lists.samba.org;
 Thu, 09 Nov 2023 21:58:08 +0000
Message-ID: <72d8df3ab0c58d2edf7660ad2af79935cb0a48a1.camel@samba.org>
Subject: Can we move Samba to C99 and past
 -Werror=declaration-after-statement ?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 10 Nov 2023 10:58:04 +1300
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Samba chooses to, for it's C style guide, to enforce -
Werror=declaration-after-statement

I understand that some prefer the style.

However C has moved on as a language, and libraries we use (Python 3.12
in this case) don't compile with it, and we are having to do quite some
contortions in 
https://gitlab.com/samba-team/samba/-/merge_requests/3373 to build on
Fedora 39.

See also discussion at https://bugzilla.samba.org/show_bug.cgi?id=15513

Can we agree to just remove this requirement?  

It will allow us to keep variables closer to their use, which is
helpful in a lot of ways, particularly in longer functions. 

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
