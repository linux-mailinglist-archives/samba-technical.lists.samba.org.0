Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2013DEB4A
	for <lists+samba-technical@lfdr.de>; Tue,  3 Aug 2021 12:53:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=AtWfdbmZG96AOa9Rz71zG2d8Rt6i6aI6HQKX0RoiAvw=; b=sGBjmWSePXcegl+PaQTOeuiOub
	tD4k8PbAL/NTW4rOW3zHRGgo3+n00SrCw5ZmHvKMJ+E3GIXTne56NmEhvMUX50JaF68PYJxFgOeTl
	7H12ExJXqSBqr9awzh/vS/YdIR+Xk9ig8wcDz7GAH8MCz2W66gWipoQdpYRquVviYyko38buQ+cgq
	IWGq3EUaZxGL15kgPI8sgzWJm008iCjcqvi6rJ/miNdzDYSYo72oO9z/VXzeD1dGMzZeLuZKYvwq7
	AOwWIx1SOiAPoVHBwgVjefLYiLsnf4QOka5Y1yPmwNF+Z1Sd3ehQLiT0dpNfsnTn7a/BAHT8E7zXo
	HI6yXw1g==;
Received: from ip6-localhost ([::1]:52214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mAs26-004CDI-56; Tue, 03 Aug 2021 10:52:26 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52707 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mAs21-004CD8-MU
 for samba-technical@lists.samba.org; Tue, 03 Aug 2021 10:52:24 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GfBX866sBz9s5R;
 Tue,  3 Aug 2021 20:52:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1627987928;
 bh=AtWfdbmZG96AOa9Rz71zG2d8Rt6i6aI6HQKX0RoiAvw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C6LGjXVCgBLs05rBFPxNQyVC+bZLe5xENaTrZ0sO9iqzOuMhdqKc3XJnv8zrPAsJa
 NQ41N1BPVEEm3E87e6VkZSJ4ct6L8K/r4TX9Hr/HGHF2/DxvxSOxw/u9HZah5FvYrQ
 RTn7ANhJ2kYCh9lKyaAsGCbac4uhMfKYoOjO1NIBZGOPKZGNVRVJaz9u1Xfdo1NwaY
 FGRTncj884i/uBeFS7GDI6dvtimyWyEas8rxYY4fbqKkS269eZgURVnc01ZcQIUk0a
 a9OmV/iJ4ek9Ph5yYLk2wYUisaS8xYoa3aZHCfR3DL4FD5aEIlNjXaJBz17tQVnvW5
 l2jYAtcwouwRA==
Date: Tue, 3 Aug 2021 20:52:07 +1000
To: Andreas Schneider <asn@samba.org>
Subject: Re: Autobuild paths too long again
Message-ID: <20210803205207.0fab0e60@martins.ozlabs.org>
In-Reply-To: <1844799.PPI7QROb2N@magrathea>
References: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
 <20210803150319.1cab1e0c@martins.ozlabs.org>
 <1844799.PPI7QROb2N@magrathea>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 03 Aug 2021 11:58:16 +0200, Andreas Schneider <asn@samba.org>
wrote:

> If socket_wrapper is the issue we should see errors that SOCKET_WRAPPER_DIR is 
> too long.

I think that's only true if socket wrapper is mapping a TCP socket to a
Unix domain socket.

I'm not saying that socket wrapper is causing the issue.  I'm
suggesting that socket wrapper could be used to solve it, probably by
having an option to map all Unix domain sockets to a short path (e.g.
via a hash).  I don't think this would hide real bugs, I think it would
just hide deficiencies in our test environment. ;-)

> In case of winbind and the windbind socket path, we should not start with a 
> clear message what is wrong.

That's true too!

peace & happiness,
martin

