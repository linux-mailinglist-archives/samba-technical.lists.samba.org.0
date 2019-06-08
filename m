Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5E3A1E5
	for <lists+samba-technical@lfdr.de>; Sat,  8 Jun 2019 22:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WaBJF00J0CVbe5UsScF6RYFuDtKsUufciPd/0n5GfrM=; b=aB2/A2JG7OTAmde8UG7+7kG9kw
	3vuYMrP8KhQCzJ1LqRdm4lSxBM5d6LMQ3fhG2kInjoFHT2G/IFD9jw+B5TJle9mpVpUkDOkgmZTKt
	E+ZIyXGGS577w4mtYrouYc8q7bvPJb3bm6PmRpRT1IhEQaue1W6YrnBdbdfJK74BSLM25si95h8RJ
	qip+JAkMcaGzLYlG6qtc2Qe9ZAmN+coWIdWnkr6Gxqcx/Qc0l+EEiPoKjCJ6ZHEmiHl1FL5jKVZkI
	YGTcV6eTEfVGRVlTdyykckqk8B3ycYj0+wVMzzyPu/zbezhN1qwqegoHEnyZ6Z5arKkVo6pVL+BWW
	2AjGuELg==;
Received: from localhost ([::1]:63188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hZhnB-000Y6Z-Pd; Sat, 08 Jun 2019 20:18:21 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:56471) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hZYGS-000Vin-C2
 for samba-technical@lists.samba.org; Sat, 08 Jun 2019 10:08:07 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45LZp75zpYz9s4Y;
 Sat,  8 Jun 2019 20:07:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1559988466; bh=QXIAL3eySsMnPKvbBFBgtGf64qso3ojOK9fDY41zg7I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UFaC9JVDKdffOPAwP3qcNn21Wj9OZS0iWVS+deku2HYox+2Q1ojvP55OQNWS/f34W
 2wxLifR8mGffqESHqcmCtth71TelhvWLjy2rPF6flCFnOHqSql3mTufhncCAho94bl
 kwZ9e1mA/KZJXmN57eX6MdrJbLlUMjiy187l7aeirfPOV9kqt0PiuEhCgrdEAE8JZo
 v8s/F8hTfFyAlZm8zG5aEVFWytIsZvUggRcFvR0KwZzl45dohqmDP8NkLchdWydP7/
 MSioz7vOe4eWV04NEMK7fKnrcdAVJzfzHTSGpW9TzCPhQWHkeIXqBxYT6rkELo/xVi
 Sy5bOz6s2X+Zw==
Date: Sat, 8 Jun 2019 20:07:29 +1000
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: recent flapping tests
Message-ID: <20190608200729.759ac6a1@martins.ozlabs.org>
In-Reply-To: <c58cec86-7177-18ac-ead1-7e5de351f330@catalyst.net.nz>
References: <7af13c9d-858d-650d-242a-d023f19dbaae@catalyst.net.nz>
 <20190608012357.68de8832@martins.ozlabs.org>
 <c58cec86-7177-18ac-ead1-7e5de351f330@catalyst.net.nz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 8 Jun 2019 08:36:29 +1200, Douglas Bagnall
<douglas.bagnall@catalyst.net.nz> wrote:

> > Should be fixed by fixes pushed on 7 May.  
> 
> I can confirm all your "shoulds". Also I can confirm the wisdom of
> hedging with this "may":
> 
> >>    4 *FAILED* tests/simple/69_recovery_resurrect_deleted.sh  
> > 
> > May be fixed by fixes pushed on 7 May.  :-)  
> 
> It happened twice since May 8.

Oh, well...  :-(

We tightened up some things that might have been causing some tests to
fail, but it doesn't look to have helped this one.

Some time soon I'll look at a patch so that the daemon logs are dumped
to stderr when these "simple" tests fail.  It'll be a lot of output but
at least it might give us a way to debug them when they happen in an
environment that we don't control.

I might also try running that one in a loop...

peace & happiness,
martin

