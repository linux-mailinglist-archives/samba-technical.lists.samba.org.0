Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A859E4E9
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 16:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cXTGuxSdX3IqLUmH1xbDUEImxUv/M3WOTk/NqLmVJjw=; b=LL5xKd5c3YyFWaHMB90VpEoSSA
	hUEooIWuwVC3GJXX4LwbN0A57CWRu1OvM8wWwtYbjjGLL2qioV/mOFAi9DDn+s/nzdJ1t+qU+FenH
	8jGPBcsFBxpIr93oO33YzHRNhVmdLneoaIpds4J+LEO29LOe5G0NhDsBm0AMSupybagrx3VItC1T0
	ErmXKP+uoSX8+wP+WoaAa8fM7mmy0w9s8wo94QaKERa6E5JKfxI5yAY8QWiJqGAnSXMAWROjyPYG/
	/X0duPz/w169uwrMHfCty5b0KpfiVqjAGKnFTjbzuhdNMCow++jiG0k/AA0S2I9QRIl3BalWyU3Yw
	lI794siA==;
Received: from ip6-localhost ([::1]:51576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQUZz-0022P5-K9; Tue, 23 Aug 2022 14:08:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:39714) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oQUZs-0022Ow-Ne
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 14:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cXTGuxSdX3IqLUmH1xbDUEImxUv/M3WOTk/NqLmVJjw=; b=EeRLYkQD0wkNgun3h/DzzNnT3X
 pU/T+Neiz84rBoUVVwFG1YXhN+K3/RjJy6SlAGY8mR3Cfd7k7pr9Tsv1Vo1fdy9I+094beQZ/2SFS
 RGtv4IG9s2MZXamHw24chpE1zevVSJBzwVgQIQeAjWUdDcmYjM45slA7bkWJ8/lPLmv8T5W6qDW9y
 ecav6TnG2ggCHc0SfSMoOBwEc4pNOPvGrpwxb4KgmkgcFoIQVu9T9UaZdeDDyHI4P/DuABZ5tMRgU
 ZsSLNjEgjl9eDjUwNdPWlyUsUXnN+CQ7ZPHf2hJeK3rGYnMOzSmHslRKo2liGi98rRAag5EEQtqbF
 ELYVJBdA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oQUZR-00FLAT-W7; Tue, 23 Aug 2022 14:07:58 +0000
Date: Tue, 23 Aug 2022 15:07:57 +0100
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 3/5] smb3: fix temporary data corruption in collapse range
Message-ID: <YwTfPRDq04/DGTVT@casper.infradead.org>
References: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
 <166126006184.548536.12909933168251738646.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <166126006184.548536.12909933168251738646.stgit@warthog.procyon.org.uk>
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
From: Matthew Wilcox via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew Wilcox <willy@infradead.org>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com,
 sfrench@samba.org, dchinner@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 23, 2022 at 02:07:41PM +0100, David Howells wrote:
>  
> +	filemap_invalidate_lock(inode->i_mapping);
>  	filemap_write_and_wait(inode->i_mapping);
> +	truncate_pagecache_range(inode, off, old_eof);

It's a bit odd to writeback the entire file but then truncate only part
of it.  XFS does the same part:

        error = filemap_write_and_wait_range(inode->i_mapping, start, end);
        if (error)
                return error;
        truncate_pagecache_range(inode, start, end);

... and presumably, you'd also want the error check?

>  	rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
> -				  i_size_read(inode) - off - len, off);
> +				  old_eof - off - len, off);

