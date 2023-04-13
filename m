Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F446E0A2F
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 11:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=b1DW6jvhT90+v7WjVmhcem1InYkvhIDIXzjmUuvmcBQ=; b=2l5r5an/hNNDCYrZ+qv+wgcpey
	7/yxOeeie1g1BifjDNoNICGrVxQ72Hy3HdJV+YkkSeO0EM+tz9k3L6cwZwyEyVr1SQ02ikH8gupNL
	aQFpZp0GwwYSI0Zf1Yh3pZPg13djUx5Ef5Vm+w+G3Lvv1+VcQB1BbkXj572mdXEpKd90FgFNhHI7O
	2sO6NygxJB34ZxLYhIxaIEfR+i9MY9M4AvMzbNAoFY4b5L49uexk3mwW0R0y709deNgNRDkvyaHnK
	YqBwMT7tlNupMVVHmTEbXPsnbSfSWmANkgSkDm+FdghPxugpuuO4ZZBZSk0Ck+hsXF87aoMwbkEEQ
	mgFqmF0A==;
Received: from ip6-localhost ([::1]:36238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pmtE2-00138b-Ng; Thu, 13 Apr 2023 09:26:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36108) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pmtDy-00138S-EG
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 09:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=b1DW6jvhT90+v7WjVmhcem1InYkvhIDIXzjmUuvmcBQ=; b=OME/iiTFS6dHLncF75+XkO6RHT
 /k2bL2NIZt3RyEK4bxR8UvbaPN6UgpkdKlH/04f5olIJxxV842ar6NaZLPx7R17gHWewyf4QRb/W8
 tYRtSDWSdSfF5eUKUnYSVH4JJlUmM4xMTOPFHQTdEW4b3m62TWpHcfOSRqTDuEL+I3VTYqKorIxbM
 1oMwJDNnuRp0uHFv+QAX2SDGjmXcEmNOg6wSULk4IYux1MIXyWvVW+uTrPxu4iYHYGT2sERTEYBRH
 7FASUPFKaWAk0p4rGkZalovz9k2A2wGFwuhA5Lg1RRh8hulf+1bC9nJqz89KolHz2ir3+u4OlCyKI
 bS5o4QGknwnq3WtW0Qpje6QUr5Elc9XOAMeTm74INSSsdtQSjX5invZEiP+QEwV7qQtKwDn1cAnYP
 +7I3L9a+OINt4cYGs2XWqnpVoU1o3QmwIBTXl/kqAiqJr9MQfSqJ+Uk7OvcBmn9rDywpXEdgLnjCm
 w0wJLM3gs8wTG0RnjA/9SsNv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pmtDy-000ugU-4B
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 09:26:38 +0000
Message-ID: <03c07605-4ba3-a60d-c11a-352beb35dc0f@samba.org>
Date: Thu, 13 Apr 2023 10:26:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Recent Samba (4.18.0+) winbind configuration ?
Content-Language: en-GB
References: <4203dcdd-5e9b-6708-5cdf-aec961f5f6a1@oracle.com>
 <ZDWVzOaPP7SNIxOf@jeremy-acer>
 <1d47d63c-854a-0622-c6de-3965dbeb3804@samba.org>
 <4797373.GXAFRqVoOG@magrathea>
To: samba-technical@lists.samba.org
In-Reply-To: <4797373.GXAFRqVoOG@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 13/04/2023 08:09, Andreas Schneider wrote:
> On Tuesday, 11 April 2023 19:47:45 CEST Rowland Penny via samba-technical
> wrote:
>> On 11/04/2023 18:15, Jeremy Allison via samba-technical wrote:
>>> On Tue, Apr 11, 2023 at 02:32:27PM +0200, Jiří Šašek - Solaris Prague
>>>
>>> via samba-technical wrote:
>>>> Story begins when Samba 4.14.0 changed its VFS so we decided to skip
>>>> 4.14.x and also 4.15.x releases to bundle it on Solaris but various
>>>> problems were also with later releases and we were only fixing issues
>>>> in 4.13.0 . Currently (4.18.0) the situation can called be critical so
>>>> I focused on recent release.
>>>>
>>>> winbindd is giving up and I think the key could be in log message:
>>>>
>>>> [2023/04/11 11:28:53.090661,  5, pid=1525, effective(0, 0), real(0,
>>>> 0), class=winbind] ../../source3/winbindd/wb_lookupname.c:
>>>> 52(wb_lookupname_send)
>>>>   WB command lookupname start.
>>>>   Search namespace 'smbsetup' and domain 'smbsetup' for name ''.
>>>>
>>>> ...where "smbsetup" is my domain  ...and I have added core-dump here
>>>> to freeze the stack:
>>>>
>>>> [2023/04/11 11:28:53.090780,  0, pid=1525, effective(0, 0), real(0,
>>>> 0)] ../../source3/lib/dumpcore.c:315(dump_core)
>>>>   dumping core in /var/samba/log/cores/winbindd
>>>
>>> Jiří, please open a bug and upload the full backtrace.
>>>
>>> Thanks,
>>>
>>> Jeremy.
>>
>> Damn, I missed that, focussed on how wrong chatGPT had got it wrong,
>> anyone heard of 'autorid_compat'  ?
>>
>> I still think that Yura needs to post their smb.conf etc.
> 
> Not the smb.conf but the output of "testparm -s"! Always ask for testparm
> output including the errors and warnings it prints ;-)
> 

There are times when seeing what is on disk is helpful, you can see just 
what, if anything, the OP has tried, I deemed that this was one of those 
times.

Rowland

