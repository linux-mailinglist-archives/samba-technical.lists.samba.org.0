Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAFA15D50F
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 10:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+6wGjSCBJHHwoNlOPCmx+lLgHie7DgK7TJhdWqaLGwo=; b=ZxjUjBZvHnrsPG2icl1GqNKYWE
	kqTW6wOgzAVYL0ln4KF/EFp63SCnJ+BslQ026hDvcDiFymjI8L1MB+tPfw8p1QY+N18nDezTB+5rK
	STxML0tV4p4dBzC1e9cVFHz8m7tz6glWdXq7zu4XqhahMczsxbSztwogPd2minm3Mhb8YShs8Xle7
	HaviwJecMcVOChmYjFtw0h+8SrivN5la1sGnv4+4Qyl9xkxoAgSvvNyi3yvAvc6YdbMM+B7SZxiO+
	JEvoV8b3wpF/slvHL5pShBa32dcW1xUBL+Hj8Bpf/iOjvagISjhaXKcfEo4aXHjHMkrkKeSmPY9eu
	vaH8KIMA==;
Received: from localhost ([::1]:62252 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2Xhr-009rtA-Ji; Fri, 14 Feb 2020 09:56:19 +0000
Received: from ozlabs.org ([203.11.71.1]:48925) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2Xhm-009rt3-Hb
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 09:56:17 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Jpfq0h06z9sRR;
 Fri, 14 Feb 2020 20:56:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1581674164; bh=hs2cgHPG0r6xGpcc94vFMph81pz3ZFqn06v8c+G4jI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=diPSJ00lppmy+t8+3cYHUYShrO1zdWDpTAv73FJJpo/HdbQ5DKooJNnjFlwsZDuLx
 tzkPVabpHSji933BGB2RO3L3+4nXatDWBRZRePIHnjHB3rd7y3WFuMLqS7x6SxBy3D
 gWZjIp108kyLgznI99ZT6a8ktDf6JkyyWAK4wGlrRmmT7FRAxQgWbMivCoZhwWGoYe
 21HEXzkdKadZubWQvzQS0Y5z3cUIUfcdbUeVpY6sDcbhyoDv95Ao64YXu0JwlvjBhL
 DhaHrJZaxQACKLohc1Z1rHFzwrqjsX7UCxFeLktzlQv1NgsX6UXXD43uc3ziM6y1/p
 N0f5uRLMPfwvg==
Date: Fri, 14 Feb 2020 20:56:00 +1100
To: samba-technical@lists.samba.org
Subject: Re: ctdb failover problem
Message-ID: <20200214205600.5d82b43f@martins.ozlabs.org>
In-Reply-To: <CAGbviv+X9gYosw0QmeMSqBmbwkfc4WtBVQ9h3X0+meBEmXQ7PA@mail.gmail.com>
References: <CAGbviv+X9gYosw0QmeMSqBmbwkfc4WtBVQ9h3X0+meBEmXQ7PA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 13 Feb 2020 11:32:55 -0500, Wyllys Ingersoll via
samba-technical <samba-technical@lists.samba.org> wrote:

> Running 4.10.13 with ctdb and 2 nodes behind haproxy.
> 
> The ctdb configuration does NOT use public addresses (since these are
> managed by haproxy).
> 
> Both nodes come up and join together successfully, and one of them is
> joined to the AD domain. The problem is that if the node that is joined to
> AD fails, the 2nd node doesn't rejoin the domain and so even though new
> requests are routed to it (via haproxy), since it is not explicitly joined
> to the domain, clients fail to authenticate and cannot access the shares or
> services.

Do you have the Samba "netbios name" parameter set to the same value on
both nodes?

> What is the trick to make ctdb automatically join the domain when a
> secondary node becomes the primary?

Note that Clustered Samba is usually set up as active-active.  That is,
smbd can accept connections on all nodes, so there doesn't have to be a
primary and a secondary.

peace & happiness,
martin

