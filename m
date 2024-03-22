Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1000D887433
	for <lists+samba-technical@lfdr.de>; Fri, 22 Mar 2024 21:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=z8jHHi8LfLyjMr5frBRt8s3dnj7vk9WOlNh1Mnd6+7w=; b=GwHdNE9gdbgB44BFAwW/5EIIdS
	pmAZkd9tuRUOB7f9b5bkrZzw9lmHN/GYPpmLhfZIXwQ3rojOJGk5fb383Ch4wLBeVSxV0WRt2O60w
	NqZmNpFX8SOrCLvw2wTUZIB7Ztiu04pg7dlt41JYXHm5tKqLhD5EFe0tfSqxknjxHTX72ZC750vtO
	mnj9zEy6Z2v/G1Hjo8aqA/FTKv4oLAhhx/deih5h8c8S4fHYK5s2lgkK88dfdM36bWBAAfNNi3x2K
	F1pqKx9v60JMCrVgY3C+Aiylc3b337jMTpHrZRH2bOC97TkoDF0ETAhin1DCcbhTepQYCE+TGQfgj
	PHwvDD2g==;
Received: from ip6-localhost ([::1]:21044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rnlc2-0013KD-VB; Fri, 22 Mar 2024 20:35:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rnlby-0013K6-86
 for samba-technical@lists.samba.org; Fri, 22 Mar 2024 20:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=b7QvTyQksEHZf0elu518JwwQaPKEV7BR0ldEyUclnCg=; b=HG+MHH9ziONYM/NSsPsg0Dyh1j
 /pWDnA86U2jBDl64TlMh3DMp2Eq3pyaXufgrhonGziXTBmbThtFxMCMqRHu2F2+8jKpJ/e8jm4fjW
 wKWoIaBSCCU0IbrJm3+JhxXd3aZw9GOzLHDrifIHMLqcnHogl0PTlwV6Pe+wmBroqC+pV2rFwHeoo
 UT6y7fySxrdqhecZSXIq2devufCIYTlS3ieMDY8IRAS/D0UWLUGjKfA3/n5U9mS+8ShW20i/pccUv
 iH/53Klyxrw4YE3dt36dldzTm/7zuYD1fE8hgjMIVzC4PqcQyFSR1YAUcPiiIoWgEi3R1vnD7VkqT
 vAcjy+VcHD3i4NCZYQIxhMha6K7/YXWQy9JvTQw5J2MQ0/vbvivettle4yOfavsPUHtmWbljG1WcL
 q0L8aYCirIjRgyTkKv1JozpGA2LfQpjyCzj/j9c+ozLcOzsAZaEa/dLfbAjuXUSpuCndrokRX71NN
 6g0ulNTF18x3lD2yIv1W6gFj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rnlbx-002QTg-2j; Fri, 22 Mar 2024 20:35:34 +0000
Message-ID: <f09a03b8f405c2cc9a2e97df5576a927eb823cdd.camel@samba.org>
Subject: Re: Fwd: Regression: ldb performance with indexes
To: =?ISO-8859-1?Q?Andr=E9as?= LEROUX <aleroux@tranquil.it>, 
 samba-technical@lists.samba.org
Date: Sat, 23 Mar 2024 09:35:27 +1300
In-Reply-To: <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
References: <4856178.OV4Wx5bFTl@magrathea>
 <44c7b6c9-519a-4b01-ae62-2d03b033c3d4@tranquil.it>
 <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: Andreas Schneider <asn@samba.org>, yalemu@tranquil.it,
 Denis CARDON <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2024-03-22 at 17:55 +0100, Andréas LEROUX wrote:
>     Hi Andreas and Andrew,
> 
>     
> 
>     >>>> > Hi,my colleagues discovered a performance
>     issue in libldb:
> 
>     >>>> >
>     https://bugzilla.samba.org/show_bug.cgi?id=15590
> 
>     >>>> > > > > As soon as you use indexes,
>     ldbadd will be magnitudes
> 
>     >> slower than
> 
>     >>>> > itwas before.Could some ldb expert please look
>     into it?
> 
>     >>>> > > Your subject says a regression. What
>     version is this a
> 
>     >>>> regressionagainst?
> 
>     >>>> Isn't that obvious from the bug report?
> 
>     >>> Here is the short summary:
> 
>     >>> $ bash repro.sh 20000 indexesAdded 2 records
>     successfullyAdded
> 
>     >> 20000
> 
>     >>> records successfully
> 
>     >>> On Samba 4.10: 0m01.231sOn Samba 4.19: 1m30.924s
>     (that's 90 times
> 
>     >>> slower)
> 
>     >>>> > The very nature of a DB index is that it will
>     take time to
> 
>     >>>> create,possibly a lot of time, but should make
>     reads faster.
> 
>     >>>> Either the DB index doesn't work at all in Samba
>     4.10 or there
> 
>     >> is a
> 
>     >>> huge performance problem in Samba 4.19. What is it?
> 
>     >> 
> 
>     >> Thanks, that wasn't written as obviously on the bug, thanks
>     for the
> 
>     >> clarification.
> 
>     > 
> 
>     > I used our CentOS 8 Stream CI image for bisecting. You can't
>     bisect
> 
>     > easily on a modern Linux Distribution, as the included waf
>     would not
> 
>     > have support for newer Python versions like 3.12.
> 
>     > 
> 
>     > In case you want to reproduce it, here is my run:
> 
>     
> 
>     I'm Andréas from Tranquil IT dev team. Denis and Yohannès asked
> me
>     this week to take a look at the performance issues on large
> domains,
>     which include this issue in the current thread along the mdb
> large
>     transaction issues.
> 
>     
> 
>     The attached patchset goes through all the tdb and ldb make test.
> 
>     
> 
>     * LMDB : increase MDB_IDL_LOGN from 16 to 18 to accomodate large
>     nested transactions
> 
>     * tdb : fail-fast when record hash doesn't match expected hash to
>     avoid to read/copy the entire record
> 
>     * ldb : increase DEFAULT_INDEX_CACHE_SIZE from 491 to 8089 to
>     increase the number of bucket to have smaller bucket to have
> faster
>     iteration in each buckets in tdb_find
> 
>     
> 
>     With this patchset we can upgrade large domains (>200k
>       objects) to FL2k16 level in approximatly 1 hour instead of 3
> days
>       :-) 
> 
>     
> 
>     [root@srvads1-bl1cw ~]# bash repro.sh 20000 indexes
> Added 2 records successfully
> Added 20000 records successfully
> real    0m0.536s
> user    0m0.798s
> sys     0m0.105s
> 
>     Tranquil IT team is expert at deploying Samba-AD in large
>       domains, but we are not core devs, so I may have missed
> something
>       during my debugging / patching session. Don't hesitate to
> comment
>       and tell me what you think about this patchset, if there are
> some
>       pitfalls that I missed or if the style can be improved.
Firstly, these are very impressive improvements.

Thanks so much for your work debugging this and getting to the root of
the problem, this is very much appreciated. 
Do you have any data on how much of the improvement is due to ldb
patch, and how much is due to each of the other patches? 

Did you happen to use Brendan Greg's FlameGraph tool for the debugging
(this is what we often use), and if so, can you share the graphs?  I
want to understand if perhaps we need to consider restructuring the
caller. 
https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html#Instructions

For this series if you could please:
 - send in a send in a Samba Developer Declaration per 
https://www.samba.org/samba/devel/copyright-policy.html
 - create a gitlab account
 - let me know the username

Once I give you access to the devel repo, so you can run the full
testsuite under our quota, please follow our contribution steps here:
https://wiki.samba.org/index.php/Contribute#Subsequent_Merge_Requests_(and_complex_first_requests)

Create one merge request for each of the two patches.  I realise that
seems overkill, but the LMDB cache size change is much easier to
justify in the interim. 

This will help ensure we have this as a fully checked merged request
that we can get into the tree.

Of course the LMDB patch needs to go to upstream, but is of course most
valued. 

Andrew Bartlett
-- 

Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
