Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1050D29422C
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 20:33:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zp8doHSB4sPn3EB1xFSCCJ2VQYy8brhJ8XYOo6wtqN4=; b=kNCId7nx/K/RXl342lGQQR+JMh
	gRuotcBD6n+5+ynOueghw+URcgdYV92mAbTyacvMu4XVoSik02enYZWh1VBxxRHdtFsQu56x9F/7r
	zTfJdrFgrD5kQQAqghBA0D61CeMRkAlLWXZjChmTAIqhwkiDF/AAakgYzDZGR1/R1Jf7vFWLR0q89
	JHx+fvd+eiCpSeAmNmpy4khVf55SQX3XLhUuUyJ37ZmFn2goRErmS0auoaL98caltjGC0IGmZiAVl
	f3BiaX/Ox/BMc2vVfe06qyfyQz1VqyCED9C5P3azuzTut0wUEmk7LGR39gOcVM6U/O7ifY+0DaznH
	v6UKsKCg==;
Received: from ip6-localhost ([::1]:18526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUwS8-00Cvbm-Pm; Tue, 20 Oct 2020 18:33:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20472) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwS3-00Cvbf-Po
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 18:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=zp8doHSB4sPn3EB1xFSCCJ2VQYy8brhJ8XYOo6wtqN4=; b=O5a1929MVQGdQ9QOwGvrUffzwI
 j3/LzcIkTP4p/5zJzYYFCDjSD6bwXQ27v00Pdf9nGXGK/yb0LnhbouDCk9IwfwJMrCEwX3udFZEgw
 de376oWkAQLYgpp+knjJnXUcXRAS3It2c89FKCZN3Gd/v0wMa5h02zjAFK2+1YebCwYaW1Ad0GeB6
 9M5sGotdYzGat9Y7R/AORKdLkcfH0CjgdPBlWNNEEniDDf2rZFn8W91lB8g4HOAm/bBpiSRs0Qf6f
 v9dBlG5hdSpfVXnSFUyt6EF12BjRwa+qJ1lYdf0BMLpHiNyoJOmkPWI/QOx5kynxRBMIVghizIo87
 JxO6APzyFY7hobAZKTUNDECm7Mink/URa+AxnwlSvnoC+d2sQJmm7ll5IEUTTY0qYOMMQn3AhcG+n
 LFPJIbiuM6siLaXLyHaXD9sTxxQu2Odrm25GlXsC9R+bDXFFxw3Mu2P2yCcoT4FEv5iwASKy10Q0w
 t3KpJb4W+oun/NVlpNJtZfdi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwS3-0003KL-52; Tue, 20 Oct 2020 18:33:39 +0000
Date: Tue, 20 Oct 2020 11:33:36 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020183336.GB642265@jeremy-acer>
References: <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
> 
> Then there's another issue with object_count ending
> up off by one, which means talloc_free_children doesn't
> actually return memory to the pool, and that messes up
> some of the other tests I'm adding.  Just tracking down
> when and why this happens now.... It might have been a
> pre-existing issue and not related to this patch, I'm just
> seeing it because of using talloc_free_children to reset
> the pool between some tests.

Oh, I think that may be here:

1894 #if ALWAYS_REALLOC
1895         if (pool_hdr) {
1896                 new_ptr = tc_alloc_pool(tc, size + TC_HDR_SIZE, 0);
1897                 pool_hdr->object_count--;
1898 

We don't reset pool_hdr->object_count on early return
in this codepath.

Are you setting ALWAYS_REALLOC==1 in your tests ?

Not sure if this should be:

1894 #if (ALWAYS_REALLOC != 0)

