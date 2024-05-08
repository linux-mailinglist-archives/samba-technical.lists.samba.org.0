Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D028BFCA8
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 13:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=hlwXoZBgukHYBAoIDumlXznWODYb9UB5RL+B/9oVS/Q=; b=2WN+Q2lBUmOqACjVOHnmXg7Lq2
	Ql1fx0GWMd7AqZqq0cjFWZNI1FproM7fed/QPLx1hHIaz0Hki06YTEjnxuK6rR95DtoTaSk4kamuI
	AeOxqEtScATxcsxw9Pztb2jiJmaDTJFfY69eRRFqnylswd8vl3DEAbCYTHkXHhxeamsnF7b4jZFlq
	//0hYrg5P9YRdHCQSo2WcapDMuHZ9SrFw1ULdvSbrTLnSS7CeY8RKH/j6fEzKgr5QBZhcQvOpjpYA
	S0BwRW2nyysCmTbEQ52oCzlcQxk41OBDSlMxmZtcklqwlZwHdfZ6xBpPs8dYXaeH4hlGgmKf37lgU
	MILKwNVA==;
Received: from ip6-localhost ([::1]:22348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4foR-008Wh0-6L; Wed, 08 May 2024 11:50:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22122) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4foI-008Wgt-A0
 for samba-technical@lists.samba.org; Wed, 08 May 2024 11:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=hlwXoZBgukHYBAoIDumlXznWODYb9UB5RL+B/9oVS/Q=; b=LIK6A6+pHV1b2YjQjYOAuKdKX5
 1sfuwYLw7EbGGNL+V7K4FAs689BJsOCisTTH6SRcy4AkgGzvTslKus6q0NDc8S5JmhS+BkCF0Gxx6
 1jwV1/xGENSTFjYhXxDb/ZWtXqAwKEM7ydU5KYvQD3p+ZUtPztMUmka3RDHnx6379Z+Wh7ozD0pwL
 heD2kmyDoXLQh4AqbEkdpbLdXIqc8urNU881L1+U1HG8vSfu9PNvt/UfTQ89RcYKprQJHa5C96ssR
 bRCmxGPb7Apb0CVEd8kTuVSKqnnAbUebfEj/Vi/QJasr+uIsXLiW2EBm/NsFwwba/IPF5WTVFXWNw
 7zIJpe/4khWb4XjZyZr9ukbPp2ma+zVRrAjw1V4lezR54lFttfCJl1R0H9mwfMMKHCy0dK5idL9oy
 cScTK6RFjPWEjKd++D8k5qO1sYM8CXkbJEuwZ2Z9pOIawJ2feB8noNPM9zv9KEuFaNGtuS1UqUSz4
 rpvuotNNoeoN4UN1krQV4zX0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4foH-00AQZk-0f; Wed, 08 May 2024 11:50:09 +0000
To: samba-technical@lists.samba.org
Subject: Re: Gitlab CI fails
Date: Wed, 08 May 2024 13:50:08 +0200
Message-ID: <2823827.DJkKcVGEfx@magrathea>
In-Reply-To: <2650765.fDdHjke4Dd@magrathea>
References: <2650765.fDdHjke4Dd@magrathea>
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 8 May 2024 08:15:41 GMT+2 Andreas Schneider via samba-technical 
wrote:
> Hi,
> 
> the CI fails for me for all o3 runners [1] with:
> 
> [70(1029)/303 at 3m36s] samba.tests.ntacls
> UNEXPECTED(failure):
> samba.tests.ntacls.samba.tests.ntacls.NtaclsTests.test_setntacl_forcenative(
> none) REASON: Exception: Exception: Traceback (most recent call last):
>   File "/builds/samba-testbase/samba-o3/bin/python/samba/tests/ntacls.py",
> line 87, in test_setntacl_forcenative
>     DOMAIN_SID, self.session_info, "native")
> AssertionError: Exception not raised by setntacl
> 
> I can reproduce this locally as my home directory is ext4. On gitlab
> runners, the filesystem is also ext4.

The test succeeds if I run it on btrfs.


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



