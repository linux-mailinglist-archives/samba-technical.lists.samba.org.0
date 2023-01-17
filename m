Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C8B66E795
	for <lists+samba-technical@lfdr.de>; Tue, 17 Jan 2023 21:17:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=G7BLmrkQRtvynRwcKHFmk8xBwnFMrvOwT9MK6Rol/LU=; b=3ow9lee4uVO02BqlY3GxniD9w/
	gd4zo1d4Jj4wbakN0S972S1p47l1dqvE3VVXtSiwXk1TwWBRGe5DpKlkA7T8QGN6KFGI95fr9SVaO
	fbL/uxDGM9K7SyeGLgs9TxOIF8zFHT5CLIGyQ06Wje2EwvnKMr4kJMZl3NIYEcK/hbq3ZwQKOkKM8
	8H9deX+dZKD1t0jIRCDTfe+8rWPRTpEd/VyBLkgkNHGdgLcpJNOX6ETdu/zlj+l1tAipxENzsEB7N
	Qh8ClT/z3zcRmLwK4ANL9dFIxJm///AODKUzgEfPrYpOG3JRQqwJv9f3P63Z/p/O7iHHCuuVbndna
	+qVb8V6A==;
Received: from ip6-localhost ([::1]:30840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pHsOT-000M52-Gg; Tue, 17 Jan 2023 20:17:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48068) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pHsON-000M4t-KS
 for samba-technical@lists.samba.org; Tue, 17 Jan 2023 20:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=G7BLmrkQRtvynRwcKHFmk8xBwnFMrvOwT9MK6Rol/LU=; b=OZ+AuCEH19JXO/d18O6p/yhjaa
 D7reWTEdcLDoIWp8SDmNeGubalELRuawiHESD5iYbM0Cc317W6i0Jdsbg472ciGADVc7GFEcqZH2T
 DPSNSPiguiSbXiMQwx3NZteQKQLy/sQOegkdmXd3/lULEzaZlnYZPxJK/L2JFlqtgRZp7qDyGlhsY
 I35DuSz7fTMWluTIa3St7nw+kzhlw5YnYOrz5oftcmmz1KSTSKAIKoeuFYeQMsj8H+yCo8daebrax
 gZ5vSrb3ocqyeTLO+ULJQqcdooDsQB3DNzXXhLQYbtyaTVa4m98yxb8ZzZ3c3waBDD9oIwVr+EVHq
 lnONHhbR19I60vweRQEqdITF0xKE6Ojo2x2jEuJqQQZ6ydEvFB3vVNPmkDYUJzheBy4WSVROChKjD
 UisVuiZzAk6YnrkE/+0ZxnjaqIqOtM9SmMSRwiVh8q+YdeH/FQo/lLZRzWGtSXCMojUHdP+re2v5g
 6Odi44snlTEMZ7HYUwhOqGz0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pHsOL-008phV-Im; Tue, 17 Jan 2023 20:17:09 +0000
Date: Tue, 17 Jan 2023 12:17:06 -0800
To: Ralph Boehme <slow@samba.org>
Subject: Re: dbwrap_py: rapid dbwrap backend prototyping and FoundationDB
Message-ID: <Y8cCQmnpnLi91qvk@jeremy-acer>
References: <1f68b352-130d-8a6d-52b6-2f7689fe92b6@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1f68b352-130d-8a6d-52b6-2f7689fe92b6@samba.org>
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 gd <gd@samba.org>, Samba-Technical <samba-technical@lists.samba.org>,
 Samuel Cabrero <scabrero@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 17, 2023 at 03:33:42PM +0100, Ralph Boehme wrote:
>Hi!
>
>I've hacked a new dbwrap backend called dbwrap_py that calls into 
>Python for the database operations. This came out of the desire to 
>play around with the many available distributed database that are 
>available these days, eg Cassandra, etcd, FoundationDB and so on [1]. 
>All of them have Python bindings and implementing the required 
>primitives in Python is much simpler then doing it in C.
>
>I've developed dbwrap_py hand in hand with an initial backend 
>targetting FoundationDB which is a scalable, high-performance 
>key-value store with strong consistency and transaction support
>
>Thanks to the transaction support in FoundationDB it is possible to 
>implement locking using a dedicated locking record per record combined 
>with a fencing token that guards modfying database operations. Other 
>databases may offer other primitives to implement record locking.
>
>The whole thing is now functional enough such that it passes certain 
>torture tests when configured to put locking.tdb and 
>smbXsrv_open_global.tdb behind dbwrap_py.
>
>Currently the whole dbwrap layering runs unchanged on top of the 
>backend. As locking is implemented in the backend and FoundationDB 
>support watches, it would be possible to not use the current g_lock 
>and dbwrap_watch backend for dbs enabled for FoundationDB.
>
>With metze's new smb2.bench.path-contention-shared benchmark I'm 
>getting 25 opens/closes per second on my laptop with FoundationDB 
>being a single node cluster running on the laptop as well:
>
>$ bin/smbtorture //localhost/test -U slow%Passw0rd 
>smb2.bench.path-contention-shared
>...
>Opened 4 connections with qdepth=1 => 4 loops
>Running for 10 seconds
>...
>open[num/s=25,avslat=0.019662,minlat=0.000000,maxlat=0.028768] 
>close[num/s=25,avslat=0.019845,minlat=0.000000,maxlat=0.034462]
>
>$ bin/smbtorture3 //localhost/test -U slow%Passw0rd LOCAL-DBWRAP-PY
>...
>dbwrap_fetch_locked() took: 2799 us
>dbwrap_record_store() took: 4205 us
>dbwrap_exists() took: 364 us
>dbwrap_parse_record() took: 3571 us
>dbwrap_do_locked() took: 5552 us
>...
>
>The code is here:
><https://git.samba.org/?p=slow/samba.git;a=shortlog;h=refs/heads/dbwrap_py>
>
>Config:
>
>    dbwrap_py:module = samba.samba3.dbwrap_py_fdb
>    dbwrap_py:locking.tdb = yes
>    dbwrap_py:smbXsrv_open_global.tdb = yes
>    dbwrap_py:test_db_py.tdb = yes
>
>FoundationDB would be a good candidate for a public cloud SMB frontend 
>ala Azure SMB, this is not aiming at the ctdb high performance SMB NAS 
>usecase.
>
>I'll try to get a small FoundationDB cluster setup in K8 to see how 
>that feels like. Stay tune... ;)

Great work Ralph ! I'm looking forward to playing with this.

Jeremy.

