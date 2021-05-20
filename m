Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AADD6389F18
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 09:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=72F+nnJSl24QeR+peuG/hQWKu5rOen6Z7mOPk31+hcM=; b=LBv2q/BA94QfvymlHTq1ntyNlz
	86gI1wovs7IRSNukCMgPuElvAQW8KShnfAoW8xQHpxfHYV6jb8W0nyjxuHawgFRg/9NY+C6VH4nYX
	njPNBWSHZgCk7Mv2za9jG539mI2zSCevhgAjEFNTYbBDM4awfJq2VSVb2N4WQbsfzj3xu4Kq9Aw9h
	ae8EUbqoWV5JqJ8XQZO/UmesmX/BJQsxidDREZ4rdBiNCv5S1VDE24zXfaxuwczrHBWoAdNw3swUt
	RZEiecuTZgDwsEQfPj/kDM+YefaFskrMCx3PsiBrNZOeD+80xfcNRYyoDx3QUkGbuUCXYdnkCho0K
	ZWagw1RQ==;
Received: from ip6-localhost ([::1]:50046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljdO9-001y2w-PW; Thu, 20 May 2021 07:46:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljdO4-001y2n-Ii
 for samba-technical@lists.samba.org; Thu, 20 May 2021 07:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=72F+nnJSl24QeR+peuG/hQWKu5rOen6Z7mOPk31+hcM=; b=dBk18+qhdmNwWdY7TkiNqKDZWR
 gCueevevMHd8wps/zy4UICviVrsfhUFz7degBjzT+IyZt5H1/lkPoIdfVfluOFKRkkdOulsP0Etkp
 Q2iadGhelh976Uc7BqXX3dFqmXLIiwokT0l/1NHzCyTA2CkfpZsaYsmJ83WKxihzaLAQuvFYm+M4y
 KJpGuFbHFW8+RIdN+LIBpe/wASYWI6d4FPD0/2xYfbxM2wb79jGU7i8l/gVGsygTLzpG+9MeSsZrS
 wKero9sXkJBSfdNp7ZVwrRlVxaN9TvhomMM4lq3aaZ5LQauMox1k1ze621l84IIuCjSyIqEtpd5CP
 JbWBq19AqrerBZbwpQ0FWoNHsxe46xs3zkcYjSWgQW1K/jZUtSKr6lIAxCzeUZQLdIz12bvFeY3/l
 bFFPN4PXI1pIxzx7yvFFH/AeZ+k+mwDYndz9v+zW+CibM8mGjtUivQ9VIpj6g6n+G3qEAPJDsJVin
 A2IPxJN62yKgeaNCjTptWk11;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljdO2-0008I7-TE; Thu, 20 May 2021 07:46:31 +0000
Message-ID: <b83d52e7a5b846fd429811616f3b3c21d2f55480.camel@samba.org>
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: "Dr." =?ISO-8859-1?Q?Hansj=F6rg?= Maurer <hansjoerg.maurer@itsd.de>, 
 samba-technical@lists.samba.org
Date: Thu, 20 May 2021 19:46:24 +1200
In-Reply-To: <b6fb9ef1-3cbf-e970-eb2e-9e6e395c65ae@itsd.de>
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
 <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
 <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
 <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
 <b6fb9ef1-3cbf-e970-eb2e-9e6e395c65ae@itsd.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Thu, 2021-05-20 at 08:36 +0200, Dr. Hansjörg Maurer wrote:
> Am 19.05.21 um 11:55 schrieb Andrew Bartlett:
> > On Wed, 2021-05-19 at 07:56 +0200, Dr. Hansjörg Maurer wrote:
> > > > OK, so this case it doesn't happen, which is the one I patched.
> > > the gdb run took place with the unpatched version
> > > 
> > Thanks, can you try with the patched one?  I'm thinking we must be
> > hitting a different case now, if you still have issues, as the
> > lines
> > you show are gone with this patch (I hope).
> Hi Andrew
> 
> here is the gdb bt output from the patched version
> 
> I patched the sources an rebuild the RPM with the spec file.
> I would expect, this would apply the changes to the winbind.idl file?

Thanks, yes this seems to have been applied.  I've looked at this some
more and I see where we leak the tokens.

I'll see what we can do, I think for a conformant array (what I've
changed this to) we can be more efficient. 

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


