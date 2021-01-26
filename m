Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBB3047A1
	for <lists+samba-technical@lfdr.de>; Tue, 26 Jan 2021 20:10:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=nI/bKmaMfBIWmEl1Msqfc/VhPJSVNOogLVUR/YyR9Jc=; b=vyTAk1mHt5bVdEWVrfvB3xMoYj
	rcdS2rs5rKHajtLfr5DhkLC5XsVSGmtDI2MEnimzpBL1DyMYtH+EkQ1zerV7xVOzd1P7Ow8Sotexi
	hdWCh9wJv9R3a+lvEbFLVPNkuceeWa5TwWR+pm0+nPyrmQSL/vtCutQXPXBtgJq+1RMwDm6l+O0zM
	sJlI+yt62rfMAr+9S/KrhQCCfMZxlRfVrFHkJjofJHgCYcN4Tu85VDNb9UiSX/F7mx7KLBAefmmPc
	ihWNXUrGffDiJbmuwvo1slm2pcvFeoDVLhnCcgbYYvZNKIFbb7uT0pAF/6ZH7s7eYW7kI4+VhXLxP
	00HBb8Jw==;
Received: from ip6-localhost ([::1]:49564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4Tib-007Huh-Qo; Tue, 26 Jan 2021 19:09:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46648) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4TiW-007HuZ-PO
 for samba-technical@lists.samba.org; Tue, 26 Jan 2021 19:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=nI/bKmaMfBIWmEl1Msqfc/VhPJSVNOogLVUR/YyR9Jc=; b=je4eeN9hvyqL8IlLhwkQ8YHlt/
 GZ4+ooWplHDIM9l4/L+RpW4KhUqn6DoDGOsfWCH24x10Hs0buMITZ6mzM6zeXyCxxY+8LtTGXv44z
 9HSKLPwH2Dta4Tsv+BbYj536fE246oF1sHVOy2T2ao9uAoAdgJnUET8RmvFZgXdNaY5+d4C8QY27i
 yoRjAUjWQmKpe0U6Ze53XGyVrjwEyTbil7MUjMBPFFE6Pi2Ano3qFuJNms09iwz0N8iuIgPsRxPs3
 JBGZyY2crcKaCxhdXtGfBBQPp5PmoKdnlIZ8kKw46ZCp2VlcVKGID5sDpfu+sLUOuwC3GLuv/y+wU
 vgJ430k2VG+KJ8EFQN0GC1OA1X7u1tHobmn7ro7mp3XxHZPBqlUb+wgowGREFjdQapoNs/ltlTaJN
 KTlojRTLku3U+9l/pauDn7jAwLCF4Y88afd/5KudVZ1M/D/Ypssp+lk1K0K7+Pw5RXaAiUKF4uqcQ
 nMuQIc9GmG0CreTuQzWnyjH/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4TiV-0006cx-Py; Tue, 26 Jan 2021 19:09:32 +0000
Subject: Re: Not sure how this slipped through
To: David Disseldorp <ddiss@samba.org>,
 "Christopher O Cowan - Christopher.O.Cowan--- via samba-technical"
 <samba-technical@lists.samba.org>, =?UTF-8?Q?Ralph_B=c3=b6hme?=
 <slow@samba.org>
References: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
 <20210126195556.2def02cb@samba.org>
Message-ID: <ad420766-af66-b6ea-a3da-5a24f1cb3517@samba.org>
Date: Tue, 26 Jan 2021 14:09:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126195556.2def02cb@samba.org>
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
From: Jim McDonough via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jim McDonough <jmcd@samba.org>
Cc: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 1/26/21 1:55 PM, David Disseldorp via samba-technical wrote:
> On Tue, 26 Jan 2021 18:15:48 +0000, Christopher O Cowan - Christopher.O.Cowan--- via samba-technical wrote:
> 
>> My builds on AIX have been failing because of this obvious error.  Can someone please apply it?
> 
> Looks good, thanks for the patch.
> Reviewed-by: David Disseldorp <ddiss@samba.org>
> 
> @Jim: looks like you wrote this module ~15 years ago :). Can you review
> and push?
Reviewed-by: Jim McDonough <jmcd@samba.org>

I'll let Ralph push it, though, since he's already doing another AIX issue.
> 
>>
>> Just wondering, are AIX builds still part of the CI/CD system?
> 
> I'm not aware of any AIX CI jobs.
> 
> Cheers, David
> 


