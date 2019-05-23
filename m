Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C2B27606
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2019 08:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=nAVhpVxh40pMMI5XYB/SoASNmj7abVy+7dRJahKmqsA=; b=zNLFwTCJQAi/yGisQO4qrzxMkC
	SJFNERJVwIsFxm79rFnTkKTcnfRaXPaeLnvCWuXvALwsiCkppr4pyMGIahTJ8M8KHXsdrwgN3swwI
	ae+PqYL3mUnxXF9jDjgUwI0KTqJRx4VHW9gSP3GtMtfc/Jz+gtqeYoG8llabkqbgEqWyUBgH76UWj
	Ho/DSLtHp8xjenAVDq2+c1Qt+a4oUfQDriiNMf37d+yfiU4p8lzXxzlvMsdrPEFJBiJ7HmsyKatHi
	BDxyXiHzh0835DQZWhQtlHxEw+SpfV2qNY30iWEIZWc2jfm9bTnLTv4zoya3Rp1VTL22Q4jmZ9aC2
	JTi6pW7w==;
Received: from localhost ([::1]:30206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hThJM-001OaP-0h; Thu, 23 May 2019 06:34:44 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41649 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hThJ9-001OaH-DL
 for samba-technical@lists.samba.org; Thu, 23 May 2019 06:34:34 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 458fqN23wQz9s6w;
 Thu, 23 May 2019 16:34:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1558593264; bh=YtLT0doD4hdaBQf0Xt7K4ky/yRumXOnPlQNxqWJPhwc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KTw+MG8y+7f/GwvlniLZo+crRhd22uE3jD/dG8L7rFg/g7d9Qvsf1unuDmTs1yLrM
 3CEKb5K0kjFsUAlkkJC0yg/1l/wehyVFNe03rz84leXd7V52AgftGjca79umLNR/n/
 j9GaezLaqJpfzjx9QMtoJNEzpPX8kATwY/kJVYDXHGhzWMHrNDcaSQ9hlA7ua6A3uJ
 ugU0OSnBfVh85LhGtjTXiOLgZCIxuEsClP/QHVauEl2HE668SsKlkWzyKZzgDRJtmP
 DLw8vmPePo0m6YxBOwH+Atf9SN+6iI/Uu/eySzX8YVHwqVQUBx0yZNSJpDl5/USyzW
 POZovb2AsDzvg==
Date: Thu, 23 May 2019 16:34:23 +1000
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Hitting Could not claim version: NT_STATUS_IO_TIMEOUT
Message-ID: <20190523163423.2c8cee71@martins.ozlabs.org>
In-Reply-To: <20190523162722.56831c89@martins.ozlabs.org>
References: <CACyXjPw5KdTqu1z+u5PzgYFCh3gsE6C8vPd+Yi0tnWLrLOHMzw@mail.gmail.com>
 <20190523162722.56831c89@martins.ozlabs.org>
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

On Thu, 23 May 2019 16:27:22 +1000, Martin Schwenke <martin@meltin.net>
wrote:

> On Thu, 16 May 2019 12:14:39 -0700, Richard Sharpe via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
> > I am hitting the following (in 4.7.1) in a CTDB-setup, and am looking
> > for hints on how to debug it.
> > 
> > --------------------
> > [2019/05/16 18:49:24.648838,  5, pid=21261, effective(0, 0), real(0,
> > 0)] ../lib/dbwrap/dbwrap.c:160(dbwrap_check_lock_order)
> >   check lock order 3 for g_lock.tdb
> > [2019/05/16 18:49:24.648880, 10, pid=21261, effective(0, 0), real(0,
> > 0)] ../lib/dbwrap/dbwrap.c:115(debug_lock_order)
> >   lock order:  1:<none> 2:<none> 3:g_lock.tdb
> > [2019/05/16 18:49:24.648908, 10, pid=21261, effective(0, 0), real(0,
> > 0)] ../source3/lib/dbwrap/dbwrap_ctdb.c:1112(fetch_locked_internal)
> >   Locking db 1294615339 key 73616D62615F76657273
> > [2019/05/16 18:49:24.648935,  5, pid=21261, effective(0, 0), real(0,
> > 0)] ../lib/dbwrap/dbwrap.c:128(dbwrap_lock_order_state_destructor)
> >   release lock order 3 for g_lock.tdb
> > [2019/05/16 18:49:24.648958, 10, pid=21261, effective(0, 0), real(0,
> > 0)] ../lib/dbwrap/dbwrap.c:115(debug_lock_order)
> >   lock order:  1:<none> 2:<none> 3:<none>
> > [2019/05/16 18:49:24.648963, 10, pid=21261, effective(0, 0), real(0,
> > 0)] ../source3/lib/dbwrap/dbwrap_ctdb.c:980(db_ctdb_record_destr)
> >   Unlocking db 1294615339 key 73616D62615F76657273
> > [2019/05/16 18:49:24.648977,  1, pid=21261, effective(0, 0), real(0,
> > 0)] ../source3/smbd/server.c:1497(smbd_claim_version)
> >   smbd_claim_version: g_lock_lock(G_LOCK_READ) failed: NT_STATUS_IO_TIMEOUT
> > [2019/05/16 18:49:24.649000,  1, pid=21261, effective(0, 0), real(0,
> > 0)] ../source3/smbd/server.c:2024(main)
> >   main: Could not claim version: NT_STATUS_IO_TIMEOUT
> > ---------------------
> > 
> > This is a four-node ctdb setup which was upgraded recently, but as far
> > as I can see all nodes are at the same version and the problem is
> > grabbing the lock.
> > 
> > This piece of code took the error path:
> > 
> >         status = g_lock_lock(ctx, name, G_LOCK_READ,
> >                              (struct timeval) { .tv_sec = 60 });
> >         if (!NT_STATUS_IS_OK(status)) {
> >                 DBG_WARNING("g_lock_lock(G_LOCK_READ) failed: %s\n",
> >                             nt_errstr(status));
> >                 TALLOC_FREE(ctx);
> >                 return status;
> >         }
> > 
> > Anyone have any idea what that is about or how to debug it further?  
> 
> Just so you have a reply, we have seen a variant of this
> (G_LOCK_WRITE failed) in our nightly testing but haven't been able
> to understand it.  We are looking at.
> 
> The logs usually show smbd_claim_version() timing out on all 4 nodes
> about 60 seconds after starting, with at least 2 nodes having the
> problem at the same time.  Occasionally this is seen on only a single
> node.
> 
> Before commit 97ad353a67ce0232d7ca5637f1bf8886e2df1aca fixed a bug in
> the CTDB test scripts we could see this continuing for a long time as
> ctdbd restarted smbd on nodes independently when the startup event
> timed out... but there may have 1 smbd alive at all times, meaning that
> (perhaps) g_lock.tdb didn't get wiped.
> 
> However, it didn't propagate from test to test, so when ctdbd was shut
> down on all nodes and then started again, the problem went away,
> presumably due to g_lock.tdb being wiped.
> 
> Commit 97ad353a67ce0232d7ca5637f1bf8886e2df1aca will probably hide this
> now in our testing, because ctdbd will be restarted simultaneously on
> all nodes if the cluster does not become healthy.
> 
> That's about all we know right now...  :-(

Oh!  One more thing.  If ctdbd were trying to migrate a record and was
unable to take a record lock for more than 10 seconds then it should
log a message saying "Unable to get RECORD lock on database ...".
However, we don't see that.

peace & happiness,
martin

