Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D833C400E6F
	for <lists+samba-technical@lfdr.de>; Sun,  5 Sep 2021 08:36:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WvHV/Ki2MM7rl3uq/j+V7Dls5sbmHAF6pLyenOV6hfk=; b=nCc6OyzFfmZUM3o/5Qx7xGwZUw
	XyqJFjbIefhcqj+joG+WRCOoZjp1SdNz2rKp6yASUNORoN8rIYrrnXuqXjufYNYx0pBQqMXfWbY4a
	kXBppjwdiDYclalFBJMeDK8EpAB1EUWHkL2ovVXNWs/jPTfztioeDlmYemsKMBgqRMhx2UuYSAMoC
	vQ4qn/HCCxflWlUikzEb+7XU9AXqGMfSuTwGoCtz5JW4QpkHwBrs3yi8gNTGQDhD18GmcXK8rGl8Q
	LjL4qz9FVGQh0EGqLtUnbKJvhHLCEqBpCE6TaAma2k/n6Jtqvy0QJJVxUnPcOZA+0Th9wqxhiqZfF
	3k9NLDqQ==;
Received: from ip6-localhost ([::1]:24936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMll0-00DNMd-QO; Sun, 05 Sep 2021 06:35:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37477) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMlks-00DNMU-9s
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 06:35:53 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so2333775pjw.2
 for <samba-technical@lists.samba.org>; Sat, 04 Sep 2021 23:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=WvHV/Ki2MM7rl3uq/j+V7Dls5sbmHAF6pLyenOV6hfk=;
 b=PYtD0/qhDs5/Xh9Edfa+MN/OHBTzmj9bPb125V3XbWCdxg0WmtroeOO1f12GGWsa3i
 4A9GyNv7vkZdIChMmcRVMD05MgRW0nk9BEvo1S5B4M2LSnQmC4EZf14iQmlvoS/KQXoL
 DQSFWy6C75C8EkUJsKNUBUypEFSBFi1CT/4r/w5mqEpwTSZHbCYES/nSAU9Rckf8X5Fx
 cywlSgFhiPUIT6Ch1rYR/+FM8qqBmoMH+6E9xLiIBhJsIOB/WSV+3Y4wpI/QuT+BGJ+z
 0jI7EXUSVLs0IGTwwoUBtZTBRNw3LyamMfk6tUEhfXBd4XPXQNO8YDgeqkIgoKq49+hs
 o1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WvHV/Ki2MM7rl3uq/j+V7Dls5sbmHAF6pLyenOV6hfk=;
 b=QqYZQA7pOiUOiO2+G5ZgFZXBLf6oLk8Fq/YmoM3K1n3NPkk42gGO2livUbQ7szgR2f
 0dDrojydjVjnKpam9SNEve9gqcfd6Hyat7l5bSm91h2nNNtt2TNMvmpG6bPH4D8VfdWP
 kaw/Vyy3cG3/X1ynDphVSbwYnYoS3AfQWhpy2sKIkKnjEiUnDf3BmwfO3qdybha1p3Gm
 p4cmSVazqv9BBy59GHy+nK3H9EyNcV+CFnY5h43INaGLT1Kn2dE6/eCsMDPmY9M3mk9i
 WyFnBwuk9SMappZb5DCfCPZlCL4XHv2r6IdtKpT9Re9slK6ycpqQuQl63qxPEg8deWvc
 oR7Q==
X-Gm-Message-State: AOAM530JoEueHCWzGei8qYJVFs6h7fksw18fHPUbsufK6+bhyKMPvLzP
 RkIUwf3PkFWWyi4/u1xUqw1M0oQCkdeJq5qd
X-Google-Smtp-Source: ABdhPJz296PPb+8WnKyNmyengIUlNRj+o4zr9fFCw5CJrF76AMpw1MP+ToMLcsoVF6galSRsFMevPQ==
X-Received: by 2002:a17:90b:e0d:: with SMTP id
 ge13mr7736349pjb.53.1630823747623; 
 Sat, 04 Sep 2021 23:35:47 -0700 (PDT)
Received: from ?IPv6:2407:7000:96b0:e500:e733:ba37:3588:8ee8?
 ([2407:7000:96b0:e500:e733:ba37:3588:8ee8])
 by smtp.gmail.com with ESMTPSA id z8sm3786091pfa.113.2021.09.04.23.35.46
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 23:35:47 -0700 (PDT)
Subject: Re: Help writing new SAMBA_INTERNAL DNS test code please.
To: samba-technical@lists.samba.org
References: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
Message-ID: <b4d9fe78-eccc-49c0-23d1-61dce244a5c3@mattgrant.net.nz>
Date: Sun, 5 Sep 2021 18:35:44 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Just wish to offer my well appreciated Thank You  to all those who
helped me get this going.  Merge request is ready for review.

Regards,

Matt Grant

On 31/08/21 5:20 pm, Matt Grant wrote:
> Hi Andrew!
>
> Have not created Samba bugs for the following yet, as I am trying to
> get the hardest part doen, writing the test code.
>
>  1. Dns server port number specification for smb.conf 'dns forwarder'
>     server list
>  2. Restricting the dynamic DNS update ranges so that the
>     SAMBA_INTERNAL server is not spammed with IPv6 PD addresses from
>     the ISP.
>
> Main issue is being able to dynamically change the smb.conf setup for
> the Python self test hookup, for 1, specifically within
> samba.tests.dns_forwarder.  Being able to do this will also make 2 far
> easier.  After looking at the test code set up, I can't see how to
> dynamically change the smb.conf file in st/samba/smb.conf while the
> tests are running to set up for testing the port numbers or not.
>
> Would specifying a 3rd and 4th 'dns forwarder' entry be possible?  I
> just don't want to up set the already written tests.
>
> Best Regards,
>
> Matt Grant  

