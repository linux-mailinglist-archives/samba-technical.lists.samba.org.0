Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C64309819
	for <lists+samba-technical@lfdr.de>; Sat, 30 Jan 2021 20:50:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NuZKzUtnn+g0sq5i1UkPI6Ic2K0UbdWke3soqbBgLGg=; b=0UsHMAQIzByLb6Dgexvppw0+uY
	szymv5fRvBHVQenQn53T9yl45f3bJTIqyzPVK+i316wOjQyzlQUj3w49Ix+/etlRcWCLjvNzupicv
	6txR3ifnaUJ79FTcC28QB2utd4+uSNPOUFwQYANVjy/vXDHi8aKJrN7i0lZHKXqddgO07R+OyJSKt
	rdoW+FKqToLhRRlhMYePv7lkQtcFmiuuI/8nCy/6MlRKoNB8M/1B4jzNHHhCckqoIcHmg5c90FDVO
	pvNHGlp45aHFQ2DZutI0m8wQ1r2IgLqZjXTNOhmIC6QJuqfxhvisVeqaCjNl71OnRMDjKUAWe/RH+
	1tCAw9Yw==;
Received: from ip6-localhost ([::1]:53142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5wEz-00802K-BU; Sat, 30 Jan 2021 19:49:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60632) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5wEt-00802D-G4
 for samba-technical@lists.samba.org; Sat, 30 Jan 2021 19:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=NuZKzUtnn+g0sq5i1UkPI6Ic2K0UbdWke3soqbBgLGg=; b=fbXD1hC3TGuDsQdwxWClOPZUU3
 7uXmZz+lhgd+IGVPo1EcLCqApVvDm9s9t28rwt7hRaacMpTWDHA7W1zl49RobS0R+5LRx/zdVm0wI
 4ziyt1lQNCnatbe+YzbZ4dsaU1e2zSJx7KhG3kMz/HorrgPXkPcvp3XMLKiNIwxD5chWHiGxviGyJ
 XaBHHDEOinBYkEXlGRF2+WXiYtcmUJ60ftQRvOs4KHwdL9ByWhcSU+hjI8VMMxVQ7gdlegQOEngNk
 BztlstwtWBnGli9TRnndaNrWWOacNFFg5KyH8BPKZirIkOJ/020F2lBrlyE8LJTGLMSJaU1Q3U8GP
 5ryv/xGI70mK310l9HIb7aB9qubTNYLawrbdncRrO7baNdko4FLQVfCOMxcO0i6ZXB92Y+YaRpLMh
 197nQ4DLF577wajyfWKwMh72Wr6iLZxL61G/RIO8zkKXfseGCoIdtdCQx3vbw2PpzMfxBWnMqDEFX
 uj+zv7qx8yG4tu+Sr2XyAn0N;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5wEq-0007yJ-D9; Sat, 30 Jan 2021 19:48:56 +0000
To: Shilpa K <shilpa.krishnareddy@gmail.com>, samba-technical@lists.samba.org
Subject: Re: winbind cache issue for NDR entries
Date: Sat, 30 Jan 2021 20:48:53 +0100
Message-ID: <1852905.PYKUYFuaPT@krikkit>
In-Reply-To: <20210129210511.GA50742@jeremy-acer>
References: <CAHbM3qh3pAXzSzSRNjE77jL1tmsREuRu9BQOCaPnWBY9dVdNdg@mail.gmail.com>
 <20210129210511.GA50742@jeremy-acer>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 29 January 2021 22:05:11 CET Jeremy Allison via samba-technical 
wrote:
> On Fri, Jan 29, 2021 at 07:39:40PM +0530, Shilpa K via samba-technical 
wrote:
> >Hello,
> >
> >We had a customer report that the users were not able to login for about
> >30minutes and the problem cleared itself in almost about 30minutes. They
> >are using Samba as a member server in a domain which has 2 way trust with
> >another domain (say ABC.COM). Upon investigation, we found that there was a
> >problem with trusted domain DCs for a very short duration as per the event
> >log on the DC of the primary domain. This problem seems to have been
> >cleared away after a short duration. Around the same time, a user belonging
> >to a trusted domain mapped Samba share and encountered a problem. At this
> >time, looks like NDR cache entry for trusted domain group "Domain Users"
> >was added in winbindd_cache.tdb to indicate that there was a lookup problem
> >and the status NT_STATUS_TRUSTED_DOMAIN_FAILURE was stored as part of this
> >entry. Once the issue with trusted domain DC was cleared and the domain was
> >back online, when users tried to login, PAM_AUTH was successful for the
> >users but getpwnam failed while looking up SID for "Domain Users". This
> >failure was returned from the entry in the winbindd_cache.tdb as
> >wcache_fetch_ndr() succeeded for this entry. Due to this, users belonging
> >to the trusted domain were not able to login. Once the cache was expired,
> >getpwnam succeeded for trusted domain users and the shares could be mapped.
> >In order to resolve this issue, should we not refresh the sequence number
> >when the domain goes online? Btw, we are using "winbind cache time = 1800".
> 
> Yep, looks like we should add a call to force a refresh of the
> sequence number in the cache here:
> 
> source3/winbindd/winbindd_cm.c:set_domain_online()
> 
>   538
>   539         domain->online = True;
>   540
> 
> Add a force_refresh_domain_sequence_number(domain) call above.
> 
> Here is a (raw, untested) patch that implements this.
> 
> Any chance you can test this for me ?
> 
> Jeremy.

I wonder if this is the dc-connect issue with trusted domains.

A fix for this we are currently using is:

https://gitlab.com/samba-redhat/samba/-/commit/
87bdffab6eae644d468f0fdc4489667fc21ac3a6

This is just a hack as the right fix would be to completely get rid of the dc-
connect child. However the winbind parent needs the dc-connect just to refresh 
the secquence number.

Isaac started to investigate this further and just had a draft for this which 
was never finished. We really need to fix this correctly.

https://gitlab.com/samba-team/samba/-/merge_requests/1573



	Andreas



