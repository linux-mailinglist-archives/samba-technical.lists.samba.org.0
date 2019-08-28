Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD33A07B4
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 18:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=/iLjNFfXWRqb0xyIuliuO4j1tcloMl7swxNPQiAydRo=; b=1nt1804eqtGbaUcX3WnL1zDpeo
	nEC8WezN5T0f8buPPkWXaW4ek1760TCdKA3lJ1tfimXN+6n9QvuyXuYk47DFzkRX7IlZm0KQPJ6n/
	wszir/4UzDStfXoGaaKiLiJ4uQAqW+3O1XjPB/wPJM0xvioXAKnMzf7AeBhoshqnhWBybJrANzidI
	yPsaAp1BiGb4PsJU7IPR0zS+4UbV0VuiJlVbgDlobA22BioVfDDFKjZmILsJC8/iLuSOgYlAbdnJU
	P9QgSp0mdpv8xaoj+ZYjEaSIXSQX36mkR0rEsmqgG3ahIpv8bjQxW7CxYV977bOamA3tAfNx5hSA0
	daoRGusQ==;
Received: from localhost ([::1]:25410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i312v-0001ta-VC; Wed, 28 Aug 2019 16:43:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24566) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i312r-0001tR-Ak
 for samba-technical@lists.samba.org; Wed, 28 Aug 2019 16:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=/iLjNFfXWRqb0xyIuliuO4j1tcloMl7swxNPQiAydRo=; b=QcYYaWFWNzWsVWpd5xzyzBDMUD
 v5RC02CNHl+8S4FkUiyKmGli2QR2aCGT1+p0FxiMG3yM8NEh6W+zT+31C0Xs+TwgL5/rPw2wP1PCw
 8u8WMuiQuqsMtebAsy9Xy8X+nDwIz4owuUWDKTrB8zSCSteOLNE9/PsbzD6dK/lAdAGg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i312n-0000fD-Vi; Wed, 28 Aug 2019 16:43:38 +0000
Date: Wed, 28 Aug 2019 09:43:35 -0700
To: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: Add option to sort dacl into canonical order in nfs4_acls
Message-ID: <20190828164334.GA9947@samba.org>
References: <CAB5c7xqToOayxaAp9TYexiz-vKFbx-tUnbNqfgNGbE7EYMQ+eg@mail.gmail.com>
 <20190827165103.GA14309@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827165103.GA14309@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 27, 2019 at 09:51:04AM -0700, Christof Schmitt via samba-technical wrote:
> On Tue, Aug 27, 2019 at 10:49:19AM -0400, Andrew Walker via samba-technical wrote:
> > There are many ways that applications can write NFS4 ACL entries in a
> > non-canonical order per MS-DTYP 2.4.5. It would be nice to have the option
> > to automatically sort these into canonical order so that Windows doesn't
> > complain when viewing these.  I'm honestly a bit torn regarding the best
> > path forward with this. It's easy to say "you're doing it wrong - fix your
> > ACLs", but I imagine that some admins would want a "stop nagging me" option.
> > 
> > Example of some operations resulting out-of-order ACEs:
> > # file: /mnt/dozer/share/inherited
> > # owner: root
> > # group: smbuser
> >       user:smbuser:rwxpDdaARWcCos:-------:allow
> >             owner@:rwxpDdaARWcCos:fd----I:allow
> >             group@:rwxpDdaARWcCos:fd----I:allow
> >          everyone@:--------------:fd----I:allow
> > root@freenas[/mnt/dozer]# setfacl -m u:root:full_set:fd:allow
> > /mnt/dozer/share/inherited
> > root@freenas[/mnt/dozer]# getfacl /mnt/dozer/share/inherited
> > 
> > # file: /mnt/dozer/share/inherited
> > # owner: root
> > # group: smbuser
> >          user:root:rwxpDdaARWcCos:fd-----:allow
> >       user:smbuser:rwxpDdaARWcCos:-------:allow
> >             owner@:rwxpDdaARWcCos:fd----I:allow
> >             group@:rwxpDdaARWcCos:fd----I:allow
> >          everyone@:--------------:fd----I:allow
> > root@freenas[/mnt/dozer]# chmod 777 /mnt/dozer/share/inherited
> > root@freenas[/mnt/dozer]# getfacl /mnt/dozer/share/inherited
> > # file: /mnt/dozer/share/inherited
> > # owner: root
> > # group: smbuser
> >          user:root:rwxpDdaARWcCos:fd-----:allow
> >       user:smbuser:rwxpDdaARWcCos:-------:allow
> >             owner@:rwxpDdaARWcCos:fdi---I:allow
> >             group@:rwxpDdaARWcCos:fdi---I:allow
> >          everyone@:--------------:fdi---I:allow
> >             owner@:rwxp--aARWcCos:-------:allow
> >             group@:rwxp--a-R-c--s:-------:allow
> >          everyone@:rwxp--a-R-c--s:-------:allow
> 
> 
> I am not quite familiar with the output here, but i assume this is about
> having inherited ACL entries after explicit ACL entries. If all entries
> are "allow", then reordering them should not be a problem. On the other
> hand, if there are "allow" and "deny" entries, then the order is
> important and reordering would change the meaning of the ACL.
> 
> What is the problem to solve here? That an administrator changes the ACL
> through setfacl while not adhering to the order expected by the Windows
> clients?  Ideally, there could be a way in setfacl or even in the file
> system to only allow the Windows ACL order. As this is likely not
> feasible, maybe the "sort_dacl" option could be restricted to only
> reorder if there are only "allow" entries, but skip the reordering if
> there are "deny" entries. With that, the meaning of the ACL would not
> change. In any case, the behavior should also be documented in the man
> pages.

And once we agree on a path forward, adding a unit test in
samba/source3/modules/test_nfs4_acls.c for the new codepath would also
be helpful.

Christof

