Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54A138D4B
	for <lists+samba-technical@lfdr.de>; Mon, 13 Jan 2020 09:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=AQNPai5uJ/qfsNx8VZSkwTka8wByDZLY++6vOOKEa3Q=; b=UDT366NO/NscHDA2GzI507yADd
	kYEWANOlJRtR2F7zocun+ZLGBiKx2/4YLvxCL3weEOttKVQO9MhNCA30y42wDJa2aXkrCvWUdlNmn
	vl3HcJ/W9RwLfUEl3HYlfyi2UyaY/T+PzinijjRlp9HSD5PkhkY8Z8w9VVhoajjh7kJGFZcAjK5sr
	78WMTY4pSQ27SHZ3FhXS9BkFTO9dr2xHqeg7KNXmo0xII+wHsaSGXyryNg/Tsy96oqdQVQEvWdZDW
	UI5VYjQ3bdyWjRsbQbocXpCh57OYtBAelue5HuOmZ5xuInbgg5ITj7RolponrcDydd/fvQVz7p2wJ
	Y2t0drQQ==;
Received: from localhost ([::1]:56686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iqvVt-003AjJ-9m; Mon, 13 Jan 2020 08:55:57 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:52784) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iqvVm-003AjA-NJ
 for samba-technical@lists.samba.org; Mon, 13 Jan 2020 08:55:54 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 9C84880F98; 
 Mon, 13 Jan 2020 21:55:25 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1578905726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQNPai5uJ/qfsNx8VZSkwTka8wByDZLY++6vOOKEa3Q=;
 b=ZUARNi+Q6RnsAGSp58sN+0YOkyx1x1o0fiiGR7gX10SGQQV81hf25tllZs+HqfLPae1hPA
 WFQVxQz4HSOus+us/GjavN140ZGPAwh3h9YCaCdDnA+1Z49TL6JJcST2r1JM8hivADP1Kt
 02IIDfKg9Fw7GXKmwe9/mpDLccaSul4TKqpqIrnUAejrx3THLQU9h86PqTYxs4dvyOasH9
 fQd1CrDEzhoi1XqAy/hWAwD9csi1zV6eb4nmrRtDO3WcrOtKSbf06IgWx2urhuuqU2FAeu
 rEC4VkOCuZq0JZLlCoJaKNoMhYx5QmH9zMH9pvFs/jOdrdG7r293A1oSeyC3yQ==
Subject: Re: [EXAMPLE] How to add a source3 fuzz target
To: Ralph Boehme <slow@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <5af970f9-d9e1-5993-f5e0-480139c2ad2e@catalyst.net.nz>
 <433221e7-5dc8-36e7-3e91-9cc5374b6e81@samba.org>
Message-ID: <097f16af-d2df-8b5f-e23e-967259716a18@catalyst.net.nz>
Date: Mon, 13 Jan 2020 21:55:23 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <433221e7-5dc8-36e7-3e91-9cc5374b6e81@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Ralph,

On 12/01/20 11:50 pm, Ralph Boehme wrote:
> Am 1/12/20 um 11:00 AM schrieb Douglas Bagnall via samba-technical:
>> Maybe you are a Samba developer who has noticed some activity around
>> automated fuzzing, but you haven't really got your head around how to
>> add a fuzz target in your subdomain. This message is meant to show you
>> how easy it is. So easy, in fact, that you might prefer to skip to the
>> attached patch.
>>
>> ...
>>
> 
> thanks Douglas, this is awesome!

I am glad you think so!

> Can we please add this to the wiki? I'll try to remember to check next
> if it's already there, otherwise I'll add it.

I had a go at transferring it to
https://wiki.samba.org/index.php/Fuzzing/example

The wiki formatting is imperfect.

https://wiki.samba.org/index.php/Fuzzing
and lib/fuzzing/README.md should also be useful.

Douglas

