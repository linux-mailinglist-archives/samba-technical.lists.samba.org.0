Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6691698D3
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 18:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oQ4JfvHbgi9XhRgLZTB2951quOQsb4RK8J1d1lG64Fs=; b=W5iyEpUmNB27LjxGsXybatyim6
	jQZCAKjTVHZHJYZVKMSclFe4oDrzc70c0hRt5TQdOHLi8K2Kma2K9gZnkdGNtvg+7By3MMwlipn/D
	OV4NX85VfeiL74eNrE3/lzIr5c7xx3O9EkV9qEeyg4ynmibLhuLcvTm/vPcN8gTuJDFcSZxjzdjum
	/LsbxEYZVB4f1OQ3YAAGmcABmeyo9v7l/xTJXRFw/9AEfOAaAC1KtYLqfa+976qDrjiIu/Yurg+HO
	rpW9jzLX/A1JghKrYi5r88UzsdNr1xMMqBZ42EsKHrMw4vYsRGzDmczneBR88adc3WpcRywywpNwn
	T548PT7A==;
Received: from localhost ([::1]:35648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5uvw-00BD3W-57; Sun, 23 Feb 2020 17:20:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5uvr-00BD3P-Gi
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 17:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=oQ4JfvHbgi9XhRgLZTB2951quOQsb4RK8J1d1lG64Fs=; b=KQy2aQRbGdJJV5IsDR056XrM3p
 fg/KhloNzgBxh4fzYbX+xIpXkvymbsXSwYIIIJUWwYuLEs3mO6CdBSM1QiWIJ7fjpK4BrH64pqCsK
 EBKpF0vzQhGY0+LmOyWOOJLEBlXTTg7J1W6SZwCGBhmZy2jxFRy0wcmKgBs8GY2hTebcBjhHX+s0u
 LaufsmGnC+IKWYYGhDrtMLsssDSqejqAmNhi6cqKCIamOF+hmfamnO+ges78KaE1zMOokv44K7C53
 gFrPqdlAc8AHjyUIDNxUwA+I1z369hcASC4CEDpzddH4eMwqoLQYhXlB2HAUJUKX+WEPSMwC2OLdL
 JOADKgRJiRiOtX/zrGOIO4n9GB/5EuW/f8ZFQHkqfQseWhDVQTCV1FIrmkTdq/w5EtC+4xTihfqvQ
 BcQFemFFRHLORboZ/8M9NgnCkY7QO5mwwn1kEE2tT2oge212gHX9rcGW5jFaoX8WG7/9C1TyYiyZa
 tMMGcRX7EnbGBYr4P3niiAND;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5uvq-0005vQ-Sd
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 17:20:43 +0000
Subject: Re: Internal Samba DNS issue with AD
To: samba-technical@lists.samba.org
References: <1582476460641-0.post@n4.nabble.com>
Message-ID: <c66458ef-aa76-c022-05e9-6c5d122cedc6@samba.org>
Date: Sun, 23 Feb 2020 17:20:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582476460641-0.post@n4.nabble.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 23/02/2020 16:47, smalldragoon via samba-technical wrote:
> Hi,
> I guess I'm missing a step ( or something ) setting up the samba as AD.
>
It is possible that something else is listening on port 53, can you 
download this:

https://github.com/thctlo/samba4/blob/master/samba-collect-debug-info.sh

Run it on the DC and then post the (sanitised) output to the samba 
mailing list, this really isn't the place to ask questions like this ;-)

Rowland



