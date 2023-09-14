Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E6A7A0D74
	for <lists+samba-technical@lfdr.de>; Thu, 14 Sep 2023 20:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=OLckl+iGor+N6gXY/pLlUYm2pUFzgmbGlMqkP5WmkSA=; b=VQP4GxGPXPMmKstfnoSQuN3qkr
	3CJJSxZyTiIEaxi1tlMHbqJ6kyAUKZqYL9kRqW7sFjmrG60BOLw2fSjOQeYeD2uMKIINAeLhxwRHi
	7z3R4Jr1QcnJBavRY4ZxKnuZfq3njIZLsvcfts6RCIn93iiznz2Qc0+YAWgfveOo2McKpr/bsxvWe
	t6p83zsunMvGfNsV3qzBDSu9YIFzwvHgcm4xbpidoby3ryAXHqGpPoQTevhgfNt+8TiJZxg1ZdMgQ
	Zckhv3xygaztgipXhPMzrLiz8DNervKFITj00ptSepNtAYIUIRSrDakUNUQRjBVHMGM96KOEXGtV9
	ZMFVcuRA==;
Received: from ip6-localhost ([::1]:63070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qgrMN-004Q4d-Em; Thu, 14 Sep 2023 18:46:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qgrMH-004Q4U-DD
 for samba-technical@lists.samba.org; Thu, 14 Sep 2023 18:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=OLckl+iGor+N6gXY/pLlUYm2pUFzgmbGlMqkP5WmkSA=; b=SjVJMAA/nmHBC8xxFmcg5fK13D
 yDTfaXqG9r3MXN+7f/m09it5qgFN5L07JkjBgjmsYl8HnSOpO7rlM+1o32sDhQOGtSN7Y6j51MeWz
 LOO8+rh3oJVeuZLu0iLhNuYrJ3WgqT359c12fzF7J1HT203GQXczg6cPOtaMRWYBsf80wNjngtpMA
 GoEI88dxbxV8onruHHFtCWYwOa+RcVS6fwAopHGrYkk3G1tlPs48rzKhMzrZzc69Uo/6MpDBjVgRe
 vXCjlUpvwA+Kzw9F74PmgBC5bUJI67RykOOsnC/p3TWQSMVMlHSgHJ0wUOt+H4CQ4ApW6aj/pDbni
 9VxyAlxibyIMfARrGOIDBpQOhgPPmvS0aqMK875RqeOcsNrg9gYyvoAa59YF6RK9CUuzuxyTzmaij
 HhWa2PoG2mmfQrDJQpl/WK8EY69Iwa6kYbENxSG4y3zwenvGoGB90Fk5UoNyRUg76YIR8pMubQood
 E3I5s58uasvyAPv55THe6ovF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qgrMD-00DY1i-0t; Thu, 14 Sep 2023 18:46:30 +0000
Date: Thu, 14 Sep 2023 11:46:26 -0700
To: samba-technical@lists.samba.org
Subject: fstat on Linux in glibc is slow !
Message-ID: <ZQNVAogyt9Wfmje5@jeremy-HP-Z840-Workstation>
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
Cc: metze@samba.org, vl@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

https://lwn.net/SubscriberLink/944214/ca0c0f366ada686a/

Maybe an easy performance win if we use a replacement
for fstat until this gets into glibc ?

We use fstat a lot and assumed it was fast.

Jeremy.

