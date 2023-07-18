Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF47583F1
	for <lists+samba-technical@lfdr.de>; Tue, 18 Jul 2023 19:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DlB8UMSFQ6PW/Mi0EtN94jEKTHNNOEZEHiYy1t7xU+c=; b=Zb45Ap3j07yFcK4zMJahHVUdmy
	nu0CcauNERnhob31cHj80socmoaMYvMyP+8KHfMzTMYFTBYDvp5lfaANOdsgijNnBTW5ztUhjC43v
	mkZFW44eKN3BHSzMhu5f5q3uQMImMPQJAS8fEChT2fRUESH12tR/cCLpvoJqjF7f5ADGrjVqPnjMg
	O/wL63UGRPdv9JCTndalr8wZ0NsD8/feP72mjChxmLIVo007j1UBTzuT3Y+fol9xn3sdGQ9L6TckG
	1Ir/o9TzMbIiupfkSPJXYpxtBupLB8LdULZDvNFTdj2LZFkkaOssLix4GbLYKvclybCLSs4TKKgWz
	I2KMdXMA==;
Received: from ip6-localhost ([::1]:59754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qLowZ-003f8y-72; Tue, 18 Jul 2023 17:57:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35710) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qLowP-003f8Q-Lu; Tue, 18 Jul 2023 17:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=DlB8UMSFQ6PW/Mi0EtN94jEKTHNNOEZEHiYy1t7xU+c=; b=IrxZcLq3wnJruWF0qRML2sjaER
 lGGT9PtEu3crKrONGdZwPBg9Kpt+jlu8iVZSsSOh7YB7bmX7dDn4ojaGoWzt3x1X0Ap0cNwJsLbTq
 jhxw+Y/cmdymZHUySkiXXcdj37uhfjFq45dyCqCkludlLfYph5I2BACogJJFusO3R6d/PxtV3iqsT
 zlZpuVBEksgBH1m+xCm+q7FeGjsImGg7KUgovVu90NeKuCAqLOy8ssb4kzsDjhHxpwreem/0MLwiK
 9vgkCyXqhVgzKURxZw3pW5dqM/lT1u65ou1KgmkyNPE2gg4KPqC1KggzSJOR1K3WdfLi+TyEzAG3a
 LdHgUmAk71Uyk33r+aqLg2Veahtcic3guH5iMKhQQytPssVvfK/4TdQYjz4bs7XuRelcJWyY8evgn
 zsYRZKmgLfi2KHNvrWBSfzt3w97IpEuwfBF0YapRhj6cQouqJSlVmhmpj22Sbwac7y/ahslQdvxVh
 gtz+PmvKHIXhri71NtvLx+Kw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qLowO-002fw0-1p; Tue, 18 Jul 2023 17:56:52 +0000
Date: Tue, 18 Jul 2023 10:56:48 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: SambaXP 2023 Conference Videos now available !
Message-ID: <ZLbSYM/3AapatEtp@jeremy-rocky-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Complete conference videos available to watch here:

https://www.youtube.com/playlist?list=PLbw4szFfveGoyJGxWdl5HddMTTySDYaW2

If you missed this year, don't miss next year :-).

Hope to see everyone at SambaXP 2024 !

Jeremy.

