Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410B78F49D
	for <lists+samba-technical@lfdr.de>; Thu, 31 Aug 2023 23:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=RpwdBzxXvt0gvFwyEWOHPyRxthQxQ6SzBKe/cAuJH9Q=; b=fBzwAQCuttAusrlQFQ2b2QzjkL
	pZ28/8RfvqUjxPIV6BJtLf30FpRWO5lq+9a5QtbbE20z6IK4aGrzRx6NNVejwLUNxctxgzs0Vr++X
	QGMHqPcqIwrxsJKVCR6bxoBNyOX8ZrhDquhLwmXrljnhGx+7Mx+sQNWZpDESvVOjowgyhyKQSLb8w
	lluIC/eCg+72LNYeygSlvO+Ii9Ce8H0NXVFbX4tTos6PMcVkgbdw2pT2sKicVj4JD3EKyNCClbE4d
	vO55E0GY/Jo9MyPdANWlf2/fvfQP01QkquVFBaws9NkUr+V96yIwwyS50kJ1JZkpnlqY1P5v0seKi
	gyH5/k3g==;
Received: from ip6-localhost ([::1]:37836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qbpFT-00Fqvi-Mh; Thu, 31 Aug 2023 21:30:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43122) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qbpFL-00FqvZ-1P
 for samba-technical@lists.samba.org; Thu, 31 Aug 2023 21:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=RpwdBzxXvt0gvFwyEWOHPyRxthQxQ6SzBKe/cAuJH9Q=; b=S6Vh7YRr8WolD0O1zndLJivDv9
 ZJIcONLIyhK1F33xEQ8mqCX2BT/mZdZOpJEo2G+y6ZU34fGBkEnjXkq8bcLn2tlfrUcNpbaMAE2Sn
 jtuvOaQwSoervcygATlvqeu8vksJ/T6eVsG2hnTFWn5PfWyKMSNXgnqTlJjl6CzNttFxjTUBQzNRb
 3CCJBqw6c8WATw2vQtt/DrDaV0Ag64Gccb6yTEdFTqms2f8LsHPWnxpmBpEhZYChLKbkn9iN5kpK+
 XvIMOXgujW/MOHuLeWGGh4+8ENV2xFt+p+O8h4MMrRsNbjZa0Sp2slejiPyxDMkgUCDBUw3cieNU+
 qAFgFEeNAojS00+fIF5IwdwUL3xZdywO+mfaaqyH0FwFwO4UaB6ktbvWcuDUFfeM+HPM4q0rj1Jvj
 kGXhgKQkxvkHUQ4WXFpeJAjWq7nCuBJZIIVg5JAJBekTXNTlzo+Ae7W8JxFGohSGiLEnElzHWOYsD
 176dnhy9mZwgCLB36gamJhFj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qbpFI-00B7PB-1s for samba-technical@lists.samba.org;
 Thu, 31 Aug 2023 21:30:33 +0000
Message-ID: <2c7d97fb-2258-2599-4780-970e2618aa27@samba.org>
Date: Fri, 1 Sep 2023 09:30:25 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: I used --enable-developer and all I got was this lousy build
 failure ...
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <CACyXjPwWBuAu0PkYz=5XrDH1R087QsSWFt-izTqdiu4YEPaW0w@mail.gmail.com>
In-Reply-To: <CACyXjPwWBuAu0PkYz=5XrDH1R087QsSWFt-izTqdiu4YEPaW0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 1/09/23 1:15 am, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> I user --enable-developer on configure and then built and got this:
> 
> --------------------
> ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c: In function
> ‘ltm_rsa_public_decrypt’:
> ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c:261:9: error: ‘size’
> may be used uninitialized in this function
> [-Werror=maybe-uninitialized]
>       size--; p++;
>       ~~~~^~
> ../../third_party/heimdal/lib/hcrypto/rsa-ltm.c:262:20: error: ‘p’ may
> be used uninitialized in this function [-Werror=maybe-uninitialized]
>       while (size && *p == 0xff) {
>                      ^~
> cc1: all warnings being treated as errors
> 
> ../../third_party/heimdal/lib/hcrypto/bn.c: In function ‘hc_BN_is_bit_set’:
> ../../third_party/heimdal/lib/hcrypto/bn.c:238:24: warning: cast
> discards ‘const’ qualifier from pointer target type [-Wcast-qual]
>       heim_integer *hi = (heim_integer *)bn;
>                          ^
> ../../third_party/heimdal/lib/hcrypto/bn.c: In function ‘hc_BN_get_word’:
> ../../third_party/heimdal/lib/hcrypto/bn.c:309:24: warning: cast
> discards ‘const’ qualifier from pointer target type [-Wcast-qual]
>       heim_integer *hi = (heim_integer *)bn;
> -----------------
> 
> How do I fix this?
> 

I submitted fixes for these build errors to the Heimdal project, but it 
seems it will be a while before they get merged.

https://github.com/heimdal/heimdal/pull/1183/commits/b1d19728db62c560951f4c023244147049151bf4

Regards,
Joseph

