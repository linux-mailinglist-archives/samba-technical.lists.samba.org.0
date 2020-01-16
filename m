Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE0113F9AB
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 20:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=vqIq7m9LJoSFbxTuAHE01bgbz4F+nCAnuVHHSwS8W1A=; b=uPr4Sy+Ny4XvjYYp/iiQrlj1xQ
	bxu6hNv9iZuUb8615uiLwGso/YWbqVt5inWJbJEyIJHTB9c5TwSUVPWl3E3oUGU5ODYFagEXtuOE0
	TqIc4vkfV8YXKG+3BPpWGiFlkAk8DgrlzAqYoLDdR4mtwTBlqHp0s1spvCnP/lQVe4b69SmxjVJNm
	qNimajV2wpttnoF4bucuKWgkkRmYOpEyg7D0xJejiBD6d+ua/K0iSv7ITsA+pseZcyZS6eWJUNGuK
	JePtZm99GcJGbqgYWDGFMyRXr83mxARduYp91eJL3qLZkOdSnXotC9RnStXlaPJ/B1SXb4XMpuvsJ
	JCKk/P6w==;
Received: from localhost ([::1]:44988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1isB0h-003fVl-CE; Thu, 16 Jan 2020 19:40:55 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:42294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isB0Z-003fVe-Dm
 for samba-technical@lists.samba.org; Thu, 16 Jan 2020 19:40:53 +0000
Received: from [192.168.1.7] (unknown [114.23.145.136])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 93BD18102C
 for <samba-technical@lists.samba.org>; Fri, 17 Jan 2020 08:40:30 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1579203630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vqIq7m9LJoSFbxTuAHE01bgbz4F+nCAnuVHHSwS8W1A=;
 b=TzNL/RfagHMneiiyNWHCHXOPVGLGbM/2F4qRB6pQC7yc94Gn93RXEVzkY3JWtgXmrVNvcA
 lXFKNovzc8BI4HjStR7MuLvchnOulBt1XwfIsKQiAlNRef3iV5kuhj6Z9ZtSJJMnHhncOp
 64FbInmWeNcwo7W9ABLBf3/37Vi8e1/nb4dT/95W0p4NYcLZVTNoDxl8/F6zVg3Pg3ZlKq
 niRt37Chqohb6eks9hTeYbcqBnu+9p7kU/s5XftGTETkZ/f4VjTj+NGAH+barntPYgBtrP
 V6w2ruyYJhYGeYq46xA9EGThFcR58JApfCC3rbDO78CfHZ787V2xyz/D37Jx3Q==
Subject: Re: fuzzers
To: Samba Technical <samba-technical@lists.samba.org>
References: <2546695.cijFyKqbAK@magrathea>
Message-ID: <771289d2-0884-510d-7f11-2a245fde3cdf@catalyst.net.nz>
Date: Fri, 17 Jan 2020 08:40:29 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2546695.cijFyKqbAK@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

To avoid duplication of effort, I'm looking at.

https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=20083

And have done initial triage on :
https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=19820
which I'll look at next.

And https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=20055 may have
been fixed?


Nga mihi
Gary
On 16/01/20 10:58 pm, Andreas Schneider via samba-technical wrote:
> Hello,
> 
> thanks to all people who worked on fuzzing Samba. This is a great addition.
> 
> However before we add *more* fuzzers, it might be a good idea to first fix the 
> bugs found by the fuzzers ;-)
> 
> I will try to look into it again the next days.
> 
> 
> Thanks,
> 
> 
> 	Andreas
> 

