Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E122514D5E7
	for <lists+samba-technical@lfdr.de>; Thu, 30 Jan 2020 06:16:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=G1O3nk92DRHSJmSFQpQ7dr7y3z+d9MBdHmpkoOEd8LM=; b=XgCPS6PhC8lI8gn52ezkI/vufi
	19zqs1z3wpjqd37MJ/jkskhJ/pHlN/lh+lEblMOn5ObHG1Cz1V0AhXFLzMIpGsM6Bulxtc9rvv5ke
	roidYZiP4WsXFoIunIDabcy/FiWvgTqEWOaBguG1YQU4sFsbvkBSAylC2TDW2wym2IpaGaBOW6jbk
	6YhJ7hXk5N2Cob5AfAVN/4SUhQ/jSC1JJbdwCHJ3a6F6wvMRKrsKr7aXTZv9L1qcLXlE/kr5G1kbH
	If/PcyCplHQpUWKOyz9fXd1RGgZBjqqz5600r9ApsUV29saAJHX/aW7cHcHaGOjKJqbbLxRQSypGa
	IuSbLx7g==;
Received: from localhost ([::1]:37156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ix2BI-005ReT-5W; Thu, 30 Jan 2020 05:15:56 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:45335) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ix2BE-005ReM-4s
 for samba-technical@lists.samba.org; Thu, 30 Jan 2020 05:15:54 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 487T896x5Lz9sNF;
 Thu, 30 Jan 2020 16:15:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1580361338; bh=VtOZ51Pag0voVwXDGdPubvQKeS0C4OSNAsD+U+K+n3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HOsitM18cb2FRYqex0A0GikOAhL0j6mGlpu2Ub1euoCkpE/TJiYFtJd7p6WEu0P4A
 RGI7ZalRih2OPiP5iPXlt6rEJU2XvHODWzuQGhU156R3cNQjCyJvnYOXIe0xu8qqah
 h82qroJ2duwU3cBoARQsRch3YyP4NeU/mg7cAGXEc574E4kAT0HdFP1bgmDBNxB9Cq
 jjWsGXJkd6JcQHDOCwhSXF2p6J8kARx3iabhd5/6Ng0OMr8bqk0Npytexbv2Y2Gqz7
 zKrHC+mJbgohtsT56jHjltyLRFelQtTr1kZwNdmXnCXYXoYng18pitxPScqAJn4le/
 kmrKMhk6Yce9Q==
Date: Thu, 30 Jan 2020 16:15:36 +1100
To: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>
Subject: Re: ctdb, haproxy, and ip_nonlocal_bind
Message-ID: <20200130161536.271df9ca@martins.ozlabs.org>
In-Reply-To: <CAGbvivLQB+MfGGX-DH+7VUSB2RjPm2qr7CfpgzZZwoui3w6fdw@mail.gmail.com>
References: <CAGbvivLQB+MfGGX-DH+7VUSB2RjPm2qr7CfpgzZZwoui3w6fdw@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 29 Jan 2020 16:43:07 -0500, Wyllys Ingersoll via
samba-technical <samba-technical@lists.samba.org> wrote:

> I have a cluster in which I want to use both haproxy AND ctdb on the same
> nodes - haproxy to manage NFSv4 (ganesha) and CTDB to manage SMB.  The
> reason for doing this is that I've read several warnings about NOT using
> NFSv4 with CTDB.
> 
> haproxy + keepalived require that the net.ipv4.ip_nonlocal_bind flag be set
> to 1 which breaks ctdb's ability to manage the virtual public IP addresses
> (among other things).
> 
> If I do not configure any public_addresses and just let haproxy configure
> the virtual public IP addresses, CTDB is still unable to startup on both of
> the nodes in my test cluster.  It will start on one or the other, but they
> never sync up and come to an "OK" state on both nodes.
> 
> I have the "node address" value set in the [cluster] section of ctdb.conf
> on each node to be the private address of that node and both private
> addresses are listed in the nodes configuration file and the nodes are
> connecting to each other privately, but they don't stay connected and the
> 2nd ctdb node never fully initializes and starts up.  At some point it just
> begins flooding the logs with messages like this "node 192.168.113.14:4379
> is already marked disconnected: 0 connected" and pegging the CPU at almost
> 100% until the disk with the logging completely fills up (which sounds like
> a bug, btw).
> 
> Does anyone know of any way to make this sort of configuration work ?
> 
> Currently running Samba 4.10.10, haproxy 1.6.3, and Linux Kernel 4.19.34 on
> Ubuntu 16.04.4
> 
> Any help would be much appreciated.

Using "node address" should make this work.

However, you're being bitten this bug:

  https://bugzilla.samba.org/show_bug.cgi?id=14175

This is fixed in Samba 4.10.13.

I hope that upgrading makes this work for you.  Please let us know if
it doesn't...

peace & happiness,
martin

