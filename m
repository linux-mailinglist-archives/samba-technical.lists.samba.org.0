Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA205ECCCD
	for <lists+samba-technical@lfdr.de>; Tue, 27 Sep 2022 21:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SZiWxTah5ONMY70ESV6E8If27ddOXC7wu6NbN+fPOQE=; b=CGbFQ974XEYlEtN8h2WFWRAkxR
	jGs4boDde+d2hPQPygNC0esOWfmQLASwyJW5QUqN+4tFw61fEKzCNvpXVrPBBoWlWbq8G/kw+T2OD
	9sYUFRy3Q5ttF2u9mFkAZlOZIE3n4rj3cRhDDVgEcYMlDznQUJz75+cW8uj53222vKDTfNSkkOPfP
	iAk1BWB4UUaGXOznpo3cDQ3ZzwM/yZWswUOG4USil5kwrVfZ38nA4LT5mD+MlUgtZ85txd/AT53jZ
	QJ3wozLvzO6tab6AAF8S/ZxfpWmiRiDdMihNQliiRC96Qs1XK9cI0JPLXexnSiPlUhfouaDHGO1Ly
	nbV+HEDg==;
Received: from ip6-localhost ([::1]:32876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odGAi-004Q13-Ty; Tue, 27 Sep 2022 19:23:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10034) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odGAd-004Q0u-Dh
 for samba-technical@lists.samba.org; Tue, 27 Sep 2022 19:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=SZiWxTah5ONMY70ESV6E8If27ddOXC7wu6NbN+fPOQE=; b=EK4kzI7LJomw5zReSulFW9wGMu
 i/2jtHJLsAcZuGB07z8WSFsqiJhOLRLiaZwCZvSuTK46wEZ3StNCHJDGAWGm1anHKqahUL/qdPTjp
 UddVNJIgjJcdDGqQBk60BM0d+sYxb2Ixv0x7LlpYhRCDERww54w1CZCU36rYwJc6yRoy1OCBlJF11
 KWUQLLyRjUkD4ccZYQ0Bukkm68ej4giXWRix0bi4tYpfDeOmabsiej6/fEqHcSo1vdGE3HTdpdMU2
 MKvuoeEyIbOhYycfwENP7fTcZjJSHXJcTHCeOWRG84cjtihtgK1PVsohaFbmdwxv/iKMDl/7VM+6s
 CBeTVLWYiImlpuiKelVGf2bUR0ID6HwXcjnxs9Nux+DqE4A01hq6Eb/9EprcB06DoYPc5E+B8xt8C
 obcK6a+rirdlnHKQwCA5pH9CyGNdyRTIlD6xgpIDAWAf0ccjHoU3+sPy2xBn8H5azJRdysDOxDIz6
 ZTLnewFlq9SS91Qu8W2uab+W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odGAb-0028HG-Rm; Tue, 27 Sep 2022 19:23:06 +0000
Date: Tue, 27 Sep 2022 12:23:01 -0700
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Message-ID: <YzNNlYhhff/Xt2bJ@jeremy-acer>
References: <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
 <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
 <Yy4uev/AGxGDAJB4@jeremy-acer>
 <CAPw4iV4xM0FEvPhbY-7S-uSdF9StW1ZeSniA1qoxzdNh9MdNDA@mail.gmail.com>
 <Yy4xsp3cNIp083La@jeremy-acer>
 <CAPw4iV7imoXjC6RdUttRkr5DkXbbMwFyynomQtR3R0uJRJzqXw@mail.gmail.com>
 <YzHX1mIyc2dQLdhz@jeremy-acer>
 <CAPw4iV6i7gHmVtWZhDTm726g82osDUQkdv0bgt8+2n7o-703FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPw4iV6i7gHmVtWZhDTm726g82osDUQkdv0bgt8+2n7o-703FA@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 26, 2022 at 08:53:13PM -0400, Nathaniel W. Turner wrote:
>   On Mon, Sep 26, 2022 at 12:48 PM Jeremy Allison <[1]jra@samba.org> wrote:
>
>     On Sat, Sep 24, 2022 at 10:17:07PM -0400, Nathaniel W. Turner wrote:
>     >   On Fri, Sep 23, 2022 at 6:22 PM Jeremy Allison <[1][2]jra@samba.org>
>     wrote:
>     >
>     >     This code:
>     >
>     >              * We're only returning up to 2 addresses per
>     >              * DC name, so just allocate size numdcs x 2.
>     >              */
>     >
>     >             dclist = talloc_zero_array(mem_ctx,
>     >                                        struct ip_service_name,
>     >                                        numdcs * 2);
>     >             if (!dclist) {
>     >                     TALLOC_FREE(dcs);
>     >
>     >     needs an integer wrap tests for numdcs * 2 before
>     >     passing it to an allocation function. Something
>     >     like:
>     >
>     >             if (numdcs + numdcs < numdcs) {
>     >                     TALLOC_FREE(dcs);
>     >                     return NT_STATUS_INVALID_PARAMETER;
>     >             }
>     >
>     >   Oh, good point. Updated.
>     >   Does the overall approach seem like an OK compromise for now?
>     >   Changing process_dc_dns() to do parallel pings does seem like a
>     natural
>     >   next step, but is also much larger in scope. I might be able to work
>     on
>     >   that at some point, but my time (and risk tolerance) is pretty
>     limited at
>     >   the moment.
>
>     Err. Can you resend the gitlab URLs. I forgot to save them (sorry).
>
>   Sure, the proposed change is at
>   [3]https://gitlab.com/nathanielwyliet/samba/-/merge_requests/1 and I can
>   file a bug and open a real merge request
>   at [4]https://gitlab.com/samba-team/samba/-/merge_requests if this seems
>   like a reasonable path forward.

This looks a good fix to me. Can you log a bug and create a gliblab
MR for me to review ?

Thanks,

Jeremy.

