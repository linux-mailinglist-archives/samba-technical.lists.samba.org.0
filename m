Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5644E9C00
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 18:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=FMa69ynIDe4+vxPCmJfU6qeHFC3hWjX/JnpxJqVVqaY=; b=GtNBh8WcWrMuka3WHlDNj+5gs9
	4edHvcr6YkTrv3V9FnHG5DOMLmlv9YUcyg9iQRIuKgrcnLWDiP31XJRG5RN0Zlz3sM3I2OerXn+a0
	LmXf7stKuJIMCt5rITFaDCKHB6I1d7l49Y+4glWNs9YCrmDLKd1ILxg4S29sYb4m8+UPZm7FHtLLP
	t/QrIx+/h5Gaix579LQuyHnAewhGfNjLjkj4tKlvsXdo/6C6eBTRvqHoKgMPua5BGkRz4xX5jZ1ax
	yca5NfOl9UTCHE4ITB60HLbI4WvRHeeYNNgj2tIUpIhFpoSFKFEuTOSj+VUcdB3NFWdfUTewXTrei
	LTKK/tpQ==;
Received: from ip6-localhost ([::1]:45310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYrxo-005yrA-5F; Mon, 28 Mar 2022 16:11:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37950) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYrxj-005yr1-Sa
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 16:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=FMa69ynIDe4+vxPCmJfU6qeHFC3hWjX/JnpxJqVVqaY=; b=wh5B0MoSpjTullWge3z9gdhDY0
 leRd06ZUCdI6/C24g16m79KXbtpZcIA9p6v4kqoGlLVid/zBJBVue9Lxrv/yRSSY4NdYUom/u6ROK
 2OhTGKbTBdNbfhdqFmOSQ5AyOCVXBcE/ghBsnkfqGfrRr+o/duF4g3PNDJsI7QLyA0PtmQ1Ifksw0
 jvXcO+4mW3ohcgxU3j2NOPybdCJtry8HTlXGcmBuNBeAFqdiO4zI6Q1KjiVzOjoZLKKKVbtyW/YS4
 IzLbg1FPm+nfa28JEeOxkSzLPomwc7KwxcfC1vh+fp0uBoV2oyUNEz1v0G1TBtmflY2CONODOZ/wB
 P8qIh0MtX+onh8vWmPVmzja7U3gyFXCWtqQ0rbfav/SYYZUWLKuvtJPW8/AXZlrHSMP/UE9Ugl7vS
 6SiOSfn8hJojjLTU3OSag8R6DQyGAZz2t1Eqh5GTsHVj5d1Qbr5GiMSUsjzKU93zIWwLkAyKpDIgS
 xOz4guEbX535dQrbySRpQeD/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nYrxi-0041wd-Mc; Mon, 28 Mar 2022 16:11:23 +0000
Date: Mon, 28 Mar 2022 09:11:18 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Are there Python3 libraries for the net commands and etc?
Message-ID: <YkHeJrztO2KnRMpn@jeremy-acer>
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Mar 27, 2022 at 09:21:38AM -0700, Richard Sharpe via samba-technical wrote:
>Hi folks,
>
>A lot of system management scripts these days are implemented in
>Python and I am sick of using popen and system in python to run Samba
>commands and then grub through the output to figure out what I need.
>
>Are there any Python3 libraries that provide the functionality of the
>net commands?

I don't think so. The only python SMB stuff I'm aware of is:

https://pysmb.readthedocs.io/en/latest/

I think only Samba does the management stuff. However,
most of our management stuff is drivable directly from
python, as that's how we do much of the testing.

Talk to David Mulder from SuSE or some of the Catalyst
Team as they know much more about this than I.

