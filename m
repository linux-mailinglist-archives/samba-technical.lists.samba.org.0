Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C03D7097
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jul 2021 09:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=po6dx/zMfqketIcAJzSqpYK9vlDl/2qunzjcXL+bfr8=; b=YExmPFEF9RZRJwLaafm6rbWf+v
	8l4Mbsh+VsRy0M4LoAZZJQd6SnD7m4ep95rDK9goTjmttSr4zQdSQIq6+qvEsHq9nKR9x11TBT5zS
	fBS5X+I1BHnQ1dibb2+eNbtXb37dwr/NotCXUcb8gMAe3NqMSKxin+yZrqtY4ETqMXATlXLX6ZZ03
	lLHkCkJiBsdFYAbnXN0l8ofs2TpfjRboa9JxGO8JH5BjXoo3ZeD3aEcTFqskgmqkUaCF7zIMieWSn
	GaYMT42dpn2GEBBJcThh2YtXYRUhlqHuHczBAbZ0jBtYQ0P+a0X7l0SEYbr1tvKYoRJYXYPfAteoq
	1J3lyJRg==;
Received: from ip6-localhost ([::1]:25146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8HqM-00145t-C1; Tue, 27 Jul 2021 07:49:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22482) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8HqG-00145j-V9
 for samba-technical@lists.samba.org; Tue, 27 Jul 2021 07:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=po6dx/zMfqketIcAJzSqpYK9vlDl/2qunzjcXL+bfr8=; b=0mQM5swGbYQOnz2zrkdh5heZUh
 PBK/MDYLh+4rEnyf24VhR2nO4nd7Uvkvp+y53lKFR+N7FX9LSfj37Z7QMLaphUH5EISsXLkojw3eX
 gHoN81alM1h7PjSF1RxXZuY/aHBojbZeTnMzj4dHiGDCJSDgr7UF4/Qf3efsr0sHW5tLLemi0jSYJ
 Kdkju/kgXTaenZmTdgMS8meSaAUG289cLjJjYfLj/itRgyGajXJclpgKsxPq8QDolLr3KBBKa0IDC
 MG4MbGuelfhUJbdEEMFOw7XvJg9si76sONpceudU18/mUSlkwFBw0q/z6MYFUnoFOINlcZBzV/bCW
 XPlYlfGrbM2DPfOVFNy1z+tsbxy+elmFHTKcyrs5W+6bec0if9aZzNnF8WKQmJ3nzrvw95LVx0vRu
 L9iMhlxvug+R4oy2iZFrCSvGUbNlKn2yHANeX27RMSPT5DXyVb18WX+oa91IKVIMZbp4/Lp1X76xu
 UWozTz4iEXSooIwyNFBL3KLG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8HqG-0006eN-31; Tue, 27 Jul 2021 07:49:32 +0000
Message-ID: <5960b230b312bfbe898b1c9e21140af76135b6c3.camel@samba.org>
Subject: Re: Is "acl_xattr:ignore system acl = yes" recommended?
To: Uri Simchoni <uri@samba.org>, miguel medalha <medalist@sapo.pt>, 
 samba-technical <samba-technical@lists.samba.org>
Date: Tue, 27 Jul 2021 08:49:31 +0100
In-Reply-To: <bac38c9b-31ce-a544-e541-ddfc8edd10ad@samba.org>
References: <5d214a265708c2062855bcf31550416c5183089d.camel@samba.org>
 <201468d0-47c0-1a5a-efdf-7206e70f7e8b@samba.org>
 <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAAGkqX8XX4T5Mg4ytd667iVsBAAAAAA==@sapo.pt>
 <bac38c9b-31ce-a544-e541-ddfc8edd10ad@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-07-27 at 10:30 +0300, Uri Simchoni via samba-technical
wrote:
> On 7/27/21 9:31 AM, miguel medalha wrote:
> > Dear Uri
> > 
> > Does Samba have root access? If so, wouldn't it be possible, when
> > using "acl_xattr:ignore_system_acls = yes", to set permissions to
> > root:root and 600/700 instead of 666/777 and let Samba do the
> > translation and authorize access based only on what is set on the
> > "security.NTACL" extended attribute?
> > 
> > Best regards
> > Miguel Medalha
> > 
> > 
> 
> (adding the list)
> 
> To guarantee a specific unix owner for files in a folder exclusively 
> accessed by smbd (thereby getting the kernel out of the way or 
> implementing folder quota), the following scheme could be used:
> 1. set the desired owner on the (empty) root of the folder
> 2. set "inherit owner = unix only"
> 3. set acl_xattr:ignore_system_acls = true
> 
> regarding 0666/0777, I'm afraid that's enforced by the acl_xattr
> module 
> if ignore_system_acls is set.

Yes, but it very probably shouldn't be, if something says 'ignore
system acls' and if set to 'yes' (please stop using 'true' and 'false',
'yes' and 'no' are a lot clearer) it should do just that, 'ignore' the
system acls, not set them to something else.

The problem would be if vfs_acl_xattr is used on a standalone server,
in which case 'ignore system acls' should be hardcoded to 'no', even if
set to 'yes' in smb.conf

Rowland 




