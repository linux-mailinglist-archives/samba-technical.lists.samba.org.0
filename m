Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79928FAD8
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 23:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jAKiY1hVrBP7TCgF5HUbKNjytcpI7wVZpx80jIjubgQ=; b=kwuEaoJQKt39NP7sRtrjhNlWWU
	RG2MSaLWM5Nl0krCUMC7bRteF7NPbQ7sHORy5+PMMOMG0GR2zzls/pZWK3SS9hBItriwpOBa+vWN5
	C90iZBmXA8Q/CRsme6CQAZQ7O1aAZcgECNmry+XK2qzwDxdC+A16L6EitL7DYuD0lBSdmkJnQ0n76
	bcB89RccDnGWqc6XejnGt4bn6wrEHHIEXuE3OLt48Ju0+1hBCFgX5icKDX1AotW/1fvmwdcG4Hb2q
	tFJ6W/mnep5UlWGuYPZMVFtm9Wt3BRbGiJNimPblb/oXgeYiUridrbNbPTIi5wrg8pKDjsgniAbSf
	KFZENFMw==;
Received: from ip6-localhost ([::1]:24932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTB6W-00CL6x-PY; Thu, 15 Oct 2020 21:48:08 +0000
Received: from ozlabs.org ([203.11.71.1]:46925) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTB6P-00CL5y-7J
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 21:48:03 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CC2X83wFLz9sTD;
 Fri, 16 Oct 2020 08:31:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1602797464; bh=koa9bhn56Oc6c+RTpsY8swckkDa5SDAcMigSy47kSAg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UZIqyPz9nBbiOD4qzM7OS9QU00o0aOp6YE3uxJMoOP/3ZQLpL5Q7eJf+X/lOrm9Aq
 4nYdvytJ/cZJdc06flqUR3qNcSQCC6cCHvxHpOdpl+a38tkF2vjfYkARJb77gMj0c/
 HEZmm2wc2QAS+i2utnE0Gy9WcjiJMy1qrVyIZkH/0c3BOSF3itw+hbzO1dtzqUc46I
 DeS/Bt/QsvbjwrcZILOTxR+KFhtOp3WN8L0zPWyy/58w6U5fXqsqiDiuAQnmECvKNo
 KO677dXqc8qB3kz8iMdg3/6KuLKgr0+zVrQ81zKHwEqIpLbccT2QpAVxjv6aG0I2lq
 WcrDlteeQfHnQ==
Date: Fri, 16 Oct 2020 08:31:02 +1100
To: samba-technical@lists.samba.org
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201016083102.5b421ff0@martins.ozlabs.org>
In-Reply-To: <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Simo Sorce <idra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 15 Oct 2020 15:14:13 -0400, Simo Sorce via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Thu, 2020-10-15 at 19:14 +0100, Rowland penny via samba-technical

> > Hang on, what is wrong with calling it a 'DCO' ?  
> 
> The original license for DCO 1.0 did not permit it, this[1] is the only
> reference I can still find.
> 
>       If you modify you must use a name or title distinguishable from
>       "Developer's Certificate of Origin" or "DCO" or any confusingly
>       similar name. 

I would argue that "Samba Developer's Certificate of Origin" is
distinguishable from "Developer's Certificate of Origin" and is not
confusingly similar.  Prefixing it with "Samba" distinguishes it and
removes any confusion about who's DCO it is.

Perhaps when we abbreviate we should just make sure to call it "SDCO"?

peace & happiness,
martin

