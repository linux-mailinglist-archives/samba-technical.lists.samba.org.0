Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D3990BBE
	for <lists+samba-technical@lfdr.de>; Sat, 17 Aug 2019 02:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Hc5H79tEPssrpyGHoPcfRCt08FGFaYaCOIxZ9MIeIhE=; b=qNagZeAE7K2ppnv268CjrKvc2Z
	u71+TBx15GWalysyqYIZUUPCqESPtzfehCHkbWqy9IX7aGte0H3NuakTliHH/E/jE4J1hsQyAxSVL
	GeYy6ELYr0L3viPlAEAmd25YfAmSwVCklVpoYvpqkE/F+vDA2HMAv5Q6nwuptLnPClS8IHktWX1bX
	cAbzJOxk5IzYB6qVOEeLKtv9xPMxxu4rIBqQ/DkVcYWVDQS6mM+mz8VKZcr+oi5el1NR4w2rc662V
	tOa9prHdyH9yrbzaAv2Dkoxjzha1zmo8Nm0tFT9FmDj30ygqkA8vVM6AtamljQTySi21N5VfYFYrL
	Zpx6vk1g==;
Received: from localhost ([::1]:58274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hymWn-006hDK-KV; Sat, 17 Aug 2019 00:25:05 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:36721) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hymWi-006hD9-5I
 for samba-technical@lists.samba.org; Sat, 17 Aug 2019 00:25:02 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 469LYF3JQGz9sDQ;
 Sat, 17 Aug 2019 10:24:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1566001489; bh=xtWI+aMS7wgpcyGDErUvln4oZg211aY/gB5JJqY6A7U=;
 h=Date:From:To:Subject:From;
 b=GfjlTi3gLtsvYIdn6JSxskVrnq58cbxaVlkuPeJPDqDSuo8ELCkSSoKcNLcqLnzt4
 Vzo7XhrEigxlAqoyiPylFCgcULUw92YZCBqyS9C0b14ESJGyCGvaQ66/Jx3cbbNyy2
 8Oijm0x1j7QLYr+JFgzEgZVYKB6NqFrTOdm/G93jjW8ljXFaLSDztixb2kQUeUuBdU
 sAlY7AVUa3ppcVxHpcvLatHT2wfTnqLSP6VsRpe5W3SB/MZMux+QN7bXLMp0Bmyu/e
 lWxhNRvsDX4iM/OvuoelEmrsDW1goIKYF/ak+4KSTKelS9b7NUSwWdSRlvwXo6g8f4
 9C34w8QRa6IjQ==
Date: Sat, 17 Aug 2019 10:24:47 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] ctdb-daemon: Make STOP_NODE control wait until complete
 (bug 14087)
Message-ID: <20190817102447.55faa4c7@martins.ozlabs.org>
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

STOP_NODE is supported by a periodic check in the recovery daemon's
main_loop(), which notices the flag change, and schedules a recovery
and freezes databases.  If STOP_NODE returns immediately then the
associated recovery can complete and the node can be continued before
databases are actually frozen.  This means that the databases on the
stopped node will node never be marked invalid and the recovery
following CONTINUE_NODE can resurrect deleted records.

CONTINUE_NODE must wait for an in-progress STOP_NODE to complete
before commencing.

Multiple STOP_NODE controls are also serialised.  This isn't strictly
necessary but will stop more deeply nested event loops.

Went through this pipelines with a slightly different commit message:

  https://gitlab.com/samba-team/devel/samba/pipelines/76501176

Now running in this one:

  https://gitlab.com/samba-team/devel/samba/pipelines/76849217

Please review and maybe push...

peace & happiness,
martin

