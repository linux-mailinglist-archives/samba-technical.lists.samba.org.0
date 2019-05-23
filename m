Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC05275FC
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2019 08:28:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=J6qTeK32zPLLbeHVA7x4TPtcjo9CiR1wXtfoI96lsGM=; b=ufSs61WIMiFr69/QYNDTlRI0dX
	ywbfDgxwSq3hWuYBPIMX9Juk9y+mJvO5T1VuMigBJD5UqoXljAlqGejivPKN5CeTquPLjcyOdvCKx
	kP22acyxMyQdHf4SXjSJoZH2nGYQ8DNwpJ7kHd7mFR/5PMkgIdVCKNl2FsIFUfgDttZIZu5kc0lws
	Rt/HcZcvVFTFH9InK7k229H/8Gw3itV+qsU8/YOrugF322da1sX40XZZVpL93ZHBfquDJJZl7Wwyc
	XPN+bRYYD4ycn3wnZZanbNeQ1PgLli5JgHWt77Y2VjQN5DkGdFQeSRV0W03yRS1mWfuW2il0W0KLA
	2hdJKAzA==;
Received: from localhost ([::1]:29470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hThCf-001OSn-SO; Thu, 23 May 2019 06:27:49 +0000
Received: from ozlabs.org ([203.11.71.1]:54727) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hThCQ-001OSd-71
 for samba-technical@lists.samba.org; Thu, 23 May 2019 06:27:38 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 458fgH23rWz9s5c;
 Thu, 23 May 2019 16:27:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1558592843; bh=X4KsWw4pspUwojJwdwJgKuMkvp/dVhYCg9YwcOyu26c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gF94M+OF71lninbS9W047Nkq0Dl8l9qFjNjBVd5j17rfFuhO51L3iA4doAu2L5ROX
 fj8Nf5LFMX4SJ83lrIFNX6lortkQmOsAO73Ume8H91PjRSM5ZjD2exY7Ofy255xMuG
 MqIaNCfXxxK9q1GXSpw94I+pW99wsV+dMU7fzo/BedNlYlPtbFPl8yBzS0cMw04sZD
 I5R8BQRgTkYOJUSqzbMQkEMwiczIHVE0Qm6g5fqiZa0eeWBblQOGtVr+KXCiOKdddT
 b5ZYONEa9oA9F1Vsci+0Ci05WX0WBw2LngHU8eMgQoVeG1vpb0FwLT/f8yH2R32zOX
 aVSu8fQjvWsjQ==
Date: Thu, 23 May 2019 16:27:22 +1000
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Hitting Could not claim version: NT_STATUS_IO_TIMEOUT
Message-ID: <20190523162722.56831c89@martins.ozlabs.org>
In-Reply-To: <CACyXjPw5KdTqu1z+u5PzgYFCh3gsE6C8vPd+Yi0tnWLrLOHMzw@mail.gmail.com>
References: <CACyXjPw5KdTqu1z+u5PzgYFCh3gsE6C8vPd+Yi0tnWLrLOHMzw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

Hi Richard,

On Thu, 16 May 2019 12:14:39 -0700, Richard Sharpe via samba-technical
<samba-technical@lists.samba.org> wrote:

> I am hitting the following (in 4.7.1) in a CTDB-setup, and am looking
> for hints on how to debug it.
> 
> --------------------
> [2019/05/16 18:49:24.648838,  5, pid=21261, effective(0, 0), real(0,
> 0)] ../lib/dbwrap/dbwrap.c:160(dbwrap_check_lock_order)
>   check lock order 3 for g_lock.tdb
> [2019/05/16 18:49:24.648880, 10, pid=21261, effective(0, 0), real(0,
> 0)] ../lib/dbwrap/dbwrap.c:115(debug_lock_order)
>   lock order:  1:<none> 2:<none> 3:g_lock.tdb
> [2019/05/16 18:49:24.648908, 10, pid=21261, effective(0, 0), real(0,
> 0)] ../source3/lib/dbwrap/dbwrap_ctdb.c:1112(fetch_locked_internal)
>   Locking db 1294615339 key 73616D62615F76657273
> [2019/05/16 18:49:24.648935,  5, pid=21261, effective(0, 0), real(0,
> 0)] ../lib/dbwrap/dbwrap.c:128(dbwrap_lock_order_state_destructor)
>   release lock order 3 for g_lock.tdb
> [2019/05/16 18:49:24.648958, 10, pid=21261, effective(0, 0), real(0,
> 0)] ../lib/dbwrap/dbwrap.c:115(debug_lock_order)
>   lock order:  1:<none> 2:<none> 3:<none>
> [2019/05/16 18:49:24.648963, 10, pid=21261, effective(0, 0), real(0,
> 0)] ../source3/lib/dbwrap/dbwrap_ctdb.c:980(db_ctdb_record_destr)
>   Unlocking db 1294615339 key 73616D62615F76657273
> [2019/05/16 18:49:24.648977,  1, pid=21261, effective(0, 0), real(0,
> 0)] ../source3/smbd/server.c:1497(smbd_claim_version)
>   smbd_claim_version: g_lock_lock(G_LOCK_READ) failed: NT_STATUS_IO_TIMEOUT
> [2019/05/16 18:49:24.649000,  1, pid=21261, effective(0, 0), real(0,
> 0)] ../source3/smbd/server.c:2024(main)
>   main: Could not claim version: NT_STATUS_IO_TIMEOUT
> ---------------------
> 
> This is a four-node ctdb setup which was upgraded recently, but as far
> as I can see all nodes are at the same version and the problem is
> grabbing the lock.
> 
> This piece of code took the error path:
> 
>         status = g_lock_lock(ctx, name, G_LOCK_READ,
>                              (struct timeval) { .tv_sec = 60 });
>         if (!NT_STATUS_IS_OK(status)) {
>                 DBG_WARNING("g_lock_lock(G_LOCK_READ) failed: %s\n",
>                             nt_errstr(status));
>                 TALLOC_FREE(ctx);
>                 return status;
>         }
> 
> Anyone have any idea what that is about or how to debug it further?

Just so you have a reply, we have seen a variant of this
(G_LOCK_WRITE failed) in our nightly testing but haven't been able
to understand it.  We are looking at.

The logs usually show smbd_claim_version() timing out on all 4 nodes
about 60 seconds after starting, with at least 2 nodes having the
problem at the same time.  Occasionally this is seen on only a single
node.

Before commit 97ad353a67ce0232d7ca5637f1bf8886e2df1aca fixed a bug in
the CTDB test scripts we could see this continuing for a long time as
ctdbd restarted smbd on nodes independently when the startup event
timed out... but there may have 1 smbd alive at all times, meaning that
(perhaps) g_lock.tdb didn't get wiped.

However, it didn't propagate from test to test, so when ctdbd was shut
down on all nodes and then started again, the problem went away,
presumably due to g_lock.tdb being wiped.

Commit 97ad353a67ce0232d7ca5637f1bf8886e2df1aca will probably hide this
now in our testing, because ctdbd will be restarted simultaneously on
all nodes if the cluster does not become healthy.

That's about all we know right now...  :-(

peace & happiness,
martin

