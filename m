Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719E3DF72E
	for <lists+samba-technical@lfdr.de>; Wed,  4 Aug 2021 00:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ZuTgPSg5HbeTr2YS0OgfqmBYSdDOWu3ZbFii5cN6TBI=; b=ebkckp/1SfA5AO2EekDXU/W81f
	V42IGf65FqDhOAxLlDkJFkjHc3odEkjk5UE2NRUPugtphBjqEGFdigCFuJnnJYEoZN5+HmulQvOLQ
	U0d3/MGQg7Y/F5717gixi1025vt5p39j3Xq32dn90Mx4SwAq0nlZqo/tRs6pmIP0oOQHixx4Hy+fT
	0igLG5xFWAN58BmHfhBq1Ms5noLF0aaJ9qiShsgFOBxCiL03vy7AIgJ1ogLBMXs0r405PCbazvKhW
	MICpk7WWy04MemP50kXLMrkVyNoenK9fjzfxrjGYVbKYgbC37O3zAjqKTkrDF82BACZ6JMbK51Fc5
	3aZIOpCA==;
Received: from ip6-localhost ([::1]:40570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mB2UK-004RLf-25; Tue, 03 Aug 2021 22:02:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37374) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mB2UE-004RLW-LI
 for samba-technical@lists.samba.org; Tue, 03 Aug 2021 22:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ZuTgPSg5HbeTr2YS0OgfqmBYSdDOWu3ZbFii5cN6TBI=; b=UNl2jjoc8owcLFS4qUFhUexKWx
 GizavLQZgQLkohpB6F8A459bTe9Qrp1+6JtvC8DwUahNjVJKCWCjzKTfHvYI+dH9VxEMerzQ+tNQ+
 XTfiht+lcPVxVfsk697VDqvkjjpCYwP3HzDzkQSjsV6vQFBqHElcimKluGB9uDKGCQuW4Sg/OxPz5
 ID3E/vY49VWbTV1RkY2K227U8W9An7jzU6vLQ8byh1JdqLW9Tr8+Nuuv3N+rLGUwjRTO/5JfjKZRH
 GEeUxGm8I2iPu4f6HnkSriqb+FXb7Wupbyv7FTBhCqJ+rUKZK1Ur2WhkuEqtLrku9jZR36ginU4Op
 f7jrlmKPWFo4NJeIbYhWlsYQ0PFVzh+9Y9yradOoq3TP1sTqVvJJoNPycnupuxOQJq+7uSG1IdIOj
 JvyVPFyYU7fw4IlLkAX+1Bza8xWbsZisO9T3QQ3mThFdN/RQ7azsGYYkK5PpZvuDNxYjLYWsg+X17
 hRNoHOcg4fL3Mp5YCETz/vFe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mB2UC-000Ttx-Hc; Tue, 03 Aug 2021 22:02:09 +0000
Message-ID: <6d86c8294a16ac6091d54d691ce433d4a3dd816a.camel@samba.org>
Subject: Re: Autobuild paths too long again
To: Andreas Schneider <asn@samba.org>, Isaac Boukris <iboukris@samba.org>
Date: Wed, 04 Aug 2021 10:02:03 +1200
In-Reply-To: <098761f1fe21bdb0790e49b97f20b77c86ea1aa6.camel@samba.org>
References: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
 <4329737.EkWKPh09Hk@magrathea>
 <098761f1fe21bdb0790e49b97f20b77c86ea1aa6.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-08-03 at 22:03 +1200, Andrew Bartlett via samba-technical
wrote:
> On Tue, 2021-08-03 at 11:09 +0200, Andreas Schneider via samba-
> technical wrote:
> > 
> > However I would suggest we check this early enough and fail earlier
> > to be 
> > sure:
> > 
> > https://gitlab.com/samba-team/samba/-/merge_requests/2101
> > 
> > 
> > 	Andreas
> 
> Thanks, at least some clear diagnostics would be nice.

That MR landed so I guess that means it worked :-)

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


