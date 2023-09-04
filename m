Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8437879196C
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 16:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=PBius2smZKYIU3g2sNSrb+duzBItZcVu2BIau+W6rjg=; b=shb7zuKFXeTjHKeuZtJBNLs9OA
	0addNRkEXXhE5xMG2TW3wwcG3cvN2hAvRXZt6EKQqjo2cNGw59b956bX8dlUIasfGje8trh+JPRH3
	JL7b5j8nharOz/IonD6fIFzvbvj4AlZ5rwwcg/ygu004M9/pVrVJQwNfT2pinYYxTqgNHRA6zUQLb
	pMaOv4ZQU5vTj5AmGKV8aVVbeuSIxZ5qnbUCO+JlIXergnEzhlYX1wgGjEXDOU+H6Hghq9RbE2DRZ
	7n2TImQ6q5NElFqqOLog/Zz9Ur//ih0i8MgpRfJyOeqAALWzAbxBv34YrLqaeOcP7xp8lW7o6nntg
	3WDm0y3A==;
Received: from ip6-localhost ([::1]:21608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdAEq-000P4i-RV; Mon, 04 Sep 2023 14:07:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14190) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qdAEg-000P4Z-TC
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 14:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=PBius2smZKYIU3g2sNSrb+duzBItZcVu2BIau+W6rjg=; b=lnuRkhp03KCPUgSUrMJ5u1dJ27
 sD320CEL6BBSbkqhqYO7jp/A5PmN45m4efhkrCDbKEe+b5+tvkNTwmYbQwEyed48YU+xjZxyKg0Qc
 l98FXtufoDd2vhsEKIFvYBotxC6wInaaO5OY3LUejS7IsX9BiHRP9d7aSHTB7lZgOJ+xuQMMwP1NE
 qALoTTlo9eIjK7aX+d8q3+4lLw2GOeH70Y6NkcTDgsB4x6hmizddYBGFEIa0+wT6JGN7tqVoDi27Z
 z714q9DkCzuwBEQGILO1wDwV6oIE6KETnq99sW3WrbaptEBAl2A7BukiKLJd51PhOGGrHigp/YHCB
 dUByQFLsPQII5L9jo8qxUyZ7O7JO/MIZ/FNW58Q2sM/lF2FWp4gpIAXaLXkwYwH/UTqYIL3HjX3HN
 r46YVW8Hjzi5uOFDhry748JNRnkIFMrQ2XxGa7hcPnJKUCN2fHX3fG5aEPix+W5khXlH1LyKVN6Zb
 cqcmR9j1/D2/Do2qgh3uG+33;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qdAEe-00BjHs-2A; Mon, 04 Sep 2023 14:07:25 +0000
To: samba-technical@lists.samba.org
Subject: Re: `allow trusted domains = no` and `Unix Users`
Date: Mon, 04 Sep 2023 16:07:23 +0200
Message-ID: <10344674.nUPlyArG6x@magrathea>
In-Reply-To: <20230904140540.42736b49@devstation.samdom.example.com>
References: <2306152.ElGaqSPkdT@magrathea> <2308461.ElGaqSPkdT@magrathea>
 <20230904140540.42736b49@devstation.samdom.example.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 4 September 2023 15:05:40 CEST Rowland Penny via samba-technical 
wrote:
> On Mon, 04 Sep 2023 14:33:21 +0200
> 
> Andreas Schneider <asn@samba.org> wrote:
> > On Monday, 4 September 2023 11:38:11 CEST Rowland Penny via
> > 
> > samba-technical wrote:
> > > On Mon, 04 Sep 2023 11:07:10 +0200
> > > Andreas Schneider via samba-technical
> > > <samba-technical@lists.samba.org>
> > > 
> > > wrote:
> > > > Hello,
> > > > 
> > > > I have a user who set `allow trusted domains = no` in his
> > > > smb.conf. He also set `force user = localuser` on a share.
> > > > However he is not able to connect to the local share:
> > > > 
> > > > [2023/07/27 12:31:43.434346,  3, pid=1019460, effective(0, 0),
> > > > real(0, 0)] ../../source3/lib/util_names.c:84(is_allowed_domain)
> > > > 
> > > >   is_allowed_domain: Not trusted domain 'UNIX USER'
> > > > 
> > > > [2023/07/27 12:31:43.434350,  3, pid=1019460, effective(0, 0),
> > > > real(0, 0),
> > > > class=auth] ../../source3/auth/auth_util.c:492(create_local_token)
> > > > create_local_token: Authentication failed for user [cortexuser]
> > > > from firewalled domain [UNIX USER]
> > > > 
> > > > The change was introduced by
> > > > df5fe2d835169161d3930acf1e9c750dd2bc64b6
> > > > 
> > > > Is it by intention that local unix users fall into the "trusted
> > > > domain" category or is this a bug?
> > > > 
> > > > 
> > > > Best regards
> > > > 
> > > > 	Andreas
> > > 
> > > Stop me if I am wrong, but doesn't 'allow trusted domains = no' mean
> > > that you only trust the domain that the computer is part of, so
> > > local users will not be part of that domain.
> > 
> > local users are not part of any domain as they are local to the
> > machine. However you can map domain users to local users.
> 
> My understanding is that you would require something like idmap_nss to
> map local users to domain users, so if this is the case, wouldn't
> this mean that you couldn't have any domain users on the machine if
> they were not also local users ?

No, not at all, see 'force user` or `username map` options.

> 
> > The allow trusted domains documentation says:
> > 
> > If it is set to no, then attempts to connect to a resource from a
> > domain or workgroup other than the one which smbd is running in will
> > fail, even if that domain is trusted by the remote server doing the
> > authentication.
> > 
> > 'Unix Users' is a special domain for local users and smbd is running
> > in that domain too. It is a local domain.
> 
> I think you might find that 'Unix Users' is actually a workgroup.

There is nothing like this in the Windows world. It is a Samba thing ...

> > > Also, as I understand it, if you are trying to connect to the share
> > > as a local user that the domain knows nothing about, you will be
> > > denied access, but if you connect to the share as a known user and
> > > 'force user = localuser' is in the share, then everything would end
> > > up belonging to 'localuser'
> > 
> > You do not connect as a local user, you do connect as a domain user
> > however all share operations will happen under the user you specify
> > with "focre user".
> 
> Well, yes you do connect as a local user, it is just that Samba maps
> a domain user to a local user. In a domain, using something like
> idmap_rid, the domain users become local users, hence 'getent passwd'
> will display a domain users Unix details.

This has nothing to do with id mapping. Especially not the bug. The bug is 
about 'force user = localunixuser' not working.

Trusted domain is an AD term and it means normally domains having a trust. If 
you want you can says there is always a machine local trust. If you don't 
trust your local machine, you shouldn't be using it in the first place :-)

> My feelings are that if 'allow trusted domains = no' is set, then it
> should do what it says, only trust the domain set in smb.conf, 'Unix
> Users, is not set in smb.conf, so it should not be allowed.

There is no domain Unix Users in the Windows world! It is something Samba 
internal!


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



