Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0959565CFE7
	for <lists+samba-technical@lfdr.de>; Wed,  4 Jan 2023 10:47:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hTT9UqTwW6V7CQnJIHa/Bs3xXMjDB2psDsoBSAMIUBM=; b=cwDdNMNFmdjQHDrQcs1izLLvPi
	P/pZJ1ru7eIhnbJDrFQKXow5A0rv6xNIpyye7PWNH0U0NKNh1s82RKtkKmqk765DemZjsKz2jpOhP
	hPWL8ScRT+Lfz/zdb3neDVQ8LfIwLBRWEKkh+F3GwTzxAQczZ4syi+w+g4CofLHvtpR8dSJeQ4mWg
	mA5gBRJTjdB4Vq5JbGJZxxh1yKWIFTaYqo8fajj0AK/hKw9gAUEi7yZAcmT/prVF/5m3IeCCIQa8T
	GLcEc1/OC+3lOSd7+2Js4ocIwSuv+2xaOjZqSrlGSl31bcH2KSZhLlzFMsSanKqFc+X2yYbvNwCuf
	O3l+eXAA==;
Received: from ip6-localhost ([::1]:53430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pD0M9-00EWpY-Vs; Wed, 04 Jan 2023 09:46:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37162) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pD0Lz-00EWpN-Sk
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 09:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=hTT9UqTwW6V7CQnJIHa/Bs3xXMjDB2psDsoBSAMIUBM=; b=YCEfbw3yS7NCbqweKnG9XmSp44
 qS57AkafiByeaW/qKPd/Y/Duh3VlwH/OfxeGChV/qGnS8sXKZQp/AMTzdGG/g503CcdY9UHTMuy2W
 nzXo6jmmUYZz0m5tBX6NBePkwM+f4Gvr90mjiQltt4lw+4oa1NBVXlRFWzWScm+Wlfn0LV+1/C5H2
 9CtudTkZA4VgE4UsUcQouMIfJca+7WEXW5EmQLPzw4gr6rxErNgse9rLoxMDebgDdxdpJb8+Wmfgn
 ufueE2rsKwrxL+2xrTXnmwX25VywnAz3euRb0YgK6Jv7QXtZp0X51Ue/hHI2K0kznb9g9ScZtMHgd
 xElIn5pe6DL5Gjp0tEjxkSTZgFsPngQrJPpd/IyI2ufaAXCJ7NqP2U5HDAz+cwbnWrrLMsvsiK8O3
 RoQ2+0phiGbTb0XjHwNN5zi4UcQFaXjma9HdHxkUx7ZW0qpUZLD5UuM1uec3lrVZwDt+mbTrJE7bg
 zxLl3uWVihF0CWOItLihc/SY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pD0Lq-006hK6-MG
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 09:46:26 +0000
Message-ID: <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>
Date: Wed, 4 Jan 2023 09:46:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Wiki: 64 bit printer drivers
Content-Language: en-GB
References: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
To: samba-technical@lists.samba.org
In-Reply-To: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 04/01/2023 09:36, Ralph Boehme wrote:
> Hi Rowland,
> 
> it seems you reverted Michael's comment on the 64 bit printer driver 
> topic in the wiki:
> 
> <https://wiki.samba.org/index.php?title=Setting_up_Automatic_Printer_Driver_Downloads_for_Windows_Clients&action=history>
> 
> Michael's comment is basically correct as these days SPOOLSS announces 
> itself as a 64 bit printer by default since commit 
> 92fc6a6c254703b771dec0b56b598c2684b4278a from 2017. I guess the whole 
> section "Uploading Only 64-bit Drivers to a Samba Print Server" can just 
> be removed.
> 
> Thanks to Michael for pointing out this issue and thanks Rowland for 
> maintaining and improving the wiki!
> 
> Cheers!
> -slow
> 

Yes, that was me ;-)

I reverted it because there are still 32bit systems out there and, after 
checking, I couldn't find anything that said that printing was now 64bit 
only. This meant to myself that it probably is a bug, but, now you have 
said the above, it sounds like a bug in our documentation, or rather 
lack of it.

Rowland

