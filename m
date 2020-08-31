Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D40257753
	for <lists+samba-technical@lfdr.de>; Mon, 31 Aug 2020 12:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1DJjRJsXNqPnF7wZ4Q3kpsT5zmhN/v2jDRIXmJovS8g=; b=PtJPzzSDa2stg6j6ekd+rNH7kV
	v3vJ55zkXqZZkioCFDQJfSaj39vVzwz8OAF+/OJyWGL0APPnKuJP20fD+O3oRY1dqQed2TV0UTz+a
	82mYG7YMY9lc9JsDP4eR2MY1ah6whLeyqzOjyVR0s+q2UV5LvgcdfKQ9bqJH4HyyfflZwF+Q3y6Sv
	YS2X3tY9Wt5iVW71CuoWveQcrHR/vn8kKd8VOwJcOrzjoXaE2DC8TTeCM7sDpFoh7unFxNLcEKi2W
	1qKGaA0LUoxbg3zGJ1OWI5astGB477tgE7em9q13BjifWzxZZqIqn8SKZJAf62o45aMSRVHb3FsOA
	OS2Dl4aA==;
Received: from localhost ([::1]:61546 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kCh4J-001Qc7-Iu; Mon, 31 Aug 2020 10:29:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCh4D-001Qc0-5I
 for samba-technical@lists.samba.org; Mon, 31 Aug 2020 10:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=1DJjRJsXNqPnF7wZ4Q3kpsT5zmhN/v2jDRIXmJovS8g=; b=uMgTC5xxINYy7v16cXW+EPJphd
 jFj8L2qtWoA0tqbKx1939pxN8ufQ3JAQ1yWRMSufslqPViOwIjoKyjz2eKy/JUvIxmHyt27iP7K/u
 BoYZ86tc/bxIC4MkkW+uYb+wZps/ZrlH4hsoUyC0eUEJIFaSHEUlYr+e8dLAmrmaRnfmDznZouc/Y
 E8/Rd7ZewJ97vfcpwNCRxiBOXI6Wgq/yYIpCe5dYI4rTF8+EJaPAVskk8zwW+ttwTOR+q98NMyaF9
 LEDzYdJ3b4bMIwH2DyvGciBd2xWt+x+JRtPoKzxKnp1Lb6BCb/RahBH/qxIxbRfe+rebOM3RkAB/R
 uEMWPHgMDgLLAcWVyI+diLuF1lflGx37NJSNF+IRFZ76zbyTQJc4R1MYKarBeovKNGkTkNXTFpkXp
 Ddb1EKiSXW1z0kQN/stT0k+wQa1pFiE/ebjiqTz/rlj8G5fbF0T4T9LEzktia97LAcAMNleNZvViw
 IWNY6rQ821bsVJE88s1SvvHO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCh4B-0001Ku-O9; Mon, 31 Aug 2020 10:29:35 +0000
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
Organization: Samba Team
Message-ID: <55b355e4-b068-d80c-b302-e9a4a62c0648@samba.org>
Date: Mon, 31 Aug 2020 12:29:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 31.08.20 um 11:52 schrieb Andrew Bartlett:
> On Mon, 2020-08-31 at 11:36 +0200, Karolin Seeger via samba-technical
> wrote:
>>
>> this is currently a blocker for 4.13.0, so we need a solution asap. Can
>> we agree at least on a temporary workaround?
>> Or on shippting 4.13.0 anyway?
> 
> I'm lost as to why this is blocking 4.13, can you give me the short
> version?
> 
> My understanding is this:
> 
> I get that Björn would like to change our mostly-but-not-entirely
> consistent position from 'all features on by default, turn them off if
> they don't work for you' (since Waf was introduced) to 'auto-figure
> what the system has' (what autoconf traditionally did).   
> 
> I also get that we have not been entirely consistent.
> 
> But we did Waf, and much of this change, back in Samba 4.0 so why is
> this blocking the release at 4.13?

It's marked as a regression...


-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

