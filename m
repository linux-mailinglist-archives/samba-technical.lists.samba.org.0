Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 607051D29BB
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 10:10:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=qWN71YVpFBbRZZK5or9/NlgUnMDm8sVei0Z+IGMohc0=; b=t77mbcdMz9/JFioP1lecuDm0TB
	K75S//ozwy8eWtIuK040ggX27GL5qPXjokgBcs1uNJjz/k/mU6KLYRAyaYVgx3lE/3V1CfWN65/3X
	TjtD5mdMr/eG3Y1vtNdkQDSIpjtGRAhNqDCbwvinPIId61mYya74reR4rtFRJGsF0EBReEBqghjlw
	/sTgJzAjvQO8qszfxg++NpjxbP4eJcKMzpOeO7ic2h5pGsWeGjy9fzk8Y0YMguiTP+krp4Arqq+JB
	jGAP8CGFqZ1ttsJoMlrhE/kbT2HAmGHpNrz7R6CGiFUaF9kfiaPfbA1V/EZgFHwu2NrwK073j2E/j
	keGQXCiQ==;
Received: from localhost ([::1]:58752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZ8we-004ISN-LF; Thu, 14 May 2020 08:10:20 +0000
Received: from latitanza.investici.org ([2001:888:2000:56::19]:26765) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ8wa-004ISG-71
 for samba-technical@lists.samba.org; Thu, 14 May 2020 08:10:18 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 2003012018F;
 Thu, 14 May 2020 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1589443813;
 bh=qWN71YVpFBbRZZK5or9/NlgUnMDm8sVei0Z+IGMohc0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=VcUIYShbzNFU5SnWM2jLb+cdHHM6t00+2Dw1u7EFinV2cDfMfIlxirZFtt/lDSORm
 XMm/sRW4ZxQ9LUtXfGQzZVixGK6MPiTholDMwJ1WzxiZ8Q3o3Qd4JN3RyOBXWNW6O0
 1WgmkCrZiuukdwqCzVYMbCBp3tKz3BW7QKbHLeBY=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id EAA4D121645; Thu, 14 May 2020 08:10:10 +0000 (UTC)
Message-ID: <edbc6471b5cfbeae515111411ea5f0e49228f5b7.camel@cryptolab.net>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
To: Jeremy Allison <jra@samba.org>
Date: Thu, 14 May 2020 13:40:06 +0530
In-Reply-To: <20200514005508.GA21149@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer> <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer> <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-05-13 at 17:55 -0700, Jeremy Allison via samba-technical
wrote:
> On Thu, May 14, 2020 at 01:36:12AM +0200, Michael Adam wrote:
> > Right, and this is done unconditionally in open_file_ntcreate(),
> > I mean without checking lp_store_dos_attributes() first. So the
> > manpage is clearly wrong. store-dos-attributes disables none of
> > the map options. We only see the effect for map archive since
> > the other three default to "no" anyway...
> 
> Yep.
> 
> > What I am wondering is this:
> > If the file is created with SEC_RIGHTS_FILE_ALL, shouldn't it
> > get execute permissions, even if "map archive = no"?
> > After all, "map archive = no" does not prevent execute from
> > being set, it just doesn't set it because of archive...
> 
> No. SEC_RIGHTS_FILE_ALL is only to do with the access permissions
> on the handle, not the permissions on the file.

But what if file does not exist and is being created? Consider
smb2.read.position where it starts with an already existing file. If we
remove the file prior to executing this sub-test, it passes even with
"map archive = no"(of course without execute bit set). What does that
mean?

> > And this should be true without vfs_acl_xattr, but afaict also
> > with the module, when system_acls are not ignored (i.e. when the
> > acls are still mapped to posix acls).
> > 
> > So I am missing the piece where the actual desired permissions
> > from the create call are factored into the resulting unix
> > permissoins.
> 
> It's just passed down directly from the mode bits that
> are created in open_file_ntcreate().
> 
> 	open_file_ntcreate()
> 		mode_t unx_mode = unix_mode(conn, new_dos_attributes |
> FILE_ATTRIBUTE_ARCHIVE,
>                                      smb_fname, parent_dir_fname);
> 
> 		-> open_file(..., unx_mode, ...)
> 			-> fd_open_atomic(..., unx_mode, ...)
> 				-> fd_open(..., unx_mode, ...)
> 					-> non_widelink_open(...,
> unx_mode, ...)
> 						-> SMB_VFS_OPEN(...,
> unx_mode, ...)
> 							-> open(name,
> flags, unx_mode)
> 
> 
> > Well, at least the manpage describes some original intentions
> > as it seems. The current behavior is at least surprising when
> > the man page text is taken into account.
> 
> Yep. The man page is wrong here.
> 
> > Of course, thanks!
> > 
> > Two questions remain:
> > 
> > - Should we implement the behavior stated in the manpage?
> >   (I think yes!)
> 
> Hmmmm. Maybe. Be careful of changing things here,
> it may not be what users expect.
> 
> > - Why is the x-bit not set when SEC_FILE_ALL is requested in
> > create?
> 
> 'cos SEC_FILE_ALL is bugger all to do with on-disk
> file permissions. That's a handle access mode (think
> fd, not file). You have to set a security descriptor for that.
> 
> Remember there's no atomic open_with_posix_acl() call
> in POSIX. So you get what is inherited from the parent
> directory (if it's set up that way). Samba then overlays
> (non-atomically, as there's no other way in POSIX) and
> security descriptor set on the file after it's created.
> 
> Jeremy.
> 


