Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FE300F97
	for <lists+samba-technical@lfdr.de>; Fri, 22 Jan 2021 23:07:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Y07QB+SNFSVe1qkcWADx26sBGZb2pOeMt9Wt9niBAbM=; b=nr0raJWalH8kcdWoGp3WpSOFrZ
	Bo4ydVhFaviuHeTveAFVvFbyqrUzzb+I+6YXyIXrBr93IbfB6bWBrh0q4ADwmHN1SwQXVkyQ7yUq6
	GudvyOyRGur7OZiHC3MzJUSczaVMGjQnObGrslvBhxlWeh9Vdsj+FzjnzuGhUkVg0zD4qy1eceVag
	7H65x+B0t5fUYAXW/ehbCYCs4QKPCcTajbbP8HUDaGIlOWp8B+YoOrUk2RsalOXKOfB/FdUb4PT0m
	8YXDtw0LZx/ce7y0Bhbir81vUIYzOX4AORxZMrHVtNJeGqhmxKrnlW1mHANo/Yea8xqowzOm/MzCW
	3KW0y8Nw==;
Received: from ip6-localhost ([::1]:27708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l34Yr-006mlq-Mt; Fri, 22 Jan 2021 22:05:45 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:50357) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l34Yh-006mlj-4M
 for samba-technical@lists.samba.org; Fri, 22 Jan 2021 22:05:42 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DMtbf4gPqz9sCD;
 Sat, 23 Jan 2021 09:05:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1611353102; bh=JuwSr27vvl+LJF7aR/YlKPLhz1x+E0bmnsVNe6K1ulo=;
 h=Date:From:To:Subject:From;
 b=d9oj3ukh0IaVn4AjyWX4gXyQgvAg7qteVAu0/hzNOZc1grdKpjMC9g65OcsBvLGHO
 maSsfAdF/wa08k3Z4eoN1BJs030uK89HQqIyo/zXOoDqe/sIyrpQDFuTgFoZuBfUiW
 PuCVkdawxwaHes0IUOzvtRtir85fwvy5N0dbyY9W2jtDVS1+ozr/cU9aZ0oID5vdBA
 Zx3IwYQAtELHq85C51nZb5i9QU59pDSCneLQG1ehHXFHGb9jp6+s05I+jsJ0PUS+dH
 g4T4ctgKPli8QsCcXHarq2gAWee+s+CaCe8yTS0L31iq7ahvj5qlZoFdcovHiJbkpq
 g5u8qmQ9VQdHQ==
Date: Sat, 23 Jan 2021 09:05:01 +1100
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Unexpected winbind messages  in Samba >= 4.13
Message-ID: <20210123090501.51867342@martins.ozlabs.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

While debugging an unrelated issue in clustered Samba testing, I noticed
the following log messages each time winbindd is started:

  2021-01-21T01:53:33.077729+11:00 testn2 winbindd[218660]: [2021/01/21 01:53:33.076054,  1] ../../lib/ldb-samba/ldb_wrap.c:79(ldb_wrap_debug)
  2021-01-21T01:53:33.078165+11:00 testn2 winbindd[218660]:  ldb: Unable to open tdb '/usr/local/samba/private/secrets.ldb': No such file or directory
  2021-01-21T01:53:33.078242+11:00 testn2 winbindd[218660]: [2021/01/21 01:53:33.076162,  1] ../../lib/ldb-samba/ldb_wrap.c:79(ldb_wrap_debug)
  2021-01-21T01:53:33.078312+11:00 testn2 winbindd[218660]:  ldb: Failed to connect to '/usr/local/samba/private/secrets.ldb' with backend 'tdb': Unable to open tdb '/usr/local/samba/private/secrets.ldb': No such file or directory

Data points:

* smb.conf contains clustering=yes

* I don't see this is 4.12

Is this unexpected?

Thanks...

peace & happiness,
martin

