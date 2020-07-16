Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAB3222E7F
	for <lists+samba-technical@lfdr.de>; Fri, 17 Jul 2020 00:27:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=L1YAuPantTjncDnxLzwqJR4bOUXJs6QXO2N9lbYT+aQ=; b=pR6mzxfQF9TS+VHBUhALHulq/L
	kz2MJy6jj0NaO3pFp/MPz9Ul7F5WSJ01OMWHNuonbf95X6A8a6+SGBsYsOBGT0sYs0wfup22gmUNz
	G3BPwXL4wbyAfXPKABm6uvNTOZ0RZzxEV9G9BUk1r84iTwayrHVjmhzbtUxPTUh1puEMvq4tsowDy
	47EIdZsapJsmWoWoALCPN8N138dnfkDIlSwz6uPnZSFFmrwQxQ/jR5q0CiEIjzgyBRRNd71eBfOG3
	3HUHCzjIf77p7zSJTkqWcj+OayLrgn8JYf9n/0AI9k+QC5nUIaRiCPcqA47xhI0pIjlsyZc9hv/rT
	c+F+K9Og==;
Received: from localhost ([::1]:50368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jwCKV-008FpV-Jl; Thu, 16 Jul 2020 22:26:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63298) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jwCKO-008FpK-JF; Thu, 16 Jul 2020 22:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=L1YAuPantTjncDnxLzwqJR4bOUXJs6QXO2N9lbYT+aQ=; b=ErngGLXqOTyFFNdWH7rruLr0Ib
 BUEK+SxZ8RHw6tI3SgpppQBiaI65f7upaoViaKkBMMeAztqzociGqcXbC9jwTQRrL/De0dFAI2zA+
 WD87NhTyBIdNUbfdj5rGJF0v1/F5NRa5j4oSgiolZgcpamBBsJqXVq009JQDcT0vkaxO5nHX0ZUpS
 CF3cBUqNCQhaJ985xQcWrGvEx6fZDkhwYElWuxzFkOpvhiBOuDJAuwJAqLuUAJzE30dtULnFzmeXX
 DCplFelJVFSMSFlDMt0jaalCdBcpY2QaheKc2G7QzrxXb7ZU8GqNKgKO3dAuRDg5bj85O3+c9LcSV
 HDxTx440cRw3AGQES6/+4IrOFQkXbp2k1q5QuxC9Cd1O05/ylviS++cAwR7v7J1n6QqqnfV43UQqU
 JaxxRW67vOJeFsmVK5aUw93gg7Zo5nPc03FhrtuCDp4wcdFJ5IWj0XjAcz5mV8pjZMRAT7OefygQh
 4BphJO23PJFlQnp5NSkOd/IK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jwCKM-00046O-RC; Thu, 16 Jul 2020 22:26:07 +0000
Date: Thu, 16 Jul 2020 15:26:00 -0700
To: samba-technical@lists.samba.org, metze@samba.org, slow@samba.org,
 asn@samba.org
Subject: Problematic port field in struct ip_service in Samba.
Message-ID: <20200716222600.GC6574@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Team & all interested parties,

Inside Samba we use a struct:

source3/include/smb.h:

struct ip_service {
        struct sockaddr_storage ss;
        unsigned port;
};

It's used in these files:

source3/include/proto.h
source3/include/smb.h
source3/libads/kerberos.c
source3/libads/ldap.c
source3/libsmb/dsgetdcname.c
source3/libsmb/namecache.c
source3/libsmb/namequery.c
source3/libsmb/namequery.h
source3/libsmb/namequery_dc.c
source3/torture/torture.c
source3/utils/net_lookup.c
source3/winbindd/winbindd_cm.c

Looking carefully I haven't been able
to find any place where we actually
use the 'port' field of this struct
other than (a) setting it to zero
or (b) setting it from the return
=66rom a SRV record lookup when that
lookup returns a port entry.

As far as I can see it's never actually
used to select an outgoing port for
any connections :-).

In fact in many of the name resolv
functions internally (resolve_hosts()
for example which uses getaddrinfo() directly)
we explicitly set it to zero.

I'm currently working on fixing
up some of our internal name resolution
functions to use a pthreadpool async
version of glibc getaddrinfo() which
is already thread safe, to improve
our name resolution in poor DNS
environments.

It would make some of this code
much easier if I could just ditch
the 'port' requirement and set it
to zero. It's only actually correctly
returned from DNS lookups when we're
using our own SRV record lookup code
anyway, so I'm pretty sure it can't
be relied upon.

I have a working version that preserves
the existing 'return port' semantics,
but it makes the code uglier than I'd
like and prevents me from easily
using it to parallelize many of our
DNS lookups (like the ones done from
winbindd for example).

Eventually I'd like to replace all
uses of struct ip_service -> struct sockaddr_storage,
but that's a bigger cleanup for another
day.. :-).

Any objections to silently setting
port =3D 0 for name resolution ? It's
done in many of the existing code
paths anyway so we can't rely on port
being set correctly in returns from
internal_resolve_name(), plus we
never actually use it :-).

Thoughts ?

Jeremy.

