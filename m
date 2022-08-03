Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E5588594
	for <lists+samba-technical@lfdr.de>; Wed,  3 Aug 2022 03:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wh75L2JsVC1g81tvfqGvYtL7ba9GfSXXnDr3TvdiG8Y=; b=KbhrO21ym6IpCufed1QwsRfIBP
	G+9FfOaGILpT2VdVEOJWiTW2mTQXE2M2TUzM5iPnmo6ozhxJR960yhXpkqBSWIvswub/LVgDPXpMm
	OfMsjUxypOEpyFRAjFHp30drYNsieLc7LHDSlkn0fbIfrBOBAFYEg8eov2HElfe1c6/KadXoCY5X2
	iGC6GsYKfKgcxTOQbYIO07C7aUZH6L1xUYaB4wnsKvqhr73a6JT9vMuP4RxfPgzfATwekFJ+WqBl7
	/otMd7Mi42bB28dDP2RhxZIA7jgTxmTPlc4nGCk530akslS8QblJmGZMZFjK3ZpUYkrktLbeq6SbZ
	cVz+kQxA==;
Received: from ip6-localhost ([::1]:56898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oJ3dB-0056bH-UN; Wed, 03 Aug 2022 01:57:06 +0000
Received: from smtp-out1.suse.de ([195.135.220.28]:38138) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oJ3d7-0056b8-5M
 for samba-technical@lists.samba.org; Wed, 03 Aug 2022 01:57:04 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C172388B5;
 Wed,  3 Aug 2022 01:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659491818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wh75L2JsVC1g81tvfqGvYtL7ba9GfSXXnDr3TvdiG8Y=;
 b=W5I15y8WWes3gGdcZFkcLTH3E2+GgV6LMxURgLk7fTyTu6Ydjcf6Vm1EA0WSizcrkO/pkE
 //A+lu+gzaZvyWF/WAAs7gF4A6Hm0OQhtxCbpNAGo6FWRnkqjYzlNLfsPdQQik+hOQB0fl
 BEXndnuHTx+OnOYgdGdo5fTIBN1vkxg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659491818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wh75L2JsVC1g81tvfqGvYtL7ba9GfSXXnDr3TvdiG8Y=;
 b=itYdiCYy4kINUIGYcNd2PMJbHJVLBwsb6mzIMJbVKx2v/s59ZfR6YXrbA7CLv7oBu2J+DB
 cL9ps0bCXB6ZYdCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFA5813A94;
 Wed,  3 Aug 2022 01:56:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sRmZH+nV6WKdYwAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Wed, 03 Aug 2022 01:56:57 +0000
Date: Tue, 2 Aug 2022 22:56:55 -0300
To: Tom Talpey <tom@talpey.com>
Subject: Re: [RFC PATCH 0/3] Rename "cifs" module to "smbfs"
Message-ID: <20220803015655.7u5b6i4eo5sfnryb@cyberdelia>
References: <20220801190933.27197-1-ematsumiya@suse.de>
 <c05f4fc668fa97e737758ab03030d7170c0edbd9.camel@kernel.org>
 <20220802193620.dyvt5qiszm2pobsr@cyberdelia>
 <6f3479265b446d180d71832fd0c12650b908ebe2.camel@kernel.org>
 <1c2e8880-3efe-b55d-ee50-87d57efc3130@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1c2e8880-3efe-b55d-ee50-87d57efc3130@talpey.com>
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
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, pc@cjr.nz, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, pshilovsky@samba.org, smfrench@gmail.com,
 linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 08/02, Tom Talpey wrote:
>The initial goal is to modularize the SMB1 code, so it can be completely
>removed from a running system. The extensive refactoring logically leads
>to this directory renaming, but renaming is basically a side effect.
>
>Stamping out the four-letter word C-I-F-S is a secondary goal. At this
>point, the industry has stopped using it. You make a good point that
>it's still visible outside the kernel source though.
>
>It makes good sense to do the refactoring in place, at first. Splitting
>the {smb1,cifs}*.[ch] files will be more complex, but maybe easier to
>review and merge, without folding in a new directory tree and git rm/mv.
>Either way, there will be at least two modules, maybe three if we split
>out generic subroutines.
>
>Enzo, you're up to your elbows in this code now, is it too ugly without
>the new directories?

Having things in separate directories and code appropriately distributed
in coherently named headers/sources certainly makes things easier to
work with.

Of course this patch is not important, by far, but from what I
gathered, it was some people's wish to move away from "cifs" name.

Answering your question (IIUC), Tom, I'm ok with postponing this change.

>Tom.

Cheers,

Enzo

