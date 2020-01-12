Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F8D1385E5
	for <lists+samba-technical@lfdr.de>; Sun, 12 Jan 2020 11:51:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xkEOajuxSnWtguGu+cW3JfRIPfrLCSsGTSxhoTIC2Xo=; b=A5RjN/z0ecdd9VBEn1M+B5YorN
	RmVZxWD90yThW8tvW/uL+6EwzB1QeobZ9o8sQsGXn/D72k0G8AiEUwdB3WlUxJlzUaGXTM1elI53d
	hgTLmNpc6ZtgaJCSEhgNjoPsHkdcAb94TddHA8CXB55sLPs0DljgxgF2pkTUVqDUYLagPmm+ORr2d
	TNP8bPKOUd3BmklpE7fKhhlObXU3ltbk95OMV+WEp6/cQA0ZMXKnFUizeVogCR1Kri3ILrE9CqWTl
	lHWVBnulqjMUozd9uzwQMtfIb6KfQgLaAixVSx15grW/DxWHZneuHVt/Bn7ASgCE5unF4LJPZfMU3
	44SN1RmQ==;
Received: from localhost ([::1]:54330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iqapd-0038oY-3V; Sun, 12 Jan 2020 10:50:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iqapW-0038oQ-Ru
 for samba-technical@lists.samba.org; Sun, 12 Jan 2020 10:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=xkEOajuxSnWtguGu+cW3JfRIPfrLCSsGTSxhoTIC2Xo=; b=i4uCvCuKcfw5ejTiurwArBuvM+
 mMGRPcEEHQ36ltmR0PIMD+vUXY4wl8yRl7nkJWYw4jVd9WDXFkECzZMlukQQqNkU8cAHJ8vPVQDZV
 W+7eygKuz/BR+8hTIvqBGFH7+cZ0YASNyEV63m0g5GmhNIyK4YRUeFrTvYF7iFLnR4KDMDU59n595
 27X5OlA3fem689mW6fBBUKM+s86DLYoQZOQKDipfY61NY+1/dlKTEggis7OxymA4t80YXmxuCJsEV
 sueNK5L2Erm9Kwj6OBDqgJgKIDQcfI3vdyXjNdHGDBHTbMm89NgKnpb6QiUEU824UV/I7Z7uu6qqM
 gzbx2aBn6nJX9hjVHnP62+zn2cwWxkrMy8dNtEaU+1ltM7HGLnwkdPzwduJRTtX/eXUMIgimwSfEA
 Fj/ReJxCXUkA54XOsjr85gIfWIzseFrpgSD4rqNrMwxXfeoWNx9EDhTO2V/APCLyOECcqrOEj2sgY
 q1VNXokZcRE/m6TRuYKk4yxK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iqapK-0008MV-HP; Sun, 12 Jan 2020 10:50:38 +0000
Subject: Re: [EXAMPLE] How to add a source3 fuzz target
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <5af970f9-d9e1-5993-f5e0-480139c2ad2e@catalyst.net.nz>
Message-ID: <433221e7-5dc8-36e7-3e91-9cc5374b6e81@samba.org>
Date: Sun, 12 Jan 2020 11:50:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5af970f9-d9e1-5993-f5e0-480139c2ad2e@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 1/12/20 um 11:00 AM schrieb Douglas Bagnall via samba-technical:
> Maybe you are a Samba developer who has noticed some activity around
> automated fuzzing, but you haven't really got your head around how to
> add a fuzz target in your subdomain. This message is meant to show you
> how easy it is. So easy, in fact, that you might prefer to skip to the
> attached patch.
>
> ...
>

thanks Douglas, this is awesome!

Can we please add this to the wiki? I'll try to remember to check next
if it's already there, otherwise I'll add it.

Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

