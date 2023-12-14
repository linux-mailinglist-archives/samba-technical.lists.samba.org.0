Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB38129D3
	for <lists+samba-technical@lfdr.de>; Thu, 14 Dec 2023 08:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=mX9fWEqzA5H6vHPZydD4rxQzUbnOkrmFaxAcGyDcwVM=; b=255I+XvecN8PV78mn61hCMOAcZ
	fIA5IKp9TwyyG5CSk1u6A7jBNau/y79Fa5I4e01nW5F3XZODqVvTAICJkC3XFAhE3TBE/ybgPizD2
	/1VXl9xgMFNhy9s29PDSibm37KYMVhpQ3L0mOXrWKrXTvc9dw5nUsrf1R6cXOYasfjWlgl7fozp+R
	InJXSrL4ugXqdUtPOlgmB1RkG9fe4LI8kUHtFkDMKYONwHjT8jWLhW/0K48FAbnEiBb9EIUHhXtWk
	lpkCeD3kk87JUhwRVUL+RgvURP6np0tr//8VkT2zLWT9BGSp5/MrEm+Yga+4ywSGCC+eHKyVAuZN+
	YFC1ecPA==;
Received: from ip6-localhost ([::1]:29900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rDgam-007Bjn-7L; Thu, 14 Dec 2023 07:57:12 +0000
Received: from mail.vulnscan.org ([2a01:7c8:fffb:b9::1]:32952) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rDgag-007Bjd-Rl
 for samba-technical@lists.samba.org; Thu, 14 Dec 2023 07:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=vulnscan.org; s=1; h=Subject:From:To:MIME-Version:Date:Message-ID:
 Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzQKAnp/vQGiFO1F4fa9XwBs1Y/xOHm89V7va1EVvX4=; b=UhT6s2A71PB3jzihXE0wZjdDKi
 ynrHJTFXXClrzqfrus62iyz9Rp8iXh7goW6MsYXWHQw+Svz9Fjr7qxiANr1K6psBn1/lgSSt3k08a
 ApP7SrGhBmkuGdxYWuoRtVEr4H73BMHyE9UBg0QA+ae0DiF4loD79F1E8FKeDmSlgdX/frRhV+SYA
 xjuC5UkSJGRsCvs3Iy6DCxoAs9YrvOsAdinQUELH8QIm7CVCUlhgefZ03VmI0n9s1skyXfmSMyQwk
 MOM6QuRW23AgwVBaAozh2vHbi9eLViDws4gfvnCr7xH8+6csNIZBvRn4S9/nP8TI5pxyipDft/jqE
 95hg9yXg==;
Message-ID: <aee71586-ab0b-409d-a375-75fb7fd6b223@vulnscan.org>
Date: Thu, 14 Dec 2023 08:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: samba-technical@lists.samba.org
Content-Language: en-US
Subject: Is Samba AIO affected by recent Linux data corruption bug?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Bram Matthys via samba-technical <samba-technical@lists.samba.org>
Reply-To: Bram Matthys <syzop@vulnscan.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi everyone,

In relation to the recent Linux filesystem corruption bug with O_DIRECT 
[1]. I read that to trigger this, an application needs to use O_DIRECT 
and that the bug is that the file position is not updated properly. So 
the bug does not happen with pwrite(), or if lseek() is always called prior.

My questin: would this bug be triggered by Samba? I know Samba does AIO 
and that it is enabled by default (i have it on too). But I see heavy 
use of pwrite(). Does that mean things are safe? Or does it also use 
O_DIRECT without pwrite/lseek as well.

Would love to hear from a samba dev or someone who otherwise is familiar 
with this part of the code, to be sure. It is hard for me as an outsider 
to judge/audit the code in such a short timeframe and so easy to miss 
something.

The reason is, I missed the word on this filesystem corruption issue and 
due to an unfortunate timing (system maintenance with a reboot to the 
affected kernel last weekend) we had a production machine running 3 days 
with the affected kernel. As for Samba, we are on 4.18.8.

Of course I have been doing a quick compare with last safe backup but 
sadly that is of limited use. It only shows what files have changed but 
not if the change is among one of the many legit changes or a case of 
file corruption. So far I have zero indications of corruption but it 
would be so much better to know if Samba would trigger this bug or not. 
I can imagine the Samba team would have had similar questions, if not on 
list then from customers directly, in the past week or so.

Thanks in advance,

Bram Matthys

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1057843 and 
https://lore.kernel.org/stable/20231205122122.dfhhoaswsfscuhc3@quack3/ etc.
