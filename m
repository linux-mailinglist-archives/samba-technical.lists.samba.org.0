Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B528E25
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 02:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=alg/N+wPV7pGBbQZwEk6O9tV/y0l69NPigis0oeJWr4=; b=mxwRgEd5QFB+TO55cKuyiEIzk2
	Os7Gqa9S/k8Zow47I0tJwteCm+YlKDXnS3z6VKjn0B24I0RuGaN9HYWFSqvGHgFcFeUTYnraleBhr
	VC01xeQi+kZH+BG9aLjXk5zA9alsMDwkq97sjFQxNBMnM8CsdxCL6PAWQh2b6GDGEBMJrOeD0FYyL
	wA8mZBDDJfPCGGPvXf4gzOt4nM7iVcrU2Q/P+WqrqWrFgk6+LGBBEP20tMfrsQOw6y56y7fIzudaS
	kIkEzYlSDrxqmFf9ICAgkulpdgi+/ov3tB8GtK9ou3AdYcKd/cmCWyVXV9hAcMD5KgpDjcsNBnSWH
	K/IjZC3w==;
Received: from localhost ([::1]:28784 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hTxh3-001VsM-J5; Fri, 24 May 2019 00:04:17 +0000
Received: from [2a01:4f8:192:486::147:1] (port=18238 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hTxgz-001VsF-Ia
 for samba-technical@lists.samba.org; Fri, 24 May 2019 00:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=alg/N+wPV7pGBbQZwEk6O9tV/y0l69NPigis0oeJWr4=; b=PBFcSCYYDy3PwQk6iJBOlAabWu
 V92gxjYyWC7pARLueIAqutlnlbrz9HV7AgU7ppJQVzMViDn9CneppV0TfsOpb3Ft0P6nm4+uLIK6f
 z9kZEqnqLsZ0F0GM/7G6/J355PkcDfhdO0OSHjJbJHPmyKABbUrDxLEarUcyaRADWDE4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hTxgt-0004bF-Ba; Fri, 24 May 2019 00:04:07 +0000
Date: Thu, 23 May 2019 17:04:05 -0700
To: Shyam Rathi <shyam.rathi@nutanix.com>
Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Message-ID: <20190524000405.GJ244578@jra4>
References: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, May 19, 2019 at 02:46:29AM +0000, Shyam Rathi via samba-technical wrote:
> Hello,
> 
> At present, SIGHUP is blocked on notifyd. So, if parent smbd
> is started with "log level" 10 in smb.conf, and later changed
> to 0, the SIGHUP will not change the log level to 0 in notify
> smbd process and it will keep printing verbose logs in the
> corresponding log files.
> 
> Proposed fix is to write a SIGHUP handler for notifyd and set
> it to reload services.
> 
> 
> Please review the attached patch for suggestions and comments.

Hi Shyamsunder,

A few comments.

In notifyd_sig_hup_handler().

+       DEBUG(2,("notifyd: Reloading services after SIGHUP\n"));

	^^^^
	Please use either the DBG_WARNING or DBG_NOTICE macros
	to ensure consistency in new debug info levels.

+       become_root();
+       reload_services(NULL, NULL, false);
+       unbecome_root();

	^^^^^^^

Does notifyd need become_root()/unbecome_root()
pairs ? Isn't it always invoked when smbd is root
and stays as such ?

The rest of this looks fine ! Thanks a *lot*
for your help.

Jeremy.

