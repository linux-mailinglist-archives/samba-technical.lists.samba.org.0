Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFAF439D38
	for <lists+samba-technical@lfdr.de>; Mon, 25 Oct 2021 19:15:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=O1qFBl0J8JAImLr5hlUllA3fK+QJa4devve4V4JbPgA=; b=TlwP+LrSyCIHCM1ls/K1jxaBPM
	aehr6EcxbiKqtKBAGIIYWujD8/06kvp4pd+LCC48ECG1kfUhenHGEmfpt1oL/bBb27hVNpMapoWwq
	GKEsFxGBAH/CleFtTQpSXO1LUFwK2qRGVr32Tun+EJnzzIW6ydGYuGx6nioawjo8bHLfLbhqtPT5V
	UYpOTwOq7Sr4utbRxdaWXRFwDe9tqzYiAOJYkYl/C5PhVG0UXm2XtSK52K9R+hXpO6ZVKT+R1KOxX
	ehb7VWoJBK05EsUHHOf6ukkdP1R9eMUqYfhrbrhP0laDTwcWhQrGeVg+55wTpfFcgkipnHZ2bOYYF
	w0jPretw==;
Received: from ip6-localhost ([::1]:34454 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mf3Z0-00CnDc-M3; Mon, 25 Oct 2021 17:15:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56696) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mf3Yv-00CnCV-Es
 for samba-technical@lists.samba.org; Mon, 25 Oct 2021 17:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=O1qFBl0J8JAImLr5hlUllA3fK+QJa4devve4V4JbPgA=; b=zroVe40iPNW1xTAJB4pkIx19gx
 W9DHVZPATvNDiE6UaQtjTvJ7qZ5iQiKTDUn8LSF++cEfh6Kg1E6uKHEMCsAK8Ga0GAhWbxDGQJiBw
 V7R7JLTNsDql4Xt2dSvlYi31tNqk5EsQJdlwT9LhKT2B5For97FSIbpIhB43RUpk7UOVitCqWTHMY
 fiLJUiwSZJ3o/NuYuk8nMeoaik+3D9Lty+wn5/+vzHjy3T1+Yoikf2nNFL3pvxQtrKafbTyBUYJFM
 nvlhG1yzEpzCFqsXbIu6N230mEgt8ac+tVqMQbxhi/AgxPgSg/vxmwExiIw2zULE4z21AQDQaI10t
 MbyvlNUVA64aB6t/J7E1U1/HocPKdWX0UQu2xtFXCHdzNnyTogPnG2xHl6GHuzFQRNMADYyDOQWDq
 6jqFg9DSjx+uHRow1e6zQ8reonjrxgpxQAD7v+OhrlpA4orAif5xOIMFLG+XzR3WmumR/j5Tzl0Rh
 8o+JHA9A3qlIx5+zI9/1dQZ+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mf3Yu-0038nK-MO; Mon, 25 Oct 2021 17:15:05 +0000
Date: Mon, 25 Oct 2021 10:15:02 -0700
To: Pavel Filipensky <pfilipen@redhat.com>
Subject: Re: directory with a symlink pointing to non-existing file
Message-ID: <YXbmFp0wcd4Nc//S@jeremy-acer>
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

On Mon, Oct 25, 2021 at 06:50:08PM +0200, Pavel Filipensky via samba-technical wrote:
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

Haha ! I'm hoist by my own petard :-). The "fileserver" environment
is including xattr_tdb in my test. I need to set "vfs objects ="
in my veto_files_delete and veto_files_nodelete shares (as is also
done in many other "fileserver" environment shares) and then
the regression test works.

