Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6F34091A4
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 16:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cddj7pL/PQz2mW8Hply9w5rUxGOF1H11TLFKdKfJTkY=; b=gtQrrooUykwETAvuZKQUXoDYVM
	VrvCHycMK9QtlAriIQ6d9qSIgleT9J3R5GuHqd0Fz/RbA2HGl+VfZdilX2UJwUBPPK2JQyPFBbrvI
	iPyKHE2PEkPkOcxKtoYfLgoms+LCwQblrBfEfo4y6dnLHCPxj2t8OetaWb9eKWHPBbkkGYq8j5znk
	SImJGOeL1mBaSNT8yDX55wG8MdLGApGOFqhpNCtfJ5nn38SmN7sMfbZt2U/2SVP0LQX6Yq4iff+Pf
	Tf1RBWYQ+lFcJduqLvqBiYJvCsCB7l926Bp92cbAiDuKkWRCTqCQNJYSy4FIWnuAfHO9C22zpePf+
	sujoAJ5Q==;
Received: from ip6-localhost ([::1]:42890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPmXB-00EtEY-D5; Mon, 13 Sep 2021 14:02:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47548) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPmX5-00EtEP-OZ
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 14:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=cddj7pL/PQz2mW8Hply9w5rUxGOF1H11TLFKdKfJTkY=; b=qtUbnky3ZjiOgCZFFUySrym/FN
 wFf3RltodxRR0oBaqSl+gpvKPT+eyhmKKiKshtWDn+aLMJDDDcOlhDfV0Borfg5eGisVGIAW6AHLW
 Th7QnPNpu/zc2o2p3Nf1pAlC6+FJle9QkD4+sBk//8ACRtGduA0imjaH6q7Y6/W5XJetyeJAp/Uki
 6YZOgYM//i3WVWSC7Ud6X2rzmNXYayNIR+HcksnAwnwGARKmc/XtoEEujTr6b9Ja7TQcKBoZ0IIG+
 zqODjYGSEZh6/g00aJN+Lg7431FBwcHhqC2c93UIOkPCRlYuZhIbS6f3gXFMc7TDD092H/vci/yQk
 r9dmg2c61AuztYD+/llrXsZkbeHyHVQESTSBE7/NH2p2O32YSyhtf6hG8y17VCHUmmhWLUPLX27FU
 xKUc+UJ1w532zZJTVmN1uXLov6Kg0jM7FcYw8jhw/h+K1xpK5sChcscfWPc6RVFH6ZyMGCiczp3PA
 DvZ1J0xky3V1qmaOT2bsndTM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPmX4-005yBn-Va; Mon, 13 Sep 2021 14:02:03 +0000
Message-ID: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
Subject: Linux kernel LOCK_MAND deprecation
To: samba-technical <samba-technical@lists.samba.org>
Date: Mon, 13 Sep 2021 10:02:01 -0400
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
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
From: Jeff Layton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeff Layton <jlayton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I recently proposed a patch to remove most of the support for
flock(..., LOCK_MAND...) from the Linux kernel. The code in question has
been broken for well over a decade, such that trying to use LOCK_MAND
flock locks is really just a no-op:

    https://lore.kernel.org/linux-fsdevel/20210910201915.95170-1-jlayton@kernel.org/

Samba references that symbol in kernel_flock(). I started to take a look
at removing the code from samba, but the work kind of snowballed with
all of the wrappers and indirection.

Would anyone who is actively working on samba want to take a stab at
removing kernel_flock()? It should be safe to just rip it out since it
hasn't worked in ages.

If it's not removed, then you may see kernel warnings on Linux when
samba tries to set a LOCK_MAND lock, a'la:

   pr_warn_once("Attempt to set a LOCK_MAND lock via flock(2). This support has been removed and the request ignored.\n");

Thanks,
-- 
Jeff Layton <jlayton@samba.org>


