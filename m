Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B763172BE
	for <lists+samba-technical@lfdr.de>; Wed, 10 Feb 2021 22:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2Mjak3p2a9P2JkTmemTymsbEeqh/kJm/VpisCdQcdY8=; b=fisYjEFw+YHJOCKK8uHXLRiCCV
	AkvvHCwehTd5K9WXjIOaqSYIL+Vpkw4BGQRNTrOXjBJd0AJarOShmPqEmJxgExBjp3NcZ4mXI1JTa
	zCYYbOCik06iBsq/akyLI8+QH5rkcGgHcoJeX+DLEug8TCfWQKTym5/Rlx0bhJhYDtGYXgtlw1R5z
	7tAdr+BYKaCGzr4EMdEM7rGkBUivziFNTXLJVJf+dWOLGSZ6EAIXclr2wq712xGBhQ9CUQvaWXkZX
	BCP7oIJaU6jPuvwpDTCuy7dtjzbzh00tLUjoJLC8dFGGYa1PwTCdt+qPWKE2v2a5PRGL1UlMN9TvO
	x4CTQm/g==;
Received: from ip6-localhost ([::1]:42520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l9xVv-00C7oD-L0; Wed, 10 Feb 2021 21:59:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9xVo-00C7o0-80; Wed, 10 Feb 2021 21:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2Mjak3p2a9P2JkTmemTymsbEeqh/kJm/VpisCdQcdY8=; b=jQjnBHmDZLUVCrB4gROxWwt5V6
 Dm6IM1fsjUkTWseU+UjVvTHR+2OSWsKhL/0+bnUzo/YdLEtj2uQ2q/p0LwHSeU6PmgIpRvgxXZwYA
 9X7n+P+N7n6mdz+nqeXEX/wbGJCTCAPOJnAtGsm9VWxhp5ldbOIwsmmuZwXUaVtHzt6qSydN9VShX
 0mfcFKLK5/X6mxjWMfpsdBvLpGBdJ8PyXbLuRLkK68r/3kFj+XrEFflWenqP2VzRyQb3/7ljdrKye
 VpIUpIjlowrGenQdRrjlBbT/C5R8oPKPZz/MXwPtMdWK6X/ZzlqO2g2Zgex4LgfT7YtHBVWtzKzhr
 4mPFYVYhNqqRu51TsadkY5jHLUaJokolh8TZyVBz08qD0HmViWy/p5Y5BMikKLoYoGFllYWagpe7f
 Ux0u3qjHWpex/hvV56P0sCPiwBEAqafI6JzawHgBL8PpFk58zgNsESVyYDT1romF9CyRDOlMFJM17
 1+9tOx/+wYdKyrgUoytrsXhG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l9xVn-0006Sh-C4; Wed, 10 Feb 2021 21:59:03 +0000
Date: Wed, 10 Feb 2021 13:58:59 -0800
To: samba-technical@lists.samba.org
Subject: Re: Conflicting public symbols... (Re: [SCM] Samba Shared Repository
 - branch master updated)
Message-ID: <20210210215859.GG328304@jeremy-acer>
References: <E1l9wbe-005h28-1I@hrx0.samba.org>
 <ce529d61-561e-aecb-86cb-5f51aabf38bd@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ce529d61-561e-aecb-86cb-5f51aabf38bd@samba.org>
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
Cc: samba-cvs@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Feb 10, 2021 at 10:36:18PM +0100, Stefan Metzmacher wrote:
>Hi,
>
>> - Log -----------------------------------------------------------------
>> commit 551532d007970ab11dca71b532754728a6a78496
>> Author: xzhao9 <i@xuzhao.net>
>> Date:   Sun Jan 3 13:02:18 2021 -0500
>>
>>     s3:registry Renaming get_charset() to smbreg_get_charset()
>>
>>     Rename to smbreg_get_charset() function to avoid naming conflict
>>     with MariaDB.
>>
>>     Signed-off-by: xzhao9 <i@xuzhao.net>
>>     Reviewed-by: Jeremy Allison <jra@samba.org>
>>     Reviewed-by: David Mulder <dmulder@suse.com>
>>
>>     Autobuild-User(master): Jeremy Allison <jra@samba.org>
>>     Autobuild-Date(master): Wed Feb 10 21:00:28 UTC 2021 on sn-devel-184
>
>Do we need a bug report to backport this?

I'll create one.

>There's a similar problem reported here:
>https://www.downtowndougbrown.com/2021/01/tracking-down-a-segfault-that-suddenly-started-happening/
>
>Does anyone have time to have a deeper look?

Looks like "-fvisibility=hidden" is the way
to go here.

