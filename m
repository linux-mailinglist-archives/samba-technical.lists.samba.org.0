Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A36CB8BF5F3
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 08:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=I7fiHuzVVoLI+MWwgadC6VDw92Ega75pYvmkSYdtfz8=; b=IQS+FcsTrg4p5xYaVuV88hqgDL
	o+67Zodz8ULbts1bblNBbfGADdZMAOpylm7LYjeLH7oqf3YwsvRgrcKLlEC2VxS5M93IdmY5kGBki
	g+hAsIhOsT8Q9TrgSQhSOjA/smxeN9qDNHj4IRbm1CSFKrTcPWLrvzWejnZJVUy8bUB3gH3a+Rp2T
	pRDgMkDg60oDbikM6JYGeeiLgWzlnnNTbkhjOtAr/O85TxealMQfwv0BUPr760CqizAZBDY42+Vfg
	o2qXr5Do+lPCHvlrrBGwug0bNGVXdVQk2eHJjG0jfY8cR8WAXYJBjgjJtrtdkAyDUJOPJVQdrwICv
	rUC2YAfQ==;
Received: from ip6-localhost ([::1]:52334 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4aah-008TYG-FO; Wed, 08 May 2024 06:15:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16170) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4aac-008TY9-QX
 for samba-technical@lists.samba.org; Wed, 08 May 2024 06:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=I7fiHuzVVoLI+MWwgadC6VDw92Ega75pYvmkSYdtfz8=; b=LN3K8EVn0T2hr9Zr4+5tpfHR64
 /YanZabhVvwa5+OrkPinRxcJXvtqEHjC4AXER9b51OFG/hlrD3zfAJKdFTycFiRr1IFYXUQ/yKQ1W
 ubLbshkHeQ1zBO89rAfzA5HRwDGPd6Me1BcfHIKCahDpUQDbOK/BHtqoNnCFqyeXeIWGUy0g9cCBD
 z263YgTZ8pJXTUOFpyJcyFxcwtF9rOBsmU2+gbsI4HEwsaBnuEdMs04E2i9tflNoiInvI95xeYDdi
 RnjBqNOjM9DVQNw3IDvIe/IUSldugY0EolXcdD96p8YZtlb52K3gZgSn52D77Nqg8wAuTghkOBMHw
 jUjzaSI1YL9nPLXoEawr8ELbKzEzY2sHZOxSv0rbvc3sE7Y6vUHdo4MeLSNChsdLYEut4KRcsWQs6
 dU+yd2cNS5n+jdx0oje9MDHbujqORt/olpUhsP4vrKNX25sFm7q3bW+2tSpEas01a/t1HyXJJ5gwf
 LGg9QTEhJB3cvDwPV6R0twan;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4aac-00ALnH-0X for samba-technical@lists.samba.org;
 Wed, 08 May 2024 06:15:42 +0000
To: samba-technical@lists.samba.org
Subject: Gitlab CI fails
Date: Wed, 08 May 2024 08:15:41 +0200
Message-ID: <2650765.fDdHjke4Dd@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

the CI fails for me for all o3 runners [1] with:

[70(1029)/303 at 3m36s] samba.tests.ntacls
UNEXPECTED(failure): 
samba.tests.ntacls.samba.tests.ntacls.NtaclsTests.test_setntacl_forcenative(none)
REASON: Exception: Exception: Traceback (most recent call last):
  File "/builds/samba-testbase/samba-o3/bin/python/samba/tests/ntacls.py", 
line 87, in test_setntacl_forcenative
    DOMAIN_SID, self.session_info, "native")
AssertionError: Exception not raised by setntacl

I can reproduce this locally as my home directory is ext4. On gitlab runners, 
the filesystem is also ext4.

/dev/sda1 on /builds type ext4 (rw,nosuid,nodev,relatime,commit=30)


The is no comment what exception it is actually expecting and why. I have no 
clue about this code. Could someone who understand what this is supposed to 
test take a look?


Thanks


	Andreas


[1] https://gitlab.com/samba-team/devel/samba/-/pipelines/1282142686



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



