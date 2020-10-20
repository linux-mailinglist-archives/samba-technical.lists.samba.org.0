Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B2C294246
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 20:42:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=bUAkxxC3axq+eN/NFEs5mKXLQGfgX+4TpCclB51N29c=; b=dMljlVeK2wc5lwWBA0vJl+XkVA
	fNpBjaSkwHt+H7zGRY7R0vOoTQgY1GaHpetEzG1dBHguQPmlPMYc3Hzs/LXOsphYHaep9xcVbOA9h
	ScwWUbiOOQ49/SqiijEdZobalcXYIwikecKHFH08/8dpPH2AmYRMclRbSk0qsrubQlF2txToGr5Qv
	BQJTPPO3TI7HgAv2hNCfMDKWJMBRZShTE2G+5fGiYycqETi+DPF/NfXjkWibszC2RlCfnaG6UbOCm
	nzNB2cuwHiUAel93U1TxlA9UrHsBRWXbNME0n1t0Ho1c/7UX/xJS6GUJVCv34orbQ7ymrB5TX7pk7
	6k3jhyYw==;
Received: from ip6-localhost ([::1]:19952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUwa8-00CvoJ-SR; Tue, 20 Oct 2020 18:42:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22850) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwa2-00CvoC-EK
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 18:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=bUAkxxC3axq+eN/NFEs5mKXLQGfgX+4TpCclB51N29c=; b=CxjtnpTJjLvVh6eE0eZA2vx0Ne
 tylW5/VZyVX9RdN5WJYbKDHiy1UD1NSJbl7wxqHXT1x6Bx5CeATzC1+mE1rpPu1bTVlvGy1T2M1jR
 2gCyH3lWia//B+WjGDQCKRhSxy3uxVsYzHc2s6tP/v+5KlhA2l3BJQ/Pf0Uy1Af+a5VQ7pYA0pSYh
 D1yTs4+BK150mY8LcxsnBo9NAQsyCdLU2L+5aVXRIJm6Wd6QWfki8Jzbjtor/qXObGJeYiUIIH/9+
 +WwLxw+jJ2bpZmNkMQKxveHQ6RpUuAk3MuLIymDhbHeQWl2h24qESCKUebTxvCyu95+UW4B2BogxZ
 pantgkadu2VxI8iOZFJL5PPVWZr2/2GsGX42J5IXiEo9LoABenGaKdahpHcFE/UuOqY5wyB7DuaVy
 g3qjhmtzaqAozE20qGc8qzexNCbZHfIrbwvieo1ojCvWaq1NdA0nlUvGjwmYB6FZts82BgGk6LWah
 xOpMis6/Hb3BunmPD5iHPymh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwa1-0003PV-DX; Tue, 20 Oct 2020 18:41:53 +0000
Date: Tue, 20 Oct 2020 11:41:50 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>,
 samba-technical@lists.samba.org
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020184150.GC642265@jeremy-acer>
References: <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020183336.GB642265@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 20, 2020 at 11:33:36AM -0700, Jeremy Allison via samba-technical wrote:
> On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
> > 
> > Then there's another issue with object_count ending
> > up off by one, which means talloc_free_children doesn't
> > actually return memory to the pool, and that messes up
> > some of the other tests I'm adding.  Just tracking down
> > when and why this happens now.... It might have been a
> > pre-existing issue and not related to this patch, I'm just
> > seeing it because of using talloc_free_children to reset
> > the pool between some tests.
> 
> Oh, I think that may be here:
> 
> 1894 #if ALWAYS_REALLOC
> 1895         if (pool_hdr) {
> 1896                 new_ptr = tc_alloc_pool(tc, size + TC_HDR_SIZE, 0);
> 1897                 pool_hdr->object_count--;
> 1898 
> 
> We don't reset pool_hdr->object_count on early return
> in this codepath.
> 
> Are you setting ALWAYS_REALLOC==1 in your tests ?
> 
> Not sure if this should be:
> 
> 1894 #if (ALWAYS_REALLOC != 0)

Ah no, it's not that (although that is a bug
in the ALWAYS_REALLOC==1 case).

The problem is in this section:

1951         if (pool_hdr) {
1952                 struct talloc_chunk *pool_tc;
1953                 void *next_tc = tc_next_chunk(tc);
1954                 size_t old_chunk_size = TC_ALIGN16(TC_HDR_SIZE + tc->size);
1955                 size_t new_chunk_size = TC_ALIGN16(TC_HDR_SIZE + size);
1956                 size_t space_needed;
1957                 size_t space_left;
1958                 unsigned int chunk_count = pool_hdr->object_count;
1959 
1960                 pool_tc = talloc_chunk_from_pool(pool_hdr);
1961                 if (!(pool_tc->flags & TALLOC_FLAG_FREE)) {
1962                         chunk_count -= 1;
1963                 }

we don't put chunk_count back into pool_hdr->object_count
after decrementing it. Still investigating...

