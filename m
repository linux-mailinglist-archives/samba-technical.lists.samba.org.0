Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B75DD86DF61
	for <lists+samba-technical@lfdr.de>; Fri,  1 Mar 2024 11:40:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=sPUuPNHkRuLKNN5jY/RBKJtJl0iXMas25vLU674HII8=; b=T12araw5KD4R8cmJilfrfRjO8N
	KwAuUbBjj9ApoMuCl19eT07ty07+EUgT1sVGeOUy92dtkIdwPinTKoRHeAW6wOfOvuFqVXLZvTskB
	ijhzB47IAAOp+FqljbFNrbkMXl4fWZ3KGn0eW1QnTAmXoEaofEYUNewhv8WniQNxlr+hzUAVYBgUZ
	00RWP//EzOv/Ht/2wNttTuTN0nNCe1RLrb0xGbsHlS2JavL+AZX7AmEK2NGMZ3riKQxyIZbN7IYLe
	Mb1CWdIbpTJBKD1UYIBEZ0CyiL4UUcbCzunQVC8KYAlc8aISKOwHGnsEQBQfoqhojMbvqV8Cqa/On
	JAUGO5iw==;
Received: from ip6-localhost ([::1]:30436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rg0IU-00BbR2-3d; Fri, 01 Mar 2024 10:39:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30242) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rg0IQ-00BbQv-1t
 for samba-technical@lists.samba.org; Fri, 01 Mar 2024 10:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=sPUuPNHkRuLKNN5jY/RBKJtJl0iXMas25vLU674HII8=; b=ZJZL6FMgUj9ko8nkqCvF18bGp+
 o2zLgjhqu4QruqisTTfdfspjEnAprIryE7bQtccXmnim1HHFPo6bIUTXVFctzpTGxy54HowwpfWYp
 DwQn9hvD2KgSLDPv1U/2D6vFAMdodheLgPAWfmC1/sGhj7CCxLvxTITCz8j9ruf0kZxFAccUiR5Fj
 MZRDbCFOFKA9MYlsgv+6+QfHOjsi/pRJdjQgjfE8tHqheCGf/dBZMMZu+F7e1F1TAcJnEbKUtI141
 FR/8YLdlJhbIY1u7PRj3krFbesDJuV4R7VRAL0X75g0R38YrpY1q7NtFMdMFLiNaydC0P5L0PxPBr
 P8Bk0RYcTLfLX+xJy5c9jvwjiUSGHcxaQgSNwZL1Uezdh8Y9yx2syuKjcnumgdbp1swH4Y2Zr4qkn
 G84MaNmKIOyzExQqLLrkbNb5H9/AQ4r1xQJtjGMEw/T+eWSHC5euyqibNNQUOXiylV9JI+kJKB7JL
 c+6w9VEs9/ismlAek1SCjKbY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rg0IO-00FbzO-0P; Fri, 01 Mar 2024 10:39:16 +0000
To: samba-technical@lists.samba.org
Subject: Re: Regression: ldb performance with indexes
Date: Fri, 01 Mar 2024 11:39:15 +0100
Message-ID: <4856178.OV4Wx5bFTl@magrathea>
In-Reply-To: <741d1eaff17826e83259005d75db43c6b400282e.camel@samba.org>
References: <2223722.hkbZ0PkbqX@magrathea> <26313942.1r3eYUQgxm@magrathea>
 <741d1eaff17826e83259005d75db43c6b400282e.camel@samba.org>
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
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 29 February 2024 22:39:35 CET Andrew Bartlett via samba-technical 
wrote:
> On Thu, 2024-02-29 at 22:31 +0100, Andreas Schneider wrote:
> > On Thursday, 29 February 2024 21:19:52 CET Andrew Bartlett via samba-
> > 
> > technical wrote:
> > > On Thu, 2024-02-29 at 16:36 +0100, Andreas Schneider via samba-
> > > 
> > > technical wrote:
> > > > Hi,my colleagues discovered a performance issue in libldb:
> > > > https://bugzilla.samba.org/show_bug.cgi?id=15590
> > > > 
> > > > As soon as you use indexes, ldbadd will be magnitudes slower than
> > > > itwas before.Could some ldb expert please look into it?
> > > 
> > > Your subject says a regression.  What version is this a
> > > regressionagainst?
> > 
> > Isn't that obvious from the bug report?
> > Here is the short summary:
> > $ bash repro.sh 20000 indexesAdded 2 records successfullyAdded 20000
> > records successfully
> > On Samba 4.10: 0m01.231sOn Samba 4.19: 1m30.924s (that's 90 times
> > slower)
> > 
> > > The very nature of a DB index is that it will take time to
> > > create,possibly a lot of time, but should make reads faster.
> > 
> > Either the DB index doesn't work at all in Samba 4.10 or there is a
> > huge performance problem in Samba 4.19. What is it?
> 
> Thanks, that wasn't written as obviously on the bug, thanks for the
> clarification.

I used our CentOS 8 Stream CI image for bisecting. You can't bisect easily on 
a modern Linux Distribution, as the included waf would not have support for 
newer Python versions like 3.12.

In case you want to reproduce it, here is my run:

[samba@09821f63851d samba]$ git bisect reset                                                                                                                                
Previous HEAD position was 201684e59fd lib ldb ldb_key_value tests: Add tests 
for wrapped operations                                                                                 
Switched to branch 'master'                                                                                                                                                          
Your branch is up to date with 'origin/master'.                                                                                                                                      
[samba@09821f63851d samba]$ git bisect start                                                                                                                                         
status: waiting for both good and bad commits                                                                                                                                        
[samba@09821f63851d samba]$ git bisect bad 
763b52d237763e90e67f5061050f99a92ed7901c
status: waiting for good commit(s), bad commit known                                                                                                                                 
[samba@09821f63851d samba]$ git bisect good 
fb12a252613205dd0ebcfc8716847aed510e07cb                                                                                                 
Bisecting: 31 revisions left to test after this (roughly 5 steps)              
[5823dc5414742b023b1bfee4c9183c9f474e8205] s3:libnet: Use 
gnutls_error_to_ntstatus() in libnet_passwd
[samba@09821f63851d samba]$ git bisect bad 
Bisecting: 15 revisions left to test after this (roughly 4 steps)   
[aa2a3d95098231f48d7c308881bf66418164111e] dnsp.idl: fix payload for 
DSPROPERTY_ZONE_DELETED_FROM_HOSTNAME
[samba@09821f63851d samba]$ git bisect bad
Bisecting: 7 revisions left to test after this (roughly 3 steps) 
[565341baf537c9b3145a882d6a23ad4f155c0036] lib ldb key value: add nested 
transaction support.
[samba@09821f63851d samba]$ git bisect good        
Bisecting: 3 revisions left to test after this (roughly 2 steps)
[feb96ee8e558797d68ad0af669eb9010c0487b9f] lib ldb key value: use 
TALLOC_FREE() per README.Coding
[samba@09821f63851d samba]$ git bisect bad                      
Bisecting: 1 revision left to test after this (roughly 1 step)
[1a52b03b2f4c1503b52784f1a01f8291b78e7604] lib ldb key value: Remove 
check_parent from ldb_kv_index_idxptr()
[samba@09821f63851d samba]$ git bisect good   
Bisecting: 0 revisions left to test after this (roughly 0 steps)                       
[b6b5b5fe355fee2a4096e9214831cb88c7a2a4c6] lib ldb key value: fix index 
buffering
[samba@09821f63851d samba]$ git bisect bad
b6b5b5fe355fee2a4096e9214831cb88c7a2a4c6 is the first bad commit
commit b6b5b5fe355fee2a4096e9214831cb88c7a2a4c6
Author: Gary Lockyer <gary@catalyst.net.nz>
Date:   Wed Mar 6 15:28:45 2019 +1300
             
    lib ldb key value: fix index buffering

    As a performance enhancement the key value layer maintains a cache of
    the index records, which is written to disk as part of a prepare commit.
    This patch adds an extra cache at the operation layer to ensure that the
    cached indexes remain consistent in the event of an operation failing.

    Add test to test for index corruption in a failed modify.

    Signed-off-by: Gary Lockyer <gary@catalyst.net.nz>
    Reviewed-by: Andrew Bartlett <abartlet@samba.org>
    Pair-Programmed-With: Andrew Bartlett <abartlet@samba.org>
    Signed-off-by: Andrew Bartlett <abartlet@samba.org>

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



