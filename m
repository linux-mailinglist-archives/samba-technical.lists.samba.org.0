Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0E18CAEE
	for <lists+samba-technical@lfdr.de>; Fri, 20 Mar 2020 10:56:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=LoDQjo+aQgxapbS4UxoNLvMrEHAAx2QHwAnnCXEELR0=; b=rkX+bQgjFRL2aSYExgDnjnI9GN
	XmtEnPKmGMedhrWGBw5W8dH0z50Z5SvDo50rJwGRDAGKZumF/bwUTgE0uiFkbunsE/D1HEi8yVK3h
	8ootCI7ZCr1Ac+G8UX4WRRy4LjpHjHeJAwArFj4N+WOL57VnbE/oUBYCEkHayhVtZiy4HUYWfGeZH
	71ZCIxdFvKIKj9VbuTsujZRK92ZvJjd0vr5iQk8+wa5d4xUJzOHDxQzrr8rvWFahm24P4Bs0fiBHn
	ykdwxYremLfwGbBqqtqPtZ1gvwIPRUlTIsg/VRP1UGihnUSLv0eXbEtWg+/dEHa6wIthLVMYI147W
	gvmjGJsQ==;
Received: from localhost ([::1]:39440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jFENH-000GsH-EJ; Fri, 20 Mar 2020 09:55:31 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:53133 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFEN9-000GsA-Uu
 for samba-technical@lists.samba.org; Fri, 20 Mar 2020 09:55:28 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48kJzm1zZWz9sPF;
 Fri, 20 Mar 2020 20:55:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1584698116; bh=LwU4/qqc2JS1NWIPlLjsG0WUmBVQjMXhflzAPE7eF4Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JTB5heQ3Jk4OjlYnjDrXe1Z7N6WwNgYcz/bWVNzBw0wPybS9yKqXPUmeqHiQANcoa
 Nt83ORUyio5FUd0lD4B2YSLRyOzN0XKnVXUQC/MnUyDzaQrsXzcsjWR2UIcvPNnVVx
 1+DLL9vdHBmqkw3+uIuBMDZJK2+hdh4Scys9TsCoGm3Gh2LVRn7vqxk3SaFhD74p6Q
 /rg/d0QrUKQorXTFthm+ablJE/Sgk7SXjJe+mbrjr5DViUwr2i1lASb8EgwpcuIXOm
 bL09zLZrh2PpTjXTjmpWwr4/14N40BbKbkCfOh5eXg2DHIlkQFACYR4mgM9fJr7njN
 vrADtXotgCyzA==
Date: Fri, 20 Mar 2020 20:55:12 +1100
To: Karolin Seeger <kseeger@samba.org>
Subject: Re: [Release Planning 4.10] Last 4.10 bugfix release
Message-ID: <20200320205512.651c6196@martins.ozlabs.org>
In-Reply-To: <b416c744-ddb7-bbb9-807f-cae6b310513a@samba.org>
References: <b416c744-ddb7-bbb9-807f-cae6b310513a@samba.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Karolin,

On Fri, 20 Mar 2020 09:07:54 +0100, Karolin Seeger via samba-technical
<samba-technical@lists.samba.org> wrote:

> for your convenience, there will be a last 4.10.14 bugfix release on
> Thursday, March 26 2020.
> 
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
> has been updated accordingly.
> 
> If there are any important fixes that should go in, please let me know asap.

I think that this is a very good candidate:

  https://bugzilla.samba.org/show_bug.cgi?id=14295

Strangely, the v4-11 patch won't apply with "git am".  However, if I
cherry-pick the very same commits from v4-11, it works fine.  That is,
the following works:

$ git cherry-pick 46e19f9f402..783335f207d

Want me to attach a patch for v4-10?

Thanks...

peace & happiness,
martin

