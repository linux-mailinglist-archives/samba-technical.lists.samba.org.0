Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B12439C1B
	for <lists+samba-technical@lfdr.de>; Mon, 25 Oct 2021 18:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=V/xpWN2nQxrYEhxHVHKod/RwnLey/zQVAXxtB4rp3OQ=; b=bwdJ9zOw3CSLrk/u69LN1L98BC
	ShypbmsoAb8RIMeQ5SyPsWfzn+5IbwkEpu1Disyr5ocTqaSVsCBZzWtwfVJFuVDF9cE5yxbnfKCrF
	QnuCzvbSPo5SLwwzqKbSjhsp1PYIVm0bvsB2gSIRZ6CuVO3S8MHXmG/pl0DhZgZfwh3lQHAMMdGOZ
	V4GNdhpNpNfZR3VLZ1+n1JVp+KxsLSsCLxiyjq5d65GMGPHDgPfWXMGhHEdT+VZpL17A0WLUfHJ8m
	SA7vO4jgOF7DrUnp0u0MGCPrnt0EKd20ZaIKXAN4HiuaXWZ/a+zE1y0xHaJ3N3yKzKJ+dNgEpRFr4
	7vJrZz3w==;
Received: from ip6-localhost ([::1]:21830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mf3C8-00Ci3l-A4; Mon, 25 Oct 2021 16:51:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56690) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mf3C3-00Ci3T-B9
 for samba-technical@lists.samba.org; Mon, 25 Oct 2021 16:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=V/xpWN2nQxrYEhxHVHKod/RwnLey/zQVAXxtB4rp3OQ=; b=KgVoWQ0m9opZI6fq5XGfRLnSXr
 pKKzEcZehjgdjLmIaqmPuickERLsw+no0umPuqBa/qRWkuRGeWnPOLQ5vCNX06lYagu/jjt2q9+Cd
 LO+nz+lyi8bmOP3siz0azyYsH9SCpWrtObksPCKF8/+qEe+6dGq8HKGe1t6nAinfalHtTwGepAJIa
 7kEiIhKh41QqcuhELgDlw2oUPU+xc0McAl0v47nvlgQYO//gKDsrvzOVjOPS93hIyWDIw/ghSfPpy
 uGSe3Slj7PhB7yTU9zgSTC7J6JKrw8x7q8tk5xTb+J4kX/adgQZjG1UqxCKs5vHKZbl7OLNgtN97S
 wReQXhIoZUH+6gKoOJ9KGrbbZsWkMFcxrwh20/leL6nCMawAxCU+vZnut+263Xi/7ewuj1XIdgHlu
 lbW30hJ2Rpi1v39iPg/+jyJQCr1W/CA8VVExenO5redFlCCs//U1GrfbKhE1cD4yiuPpFJHvJYIIC
 Gj+NqoyhOB3Q5rK5Hv7mb6ia;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mf3C2-0038U0-0v; Mon, 25 Oct 2021 16:51:26 +0000
Date: Mon, 25 Oct 2021 09:51:23 -0700
To: Pavel Filipensky <pfilipen@redhat.com>
Subject: Re: directory with a symlink pointing to non-existing file
Message-ID: <YXbgiyTKKU15KUzL@jeremy-acer>
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
 <YXGyEPiGNwaXyPln@jeremy-acer> <YXG0WUXsDFpmFVZr@jeremy-acer>
 <CAEcb10sPbR1eDzQCyGt4c7A12MTPhf7QTmR_R5oDnMDvMOJTJQ@mail.gmail.com>
 <YXbcnQJl78LG9txV@jeremy-acer>
 <CAEcb10twxsCBi-jno5V0fh5c6ubZ307tOKPEjDOcueCs=7-Tag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEcb10twxsCBi-jno5V0fh5c6ubZ307tOKPEjDOcueCs=7-Tag@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 25, 2021 at 06:50:08PM +0200, Pavel Filipensky wrote:
>I was not aware of xatrr_tdb, thx for pointing that out. I do not care
>about config with xattr_tdb, it was more or less a coincidence.
>
>However, it does not work with "fileserver" environment for me. What
>exactly is your regression test doing?
>
>some grep for "fileserver" environment :
>
>$ grep test1 st/fileserver/logs/log.smbd
>
>  synthetic_pathref: stat [test1/l2] failed: No such file or directory
>  streams_depot_stat called for [test1/l2]
>  streams_depot_stat called for [test1]
>  streams_depot_rmdir_internal: called for test1
>  rmdir_acl_common: unlink of test1 failed Directory not empty
>  rmdir_internals: couldn't remove directory test1 : Directory not empty
>  close_directory: test1. Delete on close was set - deleting directory
>returned NT_STATUS_DIRECTORY_NOT_EMPTY.
>  smbd_smb2_close: close_file[test1]: NT_STATUS_DIRECTORY_NOT_EMPTY

I'm still working on it Pavel, can you give me a day or so :-).

Code's not quite right yet..

I'll point you at the ci when I'm done.

