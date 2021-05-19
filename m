Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C950D388B3D
	for <lists+samba-technical@lfdr.de>; Wed, 19 May 2021 11:56:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=k4YEJeH7IpjhV3lawautQG8NotgOdcesMdwVkm6aBYc=; b=eRpFohfEhKCzwMH6c8wbXzdIC2
	O+fEHi6nm+B2wVQJh0GhpcleJ68ENuE8plnqcsuSFT7oxj4ZWjeBNXQsz0iNLw5joIwaLaof9m5YT
	/AuA5YXckXHY4Kmmnxd8gbeqzbMX0pKtvecliOsp2Av9F0dW18/EGDr9DDkE6tRPoC9SXNdezsxlZ
	avLk/t0EU/r8ABWhybXOdbkcVsQ2yJxCCJfQD9U6jgeJBmCqVhDL7NJ3M2Z6CECCtQOVWUpB8Uywd
	TjaAPlMp2/LsYX1gL7JmG8rEudbO6QPm3wQN4PfMZXT+1hnUmFIykCRISaP3Vbz+UwgnWFXLLqmQk
	39XBFGsA==;
Received: from ip6-localhost ([::1]:27958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljIvj-001k7s-Ta; Wed, 19 May 2021 09:55:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54956) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljIve-001k7i-QK
 for samba-technical@lists.samba.org; Wed, 19 May 2021 09:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=k4YEJeH7IpjhV3lawautQG8NotgOdcesMdwVkm6aBYc=; b=3P1LaNYEdbTcbi1AQlAQ01kGWA
 LBh4QjoIo5u9agz5/zEKcLpjjmYKYx1b+7RGkKGq1ycHEkDZLNBVA+4QJz+wa7cxICxahO8zRmu8Q
 9iCOObJwvBcqEulcHAFJn9UJbSeLp+NSyDo9M2XCVC4OHahzcEASpE/snaqpxlJVrUp+PMRHdNOpu
 o0qlZgCHQ7kti+QUb8e2X93V0eaV1boYkqlVp5TPhKeOnFnFikixpPmC9KOIer4Sws6aJBje1u/1X
 egWuR5ihgoys9JIWvSvrGAEGi6x9MaH1wCVkrd33AJHZjy2S5pyVeP6vJQfCfD5ZDUXI3whe7DynZ
 FVTFDp3uYsNKZANm6NZo0mj0yObPpaNu9PL/SNHbyChmqY3XAdeRJD8cysOcrEdCIazY5DL+3qvTb
 IRbQ3XILhjJMtjxjWGWK+mqzG/dwMHDfAt2V+90L9dIhFSbhwsX/9Np+T5fzNd1aOKco3fJF677wi
 87f4FgRZabHlAnS8QzhQTcQl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljIvc-0003aU-Rt; Wed, 19 May 2021 09:55:49 +0000
Message-ID: <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: "Dr." =?ISO-8859-1?Q?Hansj=F6rg?= Maurer <hansjoerg.maurer@itsd.de>, 
 samba-technical@lists.samba.org
Date: Wed, 19 May 2021 21:55:42 +1200
In-Reply-To: <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
 <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
 <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-05-19 at 07:56 +0200, Dr. Hansjörg Maurer wrote:
> Hi Andrew
> 
> tnak you for your quick reply
> 
> Am 18.05.21 um 21:59 schrieb Andrew Bartlett:
> > 
> > > (gdb)
> > > 567                             NDR_CHECK(ndr_pull_array_length(ndr,
> > > &r->name));
> > > (gdb) cont
> > > Continuing.
> > OK, so this case it doesn't happen, which is the one I patched.
> the gdb run took place with the unpatched version
> 

Thanks, can you try with the patched one?  I'm thinking we must be
hitting a different case now, if you still have issues, as the lines
you show are gone with this patch (I hope).

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



