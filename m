Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE895EDB42
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2019 10:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IsGpomh1T8kyUIWX4gFsiHREjQ+f4WAEnIpLYihTwjw=; b=I4tPRxMZTFzKOMaRr1FNNL176t
	48gmC6LY0KN61xhqlJ9Um8Hh2gX2WuJjMoSojGcUQYGQxaNqN/K6C9fFSMtxIodyK34yFsaizCgmP
	WUfLcJkuU07VSVldaJvXo9Fe5+7OzDi9mPg6qidqiuh0SP7dAeLArqsrhHCTdbR93NExio+yxK653
	r3p72ppQyzzibwDcxlKiYN3dsRqCvBHaIRb4uVHBv9pKjbIrZDS6frI5NbLPY6xz6aiSBvRKlH8Xv
	64pfrV2qhXJBGwCo67xOjfnwXNkYdRy6GdIBKVDMK7mxmRAPVYNMj8TGmGGFCQTgcPqnlJQgjslgq
	/44KZvhw==;
Received: from localhost ([::1]:63160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRYJv-006SGu-Or; Mon, 04 Nov 2019 09:06:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39310) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRYJr-006SGn-BK
 for samba-technical@lists.samba.org; Mon, 04 Nov 2019 09:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=IsGpomh1T8kyUIWX4gFsiHREjQ+f4WAEnIpLYihTwjw=; b=cYICQh7C45lRE9yU2yx4jILrjK
 s5QQDXTSnvcgGSiwSZbkDDwulUu9g1OlmnEgLxJrUEOQNaonE3mdK2MHKLmKi9Mx+RnmZ0bP5vL8W
 t1eOVY6TcoHSKt/l9HGHHbOrZjf+s09Z7VVi3OkYAdY9Palcn/vjWWUDIx0Kdg3cgBPg6GldZY8l2
 85egfzsozSkY5GWELDLeSEY8sdFVeAz9Tt9q7aDBlQ+AXZds+RlZPtCsQ1+CmB/VNpwC7peaOv432
 0EUZYuuGYmUVtLRhoLBy+rU/bhtbL2CLbIs8mIW+0d29AShXc8wWAVZBpqhB0JEndCDO9wyjXWASr
 M5geweMbr8CNh50BO2hE1IVD/UPUeIK3oM7g+BegnvGrpQkDQ/WdEsTvfRJ4hF5nQrR+eQPDlTIWs
 lG4LvpSte/eCl270OJ09FA8Vk/51og2KgLNGj6O9cGVQSHijiSkZS0h3S2XXnz4TXYzVyk/Y/66dZ
 TXtXNYKeKIyCGKFZAXmNjrME;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRYJq-0006Wp-OS; Mon, 04 Nov 2019 09:06:38 +0000
Date: Mon, 4 Nov 2019 11:06:36 +0200
To: Ralph Boehme <slow@samba.org>
Subject: Re: [PATCH] s3:libads: Fix mem leak in ads_create_machine_acct
Message-ID: <20191104090636.GD32459@onega.vda.li>
References: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
 <937a7927-14e4-be29-a1df-37d19f5999c4@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <937a7927-14e4-be29-a1df-37d19f5999c4@samba.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 04 marras 2019, Ralph Boehme via samba-technical wrote:
> On 11/1/19 8:59 AM, Jones Syue via samba-technical wrote:
> > Hello list,
> > 
> > This patch fix memory leak in ads_create_machine_acct,
> > samba-4.10.9 included Bug 13884 and introduce this,
> > please help review and push, thank you.
> 
> lgtm. Can I get a second team review please?
LGTM too. Please push.

-- 
/ Alexander Bokovoy

