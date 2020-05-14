Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2126C1D245B
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 02:56:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gLfVPEbiCGrD2TBLPeQvcnVBwd2X2ZxFI5XMbv3Qi2c=; b=wE5atmC/jIyfEGbWq+7i7kOMXp
	6xbdP8BC8IzmHvzuMzYNJMKCDEGNXd/fyUNTKyR5+5Yu7wU2LcEEaFOQ98P0aw+0GMmDS1DzX3YCc
	tKUPqqvCDU1aldha4tUnMUw7zWST8a8gymAojaeW4FrTNvGb096v6+Uf+CqCLENvM0tR+f2NXrGTu
	B2OC9/4zbLP8kRVzy+wHS4pDAls+wEOx4XXl2jYAYtEqdln8A0NN266Qj6JIZqlfcw/+Ja7rCFkAt
	KFZ7LwLvMNewKkdDzdyEMwJN+xJUO0hKkbQ16fQV35GzVdokLYCl4AMr9jkB7oMhYE0Z7WKCgbpLM
	4Fqs3K9Q==;
Received: from localhost ([::1]:55672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZ29h-004H9K-Sl; Thu, 14 May 2020 00:55:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ29c-004H9D-HY
 for samba-technical@lists.samba.org; Thu, 14 May 2020 00:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=gLfVPEbiCGrD2TBLPeQvcnVBwd2X2ZxFI5XMbv3Qi2c=; b=aIilghuIQabo8uaylofHZUqq/G
 dG9F9nIDe6LiF4yzxyDhV4lvvXRT9/fEiCaJzZYqZNUrNCLwUmKBLj1J4IBNk2tgYzgb9BpR/2miU
 G4cLn1sditortPJbYprRlE4Bfl3f2zLlc2uUIzg/dm62Xx0g7fvTrWh8GENvl9bIffaY0DBm5M4MU
 9SB3F6sdAjgwfqRY4PHqIlL2PDmLgXLZTl0owT4swIgTG0nloUJa7DBgjfZPjek1Hj3Ob4funuKuP
 iltlVxKBFBdw5OTnvYrqfd4KLUt00/XGB/hqTRkxIuUUoeDp9RUpuDPRZ1xzLchgJVtUChwCP4yWG
 h0zo+K98gLN9X/YgwfbtlORDDDuLXcnO0uCUuvWkkJqsJ93ybnchMlM3hMmNPCBXNU6lxQ7ftjIwi
 l4OwsB0pkmfWAewzXTrOjyasPJ2cx2v8Z8XaOTzst78iBtAGYH/G9C1tDErXlh+XNlQUocBNMUBNa
 LVQ80sBh3DQ6Q+MbNaHR3TY/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZ29a-0005YS-Do; Thu, 14 May 2020 00:55:14 +0000
Date: Wed, 13 May 2020 17:55:08 -0700
To: Michael Adam <obnox@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200514005508.GA21149@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513233612.GB7185@samba.org>
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 14, 2020 at 01:36:12AM +0200, Michael Adam wrote:
> 
> Right, and this is done unconditionally in open_file_ntcreate(),
> I mean without checking lp_store_dos_attributes() first. So the
> manpage is clearly wrong. store-dos-attributes disables none of
> the map options. We only see the effect for map archive since
> the other three default to "no" anyway...

Yep.

> What I am wondering is this:
> If the file is created with SEC_RIGHTS_FILE_ALL, shouldn't it
> get execute permissions, even if "map archive = no"?
> After all, "map archive = no" does not prevent execute from
> being set, it just doesn't set it because of archive...

No. SEC_RIGHTS_FILE_ALL is only to do with the access permissions
on the handle, not the permissions on the file.

> And this should be true without vfs_acl_xattr, but afaict also
> with the module, when system_acls are not ignored (i.e. when the
> acls are still mapped to posix acls).
> 
> So I am missing the piece where the actual desired permissions
> from the create call are factored into the resulting unix
> permissoins.

It's just passed down directly from the mode bits that
are created in open_file_ntcreate().

	open_file_ntcreate()
		mode_t unx_mode = unix_mode(conn, new_dos_attributes | FILE_ATTRIBUTE_ARCHIVE,
                                     smb_fname, parent_dir_fname);

		-> open_file(..., unx_mode, ...)
			-> fd_open_atomic(..., unx_mode, ...)
				-> fd_open(..., unx_mode, ...)
					-> non_widelink_open(..., unx_mode, ...)
						-> SMB_VFS_OPEN(..., unx_mode, ...)
							-> open(name, flags, unx_mode)


> Well, at least the manpage describes some original intentions
> as it seems. The current behavior is at least surprising when
> the man page text is taken into account.

Yep. The man page is wrong here.

> Of course, thanks!
> 
> Two questions remain:
> 
> - Should we implement the behavior stated in the manpage?
>   (I think yes!)

Hmmmm. Maybe. Be careful of changing things here,
it may not be what users expect.

> - Why is the x-bit not set when SEC_FILE_ALL is requested in create?

'cos SEC_FILE_ALL is bugger all to do with on-disk
file permissions. That's a handle access mode (think
fd, not file). You have to set a security descriptor for that.

Remember there's no atomic open_with_posix_acl() call
in POSIX. So you get what is inherited from the parent
directory (if it's set up that way). Samba then overlays
(non-atomically, as there's no other way in POSIX) and
security descriptor set on the file after it's created.

Jeremy.

