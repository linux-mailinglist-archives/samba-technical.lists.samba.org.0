Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B60481CB955
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 22:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Z+bcJlhaOlCPdBGUkL+P3nRISK71tKnGo7VPvojctXQ=; b=0QJTIVqr3goOVZfjvw2viThhsK
	slKBWLZAKKV62LqSsSbydhmMvyE0atHr+cR/auKkOKWQ8aDsdX0sdglUigtXUCrACa52vi4Q8gLzA
	zqgeFOjUmwd5en6RF+09qSNiKtrD6O62ztKBywt4NtnwtVUK1/S5GBmZYppLMsXe4KlozAOHuLwKA
	hiV+28ZF/kNuSNA9BFGM+r7VcKxiEPej1BoctfcEWf76PnImurMTL1CZLy/4AlW8VyUhtAbbNPt8A
	HRN/W1dho30XkMPupuYbVS342au5NzXo3bquQIsd78cr06NjHHhxp+pqmSQeWjZ6AxKeOxKgk55Rq
	DwHe3IFw==;
Received: from localhost ([::1]:28736 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX9yJ-003Hd5-Pp; Fri, 08 May 2020 20:51:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20690) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX9yE-003Hcy-UK
 for samba-technical@lists.samba.org; Fri, 08 May 2020 20:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=Z+bcJlhaOlCPdBGUkL+P3nRISK71tKnGo7VPvojctXQ=; b=04p3j1PnP6tIn0jpwrPALQKqxF
 Jfxfw8t0F+gCPzhv6U3x+nFyezubnGifaSihtqBoWV4qObKLZXP68hS57+Vdv99G/ej/Hqt8k6mlW
 AZMMbqEhXBtNqD8gcoXC2298X2M6Hg8DA6FnRgovopqN+EGY9K0gNjsVqUw84voULsirDwNYV/DwW
 vL/Mtqx+jbHcn06eW2tB+zmvLZWTkw5p23hPIk7OUySHwEv0cBuroHmgXZUrtVN+OoB+5jiA21Eni
 ocnzkYfe/82wtAwd0YF659aVZixBPo16e+8E3YjMtoOnJ80aDAWzi8O7YQOV0eDTVEzfPjg1KhfrP
 nJjx3YfxYPQ379IPfxcPr3XVejV1Ca9mZHL0PDZNQl5W61jsjLzcaMshsVoNT2qir8CuznOrVmW0Q
 GUc3T7Eod+vo94b2X9+vCRZkYPdxAFQQYkkSwn/eYCZmgnHz55XCgr+V/vErDzREk9f37Cj6WMdr5
 LiNfLVBDaIq9IfW3CcXYeYoB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX9yE-0000eN-1M; Fri, 08 May 2020 20:51:46 +0000
Date: Fri, 8 May 2020 13:51:40 -0700
To: Stefan Metzmacher <metze@samba.org>, Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200508205140.GH26399@jeremy-acer>
References: <20200507213002.GG14929@jeremy-acer>
 <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508204709.GG26399@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 08, 2020 at 01:47:09PM -0700, Jeremy Allison via samba-technical wrote:
> On Fri, May 08, 2020 at 09:35:31PM +0200, Stefan Metzmacher via samba-technical wrote:
> > 
> > Thanks very much Jeremy! I didn't noticed that.
> > 
> > I guess the attached patch should be able to fix the recursion.
> 
> Oh Metze that's *really* ugly :-). I thought about
> doing that in my code and decided it was in too bad
> taste to live :-).
> 
> Is there a cleaner way than putting "busy" and "retry"
> variables in the config struct ?

And a "Goto again" as well :-(. Bleegh.

