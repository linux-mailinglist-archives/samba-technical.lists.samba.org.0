Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEDB03469
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jul 2025 04:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=u4xAOrjJsEgpy6ml38zdXtcLvqce4DROPwTsxza3Af0=; b=gxbovuri7WWf5s1mV3bgm6f7cB
	B0o82dnmlILlxVdaSECP2ED0sWbirYwvpcvXsyK7vE7kMc5dPMBw0tjrmyVuM+1D1ufFGrCS8C9M4
	Ox/bBpNsR7M/QVPp7+MytNG19Ou7xqiPibGklwrREy/RIwPIgIzL3zzqfhaRKjJjl7X8sg23/vVJ0
	0GVKizkhxEdzuOlx5fXupAEXuG+jGg5eKfvH0j7faz82m4azd//fRWMvJVyHU4zIWC6mChayKlYuQ
	XAIGxe1Eh6xKrgmEYo5Nh+SJ3uhj4MPNEDO4QBwgEcMMmViSMV4jugOGODAnqmPWCJp9jXP0H6gq/
	Ddg8V58A==;
Received: from ip6-localhost ([::1]:56246 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ub8m6-00B6CO-Qy; Mon, 14 Jul 2025 02:18:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26912) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ub8m2-00B6CH-CN
 for samba-technical@lists.samba.org; Mon, 14 Jul 2025 02:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=u4xAOrjJsEgpy6ml38zdXtcLvqce4DROPwTsxza3Af0=; b=zq29DxmzuMc2ZW1km77k33zboW
 eIu5A8GER4F9RdqqCcKBgaaIlGCbyQA4ZGRfh3HMSrBitHl1t+NHPSVJ589pE/3IvGCbCRSJ3/kQS
 IV1MDYkoPlBERCsT0G4J8qfG37ugwJkceibJfFcAYlOMxX6Ce5cL3IGwrwkIRojqZY04KY3erCwZE
 M65mGhLtarm1juQGxRGx+L4rV/rTMR0Idu5gVcojH1yk+tMrswigL1E0MRz7maH4Zkkoi5Icxoobn
 A7wpeA/w4XVe/aBOg57arQSDpcVWtkvChZysqyZgRbat/syrf9xSuHUDkCfHdoQOBeGkxC597G0iI
 SIH/1ymnFwRJG28jDL05jRhwMXKiu8DfKVvpDj0XAFJGJfbEV81htyf6qjkWyZTeYe/dFhq3sLjQB
 /b3t3//vrouxzfB0+aynuBTTd+ZIXF+h4hb6+GhUM99+ZlVSYWU/BNP68Fh+mBmoSk7Chg3U91uJS
 SGlXfzJpyiCmj4lqEV/KCLZd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ub8m0-00FFNf-37; Mon, 14 Jul 2025 02:18:33 +0000
Date: Sun, 13 Jul 2025 19:18:29 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: Samba support for creating special files (via reparse points)
Message-ID: <aHRo9VfMDIfK5MR6@jeremy-HP-Z840-Workstation>
References: <CAH2r5muQGDkaHL78JOcgsfjL_=A64Xm9CrCBSKgOMABOjcg44w@mail.gmail.com>
 <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5msdLbvGMARXJ=V9wt0pvXJOrc=zh3eUfeF9AXEeshtByg@mail.gmail.com>
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
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Paulo Alcantara <pc@manguebit.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Jul 13, 2025 at 06:05:27PM -0500, Steve French wrote:
>It does look like a change in behavior on the client as well (the
>client didn't used to enforce the server correctly setting this flag)
>- see below, but it is tricky, because without the check on the client
>for that capability flag a server could end up with unusable empty
>file on the server if it actually didn't support reparse points.
>
>What is strange is that when I comment out the checks for
>FILE_SUPPORTS_REPARSE_POINTS on the client, Samba does seem to allow
>creating special files via reparse points, it just doesn't properly
>advertise that.

Currently this is only set in one VFS module:

source3/modules/vfs_tsmsm.c:    return SMB_VFS_NEXT_FS_CAPABILITIES(handle, p_ts_res) | FILE_SUPPORTS_REMOTE_STORAGE | FILE_SUPPORTS_REPARSE_POINTS;

Now support has been added more generally I think
this needs to be added into the vfs_default.c
generic return.

It's an oversight I'm afraid.

