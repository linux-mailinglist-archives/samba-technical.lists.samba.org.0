Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD81B1B3E2
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 14:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=s8nWLo0aRWk7YuQOcCa8Ie4aVAnTszPhkbHWtT5G8T0=; b=5EA8tYGQ7kSJ54ZpZxqYJqgxaI
	tZwAlRDdFNR+TEE7eWHnvVq5zf2K+hVxbH4WGMIvinXM40d247Rfo+bildn3TUeTzCYPfraIql0zf
	jfZcM21bLjfxPHMNNj2j+x+mmQlNpzZlof9SBU464SdxjZvsKIcVrskQA8A+xw5qZATb2LBi90s8Y
	R/D6B6bN+MRzYMIK3mrkJ0Pf6aJ21euYO6VdRNaCSqqwmwqoOkD3gkj8y4XrLJ4wYqhAap0NQ4FDi
	DN2sPBQQI6xle3OyDucX4AvqpJAiguYQIrso0XzI+jUM9zdmwfs87RXnkirHHwnyndYRVCfUtHvcP
	uDqWaTJg==;
Received: from ip6-localhost ([::1]:38044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujHFk-00EMQZ-2N; Tue, 05 Aug 2025 12:58:52 +0000
Received: from smtp-out1.suse.de ([195.135.223.130]:36292) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujHFe-00EMQR-2y
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 12:58:48 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 92A5F216F1;
 Tue,  5 Aug 2025 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754398060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8nWLo0aRWk7YuQOcCa8Ie4aVAnTszPhkbHWtT5G8T0=;
 b=NWt6wTJ2kbOHB9A0fmjljRNx0wf5wBvS/Ct8xLLVaTJxS0+60/inCh1PdtRhFitYWn2EjC
 BiykHR2WgdtXXPkoaXyKP8xB+kEgTGzUH3kNupud4FPqxeRMGcijVktJBciX4u+J7Yzawf
 DUErLq9csW7rEuKyDjiEUOHG6+N8ow4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754398060;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8nWLo0aRWk7YuQOcCa8Ie4aVAnTszPhkbHWtT5G8T0=;
 b=k+00XsIC+Z2MxbqW80RCbHEOOD1EXr4YYjQj+HyihLb3cMgkfcpf6gxZnWL9A2HTlw57Es
 bWDaXqKbuRRFhhBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754398060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8nWLo0aRWk7YuQOcCa8Ie4aVAnTszPhkbHWtT5G8T0=;
 b=NWt6wTJ2kbOHB9A0fmjljRNx0wf5wBvS/Ct8xLLVaTJxS0+60/inCh1PdtRhFitYWn2EjC
 BiykHR2WgdtXXPkoaXyKP8xB+kEgTGzUH3kNupud4FPqxeRMGcijVktJBciX4u+J7Yzawf
 DUErLq9csW7rEuKyDjiEUOHG6+N8ow4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754398060;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8nWLo0aRWk7YuQOcCa8Ie4aVAnTszPhkbHWtT5G8T0=;
 b=k+00XsIC+Z2MxbqW80RCbHEOOD1EXr4YYjQj+HyihLb3cMgkfcpf6gxZnWL9A2HTlw57Es
 bWDaXqKbuRRFhhBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D39D13A9F;
 Tue,  5 Aug 2025 12:47:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SqwxNWv9kWhjDwAAD6G6ig
 (envelope-from <ematsumiya@suse.de>); Tue, 05 Aug 2025 12:47:39 +0000
Date: Tue, 5 Aug 2025 09:47:37 -0300
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Subject: Re: [PATCH V2 0/4] Fix mid_q_entry memory leaks in SMB client
Message-ID: <ci3hj5mr7a3qjx7hiuomzq4ankp7kym3sqevkll3pn4r76kb2f@rpxbkf3sqinq>
References: <20250805064708.332465-1-wangzhaolong@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250805064708.332465-1-wangzhaolong@huaweicloud.com>
X-Spamd-Result: default: False [-3.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[9];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 sfrench@samba.org, chengzhihao1@huawei.com, pshilov@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Wang,

On 08/05, Wang Zhaolong wrote:
>I've been investigating a pretty nasty memory leak in the SMB client. When
>compound requests get interrupted by signals, we end up with mid_q_entry
>structures and server buffers that never get freed[1].
>
>User foreground process                    cifsd
>cifs_readdir
> open_cached_dir
>  cifs_send_recv
>   compound_send_recv
>    smb2_setup_request
>     smb2_mid_entry_alloc
>      smb2_get_mid_entry
>       smb2_mid_entry_alloc
>        mempool_alloc // alloc mid
>        kref_init(&temp->refcount); // refcount = 1
>     mid[0]->callback = cifs_compound_callback;
>     mid[1]->callback = cifs_compound_last_callback;
>     smb_send_rqst
>     rc = wait_for_response
>      wait_event_state TASK_KILLABLE
>                                  cifs_demultiplex_thread
>                                    allocate_buffers
>                                      server->bigbuf = cifs_buf_get()
>                                    standard_receive3
>                                      ->find_mid()
>                                        smb2_find_mid
>                                          __smb2_find_mid
>                                           kref_get(&mid->refcount) // +1
>                                      cifs_handle_standard
>                                        handle_mid
>                                         /* bigbuf will also leak */
>                                         mid->resp_buf = server->bigbuf
>                                         server->bigbuf = NULL;
>                                         dequeue_mid
>                                     /* in for loop */
>                                    mids[0]->callback
>                                      cifs_compound_callback
>    /* Signal interrupts wait: rc = -ERESTARTSYS */
>    /* if (... || midQ[i]->mid_state == MID_RESPONSE_RECEIVED) *?
>    midQ[0]->callback = cifs_cancelled_callback;
>    cancelled_mid[i] = true;
>                                       /* The change comes too late */
>                                       mid->mid_state = MID_RESPONSE_READY
>                                    release_mid  // -1
>    /* cancelled_mid[i] == true causes mid won't be released
>       in compound_send_recv cleanup */
>    /* cifs_cancelled_callback won't executed to release mid */
>
>The core issue is a race condition where cifs_cancelled_callback never
>gets a chance to run, so cleanup never happens. I've spent quite a bit
>of time trying to understand how to fix this safely.

Do you have a reproducer for this?  mids are allocated from kmem cache,
and a leak should certainly be visible (WARN on rmmod), even without any
debugging facilities enabled.

However, I do know that the following problem is quite common in cifs:

thread 0        | thread 1
----------------|----------------
                 | lock
                 | check data
                 | data is valid
                 | unlock
lock            |
invalidate data | lock (spins)
unlock          | ...
                 | // assumes data still valid
                 | use invalid data (not really freed)
                 | unlock

You see that no matter how many locks you add to protect data, there's
still a chance of having this "race condition" feeling.

So, personally, I'm skeptical about having yet another spinlock with
questionable or no effect at all.

But again, if I can reproduce this bug myself, it'll be much easier to
analyse effectiveness/review your patches.

Apart from that, cleanup patches always get my +1 :)


Cheers,

Enzo

>Honestly, my first instinct was to just patch the callback assignment
>logic directly. But the more I dug into it, the more I realized that
>the current locking scheme makes this really tricky to do safely. We
>have one big lock protecting multiple different things, and trying to
>fix the race condition directly felt like playing with fire.
>
>I kept running into scenarios where a "simple" fix could introduce
>deadlocks or new race conditions. After looking at this from different
>angles, I came to the conclusion that I needed to refactor the locking
>first to create a safe foundation for the actual fix.
>
>Patches 1-3 are foundational refactoring. These three patches rename
>locks for clarity, separate counter protection from queue operations,
>and replace the confusing mid_flags bitmask with explicit boolean
>fields. Basically, they untangle the current locking mess so I can
>implement the real fix without breaking anything.
>
>The 4th patch in the series is where the real fix happens. With
>the previous refactoring in place, I could safely add a lock to each
>mid_q_entry and implement atomic callback execution. This eliminates
>the race condition that was causing the leaks.
>
>In summary, my approach to the fix is to use smaller-grained locking to
>avoid race conditions. However, during the implementation process,
>this approach involves more changes than I initially hoped for. If
>there's a simpler or more elegant way to fix this race condition that
>I've missed, I'd love to hear about it. I've tried to be thorough in
>my analysis, but I know there are folks with more experience in this
>codebase who might see a better path.
>
>V1 -> V2:
>  - Inline the mid_execute_callback() in the smb2ops.c to eliminate
>    the sparse warning.
>
>Link: https://bugzilla.kernel.org/show_bug.cgi?id=220404 [1]
>
>Wang Zhaolong (4):
>  smb: client: rename server mid_lock to mid_queue_lock
>  smb: client: add mid_counter_lock to protect the mid counter counter
>  smb: client: smb: client: eliminate mid_flags field
>  smb: client: fix mid_q_entry memleak leak with per-mid locking
>
> fs/smb/client/cifs_debug.c    | 12 ++++--
> fs/smb/client/cifsglob.h      | 22 ++++++-----
> fs/smb/client/connect.c       | 57 +++++++++++++++++----------
> fs/smb/client/smb1ops.c       | 23 +++++++----
> fs/smb/client/smb2ops.c       | 72 +++++++++++++++++++----------------
> fs/smb/client/smb2transport.c |  5 ++-
> fs/smb/client/transport.c     | 71 ++++++++++++++++++----------------
> 7 files changed, 152 insertions(+), 110 deletions(-)
>
>-- 
>2.39.2
>
>

