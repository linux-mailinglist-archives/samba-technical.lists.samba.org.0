Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E37917C5
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 15:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gvXDESwc7ehiYAnYV3ZPyuOQ3vsI6Cenqy36hUoAeyo=; b=xkoCrgD+gb0BNCOrgCU0wXhDTV
	kqV9JRrwdEAztIjQuQkQyo3i+hs7gwaf9VWH5zV3MvKeTVU61TSQikISHmzc3l7sDuWbVPrr3+qXf
	c76CvS3m1oPNC+j5yh/aInXm1nlx2fKKc1Ge1UMTJWchEYZTx/v4HGSnjFknTPKQyEHDN+AX76A6o
	1n4WDn/yUnfE0QdPfrNhpZN5lEBecjCoc/zCFyWEr0B/pdK6qsYc55LDlN9Pn6SG1jNf5Yw4HHmn/
	+Egcl2Wdd9UMq73DqF0ISGHbOr9thTGJIrWtUsYuVw0XvQ1p7M+29omgUpOSNqlgxIihwE+mJUyua
	4vVX3jgA==;
Received: from ip6-localhost ([::1]:57730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qd9H9-000LnN-KA; Mon, 04 Sep 2023 13:05:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25118) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qd9H0-000LnE-7M
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 13:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gvXDESwc7ehiYAnYV3ZPyuOQ3vsI6Cenqy36hUoAeyo=; b=dimH2zrPynICpko4AnS9/yA0TZ
 UaK61wtK9fH8ufGe5JChN+dvChDc1a0xPiD1NQ/nnRCkBjkft3N73qdjZf9UJ8wXKgDS/QYbQ8C6g
 48qAb+0zJ74poD5iIDptumLIn9JbGKxO9+qHe6NpSkQ1tI4//MUdaNz3bSIm17anVrWmcz53JejOs
 4Y0pTWhrB4XwGEPvvnTCVNHWYHBhieSkFu68zMPdCPmSzBsvad1OnnpNJuuv7uUrggkDfCqquClPV
 bw03fYkn9Fo2ObZbAz+k+IzMKBadQunzb1TwRyb3PHxGhZN3xrGCwXYOaqpQK1iXS+/6vafTc2Lld
 PGzeGF+TnxGLoHpmL6vewOJVgHl6YQhS56GacZL2HUjJyuWM1q0SN6JgzwuWN4OqvGMpFaRTZyfzY
 iq3qTIXLa5rlnu6cHkCA0enSJGjV1SQM616oh7e0WfXFpCNfpePrsRnv90z7NjcYg/uiRNuvVuXSK
 X8MvJi9LU8zGc2RDHWlBHfdT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qd9Gy-00Bih7-0V; Mon, 04 Sep 2023 13:05:44 +0000
Date: Mon, 4 Sep 2023 14:05:40 +0100
To: Andreas Schneider <asn@samba.org>
Subject: Re: `allow trusted domains = no` and `Unix Users`
Message-ID: <20230904140540.42736b49@devstation.samdom.example.com>
In-Reply-To: <2308461.ElGaqSPkdT@magrathea>
References: <2306152.ElGaqSPkdT@magrathea>
 <20230904103811.58a0c060@devstation.samdom.example.com>
 <2308461.ElGaqSPkdT@magrathea>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 04 Sep 2023 14:33:21 +0200
Andreas Schneider <asn@samba.org> wrote:

> On Monday, 4 September 2023 11:38:11 CEST Rowland Penny via
> samba-technical wrote:
> > On Mon, 04 Sep 2023 11:07:10 +0200
> > Andreas Schneider via samba-technical
> > <samba-technical@lists.samba.org>
> > 
> > wrote:
> > > Hello,
> > > 
> > > I have a user who set `allow trusted domains = no` in his
> > > smb.conf. He also set `force user = localuser` on a share.
> > > However he is not able to connect to the local share:
> > > 
> > > [2023/07/27 12:31:43.434346,  3, pid=1019460, effective(0, 0),
> > > real(0, 0)] ../../source3/lib/util_names.c:84(is_allowed_domain)
> > > 
> > >   is_allowed_domain: Not trusted domain 'UNIX USER'
> > > 
> > > [2023/07/27 12:31:43.434350,  3, pid=1019460, effective(0, 0),
> > > real(0, 0),
> > > class=auth] ../../source3/auth/auth_util.c:492(create_local_token)
> > > create_local_token: Authentication failed for user [cortexuser]
> > > from firewalled domain [UNIX USER]
> > > 
> > > The change was introduced by
> > > df5fe2d835169161d3930acf1e9c750dd2bc64b6
> > > 
> > > Is it by intention that local unix users fall into the "trusted
> > > domain" category or is this a bug?
> > > 
> > > 
> > > Best regards
> > > 
> > > 	Andreas
> > 
> > Stop me if I am wrong, but doesn't 'allow trusted domains = no' mean
> > that you only trust the domain that the computer is part of, so
> > local users will not be part of that domain.
> 
> local users are not part of any domain as they are local to the
> machine. However you can map domain users to local users.

My understanding is that you would require something like idmap_nss to
map local users to domain users, so if this is the case, wouldn't
this mean that you couldn't have any domain users on the machine if
they were not also local users ?
 
> 
> The allow trusted domains documentation says:
> 
> If it is set to no, then attempts to connect to a resource from a
> domain or workgroup other than the one which smbd is running in will
> fail, even if that domain is trusted by the remote server doing the
> authentication. 

> 'Unix Users' is a special domain for local users and smbd is running
> in that domain too. It is a local domain.

I think you might find that 'Unix Users' is actually a workgroup.

> 
> > Also, as I understand it, if you are trying to connect to the share
> > as a local user that the domain knows nothing about, you will be
> > denied access, but if you connect to the share as a known user and
> > 'force user = localuser' is in the share, then everything would end
> > up belonging to 'localuser'
> 
> You do not connect as a local user, you do connect as a domain user
> however all share operations will happen under the user you specify
> with "focre user". 

Well, yes you do connect as a local user, it is just that Samba maps
a domain user to a local user. In a domain, using something like 
idmap_rid, the domain users become local users, hence 'getent passwd' 
will display a domain users Unix details.

My feelings are that if 'allow trusted domains = no' is set, then it
should do what it says, only trust the domain set in smb.conf, 'Unix
Users, is not set in smb.conf, so it should not be allowed.

Rowland





