Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF35283E2
	for <lists+samba-technical@lfdr.de>; Mon, 16 May 2022 14:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=NvnP+q+j1e57Dqm+7rQm4GFL+641vjJs/R4/gjMMtdQ=; b=izzjUroimrM1KXZ5SHXLlSD8bS
	cOwptqRk9widsAPEfTvpaJJVp8kfzAVRGldV8ZKxkl56w4APFGcWZuJkEtaVlTL6/SbU9TFNnl/yr
	ppxNcUldJ19HZyVpQ/omHnB9ynSgxqtkfwP0CPp/3JFpbutjLJ+kIHLzA0+Sl1rp7YxNBufEbF38k
	LlqskVbRuGQrS4R0193+30bKHI7xOZkkeOVWa2qK18yAUKH6UipQxGec8bTJAlDnvbvC4EQW49tj/
	WyX1GzE1F72sA735WDaQc5h5LwlTiuqjK7ZeUW8AaBpqcSUBz+O+3/7i7P9O4qubxQ5QK1zR88uVq
	rati4+WA==;
Received: from ip6-localhost ([::1]:36802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nqZX6-001X3E-TO; Mon, 16 May 2022 12:09:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61606) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nqZX2-001X35-2C
 for samba-technical@lists.samba.org; Mon, 16 May 2022 12:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=NvnP+q+j1e57Dqm+7rQm4GFL+641vjJs/R4/gjMMtdQ=; b=MLlW4uz/cVjI7PZXoQj6YYAt07
 caBYH259d58vniteCDP6eUlIzS+WUHYTMe6dtJkfajnBns9EOssUaYudHWkCrTSPfuG8VX121m4wH
 Q05bQeLLbFGwYv6VE+MU+2rrMC65mXbqjbfP7uVUovXJTxhRHoOEw9aZGRw7Mdpc/1SOHaweJdz1W
 6QP4jG0kaXX84I4RznCmsSAdaCcd2ibJflH+c1jqafK0t5lgdAGQaA8Uhxa1SkPjv+50NFZl48kKV
 hBrhp1OTmev9jczHwbaBc7JIIxwpLnSszeX8rmVCAQSVUHqejibHN++JE5MnCpY7MDi7xdufdZ9N+
 vHn2JSWADm2y6JSAdyacB4lnY9To4i1lsWw2TeLPP/86I57eKGmnG/RRsBn79UuIJbiaOf2w1kjxu
 WFqc/aqN2bxdNe8mZ8qfa6TkyvF9hq5JEq7+t5layz0sGTBfr3TAMKWypQ80Xp/fSmDwJ9s96x48B
 rGJpwRlpGt7DNCfgLEym+Qrk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nqZWv-0018SI-7c
 for samba-technical@lists.samba.org; Mon, 16 May 2022 12:08:53 +0000
Message-ID: <7f196939-bd37-7dcf-8a5e-54c567175642@samba.org>
Date: Mon, 16 May 2022 15:08:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: A blog about my "Dollar Ticket" attack (Nov 2021 security issue)
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <527f79427e6de47e8e367596ebf4795dcbb16e36.camel@samba.org>
In-Reply-To: <527f79427e6de47e8e367596ebf4795dcbb16e36.camel@samba.org>
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
From: Nadezhda Ivanova via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nadezhda Ivanova <nivanova@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Great article, Andrew, thank you for sharing it!

You and the Catalyst team deserve a medal for your immense effort and 
your technical brilliance on this issue!

On 13/05/2022 09:22, Andrew Bartlett via samba-technical wrote:
> I wrote up
> https://www.catalyst.net.nz/blog/stay-curious-lessons-doller-ticket-security-issue
> to explain a bit of how we got to the big Nov 2021 security issue.
>
> I do want to say again a really big thanks to everyone who stepped up
> to help us in the rush up to November last year.
>
> Also, here is the puff-piece we wrote up regarding finding the issue
> https://www.catalyst.net.nz/blog/catalyst-samba-team-fixes-critical-microsoft-security-issue
>
> Oh, and one last thing:
>
> https://msrc.microsoft.com/update-guide/vulnerability/CVE-2022-26931
>
> is credited to me.  Fun times!  MS hasn't put as much detail out on
> that one, but I'll talk more once that is public.
>
> Andrew,

