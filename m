Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C20BACFC7
	for <lists+samba-technical@lfdr.de>; Tue, 30 Sep 2025 15:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=V1QnCTv/WvKSTbLAFSjlsKxMLGRaz/kQkH3MwGLAb7c=; b=y6WV7/KJelw8AT5fw1s4PJCG/c
	KKnBDmO6AyJ7X+xlTiZN4ITITJyqD24AJYo5xu67LuV0uUi2c5fonsJZdYjV1qT/vKaQhwzwa1E2A
	g2O9rlj+JDHQIB72CBI3wawEBPucylPp/6CbTvFShzXiXjgK961OSBwKPtbFG29fTxRbBgYn06p4R
	msbtISTWdE2nBes26Rb3zLYE+e0kKn37nLrIg8bld7zskLDp8bJy/4y/CAfoL9gtDhMzX2SSBohhJ
	Pq23h9vcxC73cWDxGfG3DUth+0KKdZxg1ovAc+DUcVcnrvqo7ji0R3T2s2u8kSHmR5bmolKJSIJ5W
	W165/93Q==;
Received: from ip6-localhost ([::1]:56042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v3a8g-0053an-CR; Tue, 30 Sep 2025 13:11:30 +0000
Received: from smtp-out1.suse.de ([195.135.223.130]:48226) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v3a8b-0053ag-S2
 for samba-technical@lists.samba.org; Tue, 30 Sep 2025 13:11:28 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE9D5336A2;
 Tue, 30 Sep 2025 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759237873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V1QnCTv/WvKSTbLAFSjlsKxMLGRaz/kQkH3MwGLAb7c=;
 b=vBpGkONog+Do0aLsqxFwHHHSI5ECIQSfhcTULyx+k8FZx5BpsOLOotOnDD+qLU0FgEW8do
 yYFKH3btYueGQiq2wYdcrfuDTI6Ix2F3sfi7KC8ZkWbyAg7TCmHsLkMaN8V3HUZQ/I+7Un
 ncNqGAN7iuvLrgvw42xta2ICIN5y1bY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759237873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V1QnCTv/WvKSTbLAFSjlsKxMLGRaz/kQkH3MwGLAb7c=;
 b=c7JPc9qxk1TEfFOGxRb2TPNqXsAfoXaVZeUWcAxGZJa2c050JQVWHfKUMJmACKY/umgjb0
 Rj5bEzdY4uQLzrCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759237873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V1QnCTv/WvKSTbLAFSjlsKxMLGRaz/kQkH3MwGLAb7c=;
 b=vBpGkONog+Do0aLsqxFwHHHSI5ECIQSfhcTULyx+k8FZx5BpsOLOotOnDD+qLU0FgEW8do
 yYFKH3btYueGQiq2wYdcrfuDTI6Ix2F3sfi7KC8ZkWbyAg7TCmHsLkMaN8V3HUZQ/I+7Un
 ncNqGAN7iuvLrgvw42xta2ICIN5y1bY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759237873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V1QnCTv/WvKSTbLAFSjlsKxMLGRaz/kQkH3MwGLAb7c=;
 b=c7JPc9qxk1TEfFOGxRb2TPNqXsAfoXaVZeUWcAxGZJa2c050JQVWHfKUMJmACKY/umgjb0
 Rj5bEzdY4uQLzrCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 586AF13A3F;
 Tue, 30 Sep 2025 13:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 06PHB/HW22hbPgAAD6G6ig
 (envelope-from <ematsumiya@suse.de>); Tue, 30 Sep 2025 13:11:13 +0000
Date: Tue, 30 Sep 2025 10:11:06 -0300
To: Steve French <smfrench@gmail.com>
Subject: Re: [SMB CLIENT][PATCHES] directory lease debugging and configuration
Message-ID: <aztzqdkslkjs6jjtrxlir65hujpl4euikgaxwq67ulfeoqnitb@wnalncavigju>
References: <CAH2r5muGJTYxfNN9kcnBtX0JaJDeGa6SLiiuMg+zQVkNRjP1Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5muGJTYxfNN9kcnBtX0JaJDeGa6SLiiuMg+zQVkNRjP1Yw@mail.gmail.com>
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_THREE(0.00)[4];
 ARC_NA(0.00)[]; FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]
X-Spam-Flag: NO
X-Spam-Score: -3.80
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
From: Enzo Matsumiya via samba-technical <samba-technical@lists.samba.org>
Reply-To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: CIFS <linux-cifs@vger.kernel.org>, Bharath S M <bharathsm@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve, Bharath,

Sending my review based on the commit messages and the patches applied
manually on my local tree.

Please try sending the patches with git-send-email next time, as it's
much easier to apply and review.  Thanks!

On 09/29, Steve French via samba-technical wrote:
>4 patches from Bharath to improve directory lease handling (see
>attached).  Lightly updated and rebased on current mainline, and
>merged into cifs-2.6.git for-next.  Feedback/review/comments welcome
>
>commit a50843f864205ea4576638cb32321313d9c06e54
>Author: Bharath SM <bharathsm@microsoft.com>
>Date:   Tue Sep 2 14:18:21 2025 +0530
>
>    smb: client: cap smb directory cache memory via module parameter
>
>    The CIFS directory entry cache could grow without a global
>    bound across mounts. Add a module-wide cap to limit memory
>    used by cached dirents and avoid unbounded growth.
>
>    Introduce a new module parameter, dir_cache_max_memory_kb
>    (KB units; 0 = unlimited). When unset and directory caching

"0 = unlimited" should be "0 = ~10% of RAM"

>    is enabled (dir_cache_timeout != 0), default the cap to ~10%
>    of system RAM during module init. The parameter is exposed
>    under: /sys/module/cifs/parameters/dir_cache_max_memory_kb.
>
>    Signed-off-by: Bharath SM <bharathsm@microsoft.com>
>    Signed-off-by: Steve French <stfrench@microsoft.com>

I think this should be a sysfs module parameter, as it assumes users
knows how much memory they'll need beforehand:
- one can't say how many entries are in the shares, or how many shares
   will be mounted
- if they do, they need to calculate (nentries * (sizeof(struct
   cached_dirents) + namelen (of each entry) + 1)), + round up(1024),
   then finally divide by 1024, meaning they'll fallback to using the
   default value

On the default value, I think 10% of RAM is too much for cifs cached
entries.

The max memory value should be module-wide, yes, but equally divided for
each tcon, because I might have an initial not-so-important share that
ends up filling the whole cache, then a more important/accessed one that
will not have the chance to cache entries.

>commit 8e2727c9292125b6373b2a1edf1da59510081251
>Author: Bharath SM <bharathsm@microsoft.com>
>Date:   Mon Sep 29 15:57:46 2025 -0500
>
>    smb: client: account smb directory cache usage and per-tcon totals
>
>    Add lightweight accounting for directory lease cache usage
>    to aid debugging and limiting cache size in future. Track
>    per-directory entry/byte counts and maintain per-tcon
>    aggregates. Also expose the totals in /proc/fs/cifs/open_dirs.
>
>    Signed-off-by: Bharath SM <bharathsm@microsoft.com>
>    Signed-off-by: Steve French <stfrench@microsoft.com>

Since per-tcon usage is the only value accounted for max memory limits,
per-cfid accounting should be wrapped in ifdef CONFIG_CIFS_DEBUG2.

You can decrement the entry/bytes_used in the loop when freeing each
cached_dirent.

>commit 645b07fa68f5f001ad7a457166eac31832f1290b
>Author: Bharath SM <bharathsm@microsoft.com>
>Date:   Tue Sep 2 16:46:03 2025 +0530
>
>    smb: client: show lease state as R/H/W (or NONE) in open_files
>
>    Print the lease/oplock caching state for each open file as a
>    compact string of letters: R (read), H (handle), W (write).
>
>    Signed-off-by: Bharath SM <bharathsm@microsoft.com>
>    Signed-off-by: Steve French <stfrench@microsoft.com>
>
>commit cfcf4725d2f7251232304e4780929a47e1bb3931
>Author: Bharath SM <bharathsm@microsoft.com>
>Date:   Tue Sep 2 01:16:00 2025 +0530
>
>    smb: client: add drop_dir_cache module parameter to invalidate
>cached dirents
>
>    Add write-only /sys/module/cifs/parameters/drop_dir_cache. Writing a
>    non-zero value iterates all tcons and calls invalidate_all_cached_dirs()
>    to drop cached directory entries. This is useful to force a dirent cache
>    drop across mounts for debugging and testing purpose.
>
>    Signed-off-by: Bharath SM <bharathsm@microsoft.com>
>    Signed-off-by: Steve French <stfrench@microsoft.com>

If it's for debugging and testing purposes, it should be wrapped in
ifdef CONFIG_CIFS_DEBUG2 too.

Also, cached dirs is racy by design (as it should), but in its current
state, I don't think it's a good idea to add another source of async
invalidation.


Cheers,

Enzo

