Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B046199CF8
	for <lists+samba-technical@lfdr.de>; Tue, 31 Mar 2020 19:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=G8hJ4UVyWJPf6ZxATm4trC9WHG4qmKsL0tFE0r/Rh2I=; b=F/9a+zESQZkYXEdeGTMQoYxLCD
	9rO4+LWelJonPBmjtu9cWAjYVlNnvSntuYNmODUNZPludhNmSYYkuuXBSWgx4lFOLKxbrZ1+RNVgB
	1KP8XYehSrirZxPQD275a2ItQ4wGuwT23/nnrd+cPAnqi3DnXhR02F1CXhMPACc7NzIMrZZprYi9p
	7P1JZYotXgA3ZbEGxCeNxWqVazaXMc6NvPUj1CGuxQa8PykBM9f0eIgySayC4BZGN+BhMx8FOPNug
	qHQO/WnSu3Fu1TDuUUWY2QvkGT344xKbVjY6J0ZPEleT2Gr5ddval5V9ECSS+M2xUGCztx7lqRVgL
	kTSZpogw==;
Received: from localhost ([::1]:50412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJKmh-001C6h-7x; Tue, 31 Mar 2020 17:34:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJKmb-001C6a-E9
 for samba-technical@lists.samba.org; Tue, 31 Mar 2020 17:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=G8hJ4UVyWJPf6ZxATm4trC9WHG4qmKsL0tFE0r/Rh2I=; b=tdcGVsthkkW7lK54p/j8iQL7SN
 jzSWEreEJlMg8zn1vP42iuskz6e8Nzt8Aa3mt5QYQNuEiuJZV9sMT0JaWrKb0TxUR7FFUrVjgsCe7
 6fBDcTDS99anPFvBJWsEI5uu5hPzrSn4Oo2Es2Lr1nHX/o/IWfCCRYn+DYScCxky/RT905bP+gDvn
 2E/GM7IAT8MBb5cSgKrqDbDAY1X779WiXaqy3bJXsc6HGe1zljXwODxGFjVR2VvpKZNNYq1lXn1bP
 +EfhXsNp+5h5Ie12x75So/7dp6yW7H0M8LcOrjjwQe3HtsTy6utRZ/blnMdgronH6wRto3bHhZkZ6
 qHRB0FiCWDKGgsHmu/Wp1JGr2ecMe8nutoQO7LZ7X7bnI/7cbOfffOH3Z+GF3OQMsoqCxNi6SJJGe
 xKGqmFFt96xGKcJVzhnuyCJIl8JIY8YaTCNqJ+3F/3HluAr02cGztDKBsrxESmYt/9cUTuwQm1lmN
 88bhGpHf+pvoSdWtMH/FqMMz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJKmY-0007hJ-H5; Tue, 31 Mar 2020 17:34:34 +0000
Date: Tue, 31 Mar 2020 10:34:28 -0700
To: dongleilei <ssdl.566@163.com>
Subject: Re: problem about smbd_smb2_flush_send_queue
Message-ID: <20200331173428.GC13958@jeremy-acer>
References: <3d2ae9a3.3208.1712eaf2c90.Coremail.ssdl.566@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d2ae9a3.3208.1712eaf2c90.Coremail.ssdl.566@163.com>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Mar 31, 2020 at 11:42:44AM +0800, dongleilei wrote:
> Hi all:
>           I encountered a problem recently. 
>           when i copy files from samba share to windows client,  the copy process suddenly hung up waiting for response from samba ser
>           when i debug smbd process, i found the program enter here.
> 
> 
> in source3/smbd/smb2_server  smbd_smb2_flush_send_queue
> 
> 
>  ok = iov_advance(&e->vector, &e->count, ret);
> if (!ok) {
> return NT_STATUS_INTERNAL_ERROR;
> }
> 
> 
> if (e->count > 0) {
> /* we have more to write */                                enter here
> TEVENT_FD_WRITEABLE(xconn->transport.fde);
> return NT_STATUS_OK;
> }
> 
> 
> -----
> my question is : is there any way for smbd to resend the remaining data?
>                            why my client hung up for a long time?
> 

TEVENT_FD_WRITEABLE should be setting the outgoing fd as
ready to write out more data, and so the next trip through
the main event loop it should send more data.

What platform are you running on ?

