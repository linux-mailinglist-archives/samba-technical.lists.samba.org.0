Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E014EF9CB
	for <lists+samba-technical@lfdr.de>; Fri,  1 Apr 2022 20:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=vgH3oTUCCjmhMRh3LwU/fUE8CRkgkWopw63cR0Cl+fM=; b=Hu829aAJ6FRas/SNh7HkLzVji5
	PyzggUxLg/aHNp7PeHMME6M4ItfZdOpJX92JFH9kbI0ifz3RWfJUgT2q1JMUjlYIbHP2pCxglYKRR
	Ky+Pjvf3bfdF90OfOZbyG+VVOrC7UsHZ63QNaC9efwHSkNvKtr1X1Jjk/Kqp4d9CX0M5BlK2qLSPu
	+vcZx3kfW0+8GLa65kON04hRrL6yg9nSb6irs2qz45tpnfC57lKLC+pAF6s0i+8iLUEiT64xfWI9n
	3Oslw5eiW8CYMt2SbueXWyi/+DKvzi8rHYhJxT0zvLPQDMV24jfKnmgBx4PPfvnAUMNaw+7qOJvTk
	OYpAzzpg==;
Received: from ip6-localhost ([::1]:39514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1naLvt-009KTW-8L; Fri, 01 Apr 2022 18:23:37 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:34709) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1naLvo-009KTM-Cu
 for samba-technical@lists.samba.org; Fri, 01 Apr 2022 18:23:34 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 14F594001E
 for <samba-technical@lists.samba.org>; Fri,  1 Apr 2022 21:23:30 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 797FF36F
 for <samba-technical@lists.samba.org>; Fri,  1 Apr 2022 21:19:43 +0300 (MSK)
Message-ID: <93ff600b-e2e5-1bb1-7f7d-e32ed4cda438@msgid.tls.msk.ru>
Date: Fri, 1 Apr 2022 21:23:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: submitting a fix/patch
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi.

Samba wiki describes how to submit a patch to samba,
and it shows gitlab way of doing things. Is it the
only way? I mean, for small things like spelling
fixes, one-liners, is it really necessary to create
a gitlab account?

I created a bug, https://bugzilla.samba.org/show_bug.cgi?id=15039 ,
with a patch in it, - should I create a gitlab account
instead and send an MR as outlined in the wiki?

I really hate creating accounts everywhere just for
some small things. I already have 3 accounts on
samba (wiki, bugzilla and mailman), - thought it
will be enough, - but it was before I read the
"contributing" page...

Thanks,

/mjt

