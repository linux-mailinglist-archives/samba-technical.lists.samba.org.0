Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A224AF92
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 09:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=2/ReDSetV/pKaZ6OCQGWxDXNODgF8n08baRinOTjKNI=; b=XGO+Bk42LP+gcPChfMy4nd/CFH
	zY8jULLxf2i/+DVCTN5/gnc/AdqBdiOioDAePbvNCsMebcVTEHk46Bbm9oNji6wI9II4vpDLdoolC
	VadPJlAsSZWxR4DxEO2OQ7jaRng3wNrOBNg8viMxg1Aii4rZU22YAbvIh09aXKMwmtMV9Y7PSYU3O
	pGFs4qFvUdRrYY/e2ZDQkzZJnHBw28fOG8mycOgYvAns6Euzq8BaLeO4YjwH0Gp+wgmtDBhS1uXGy
	Yjq3Ndepk9SdaM0h5WVAt/+h2tHSI+IDYqfqCxuvAPuJZMqnunm4Q0OMej+eVFMC8Aol6nACYaqzy
	EvP+ifOg==;
Received: from localhost ([::1]:61166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8egK-00ENiz-OW; Thu, 20 Aug 2020 07:08:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8egF-00ENis-Ld
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 07:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=2/ReDSetV/pKaZ6OCQGWxDXNODgF8n08baRinOTjKNI=; b=VAHZ7N6v0emPW2R9wt8/6uZUKL
 3O5Ergru6OLAGQPQtmG4dD4qRHaxl32NUG3MqIgcdICByhholpF32ETM7dwqrMb58oaX1XyaLX4Pb
 DZpKs/yUUWx10FH0ncHWJOoyyEyCVLCY4DgTqNIgb8iQYQEBlvqBeVMq2VD+0OSkIkxTVUcc3Nfq0
 fswGb2ncNkU5DXD7ojsLtEQpH+o00FXECbdQUTmdmDSFD0qqsBj5A5vEdqFKe/09CPZMfOdIjSmqr
 ohZYwoXYOq0zgrz0Tl65HhrJEaZbBhVNb9vgQHiXSG6lMkqWBCG6K9PVOLkPuWLOVMYQFOafi5lGy
 BqKgKuGkA4MkWyhmVbvKXs5iVk+A7v5191dF8KSNBoWpxuytX3MilBdX5/ReFy6Nj34R62BXur8j8
 pJYpqmzjrOEry2WpZkPLZqfv6lrZRx2iWE4kZDrITHvuqzSg2ksmW2aNlg4/FWjTafj7+BkMMBueB
 b8E583EiiQaoWFwWqT0ZgpSO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8egE-0001qM-Di; Thu, 20 Aug 2020 07:08:10 +0000
Subject: Re: "auto" for Kerberos, a history
To: Stefan Metzmacher <metze@samba.org>, Andrew Bartlett
 <abartlet@samba.org>, samba-technical@lists.samba.org
References: <3749194.YmznvRLumo@magrathea>
 <02a8997f-b8c0-617a-2744-c970de255dca@samba.org>
 <88fea226ef46a6f2dc702c74e413860bd3425ab7.camel@samba.org>
 <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
 <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
Message-ID: <58336d2d-f7df-2bd4-d86c-b92c99867fec@samba.org>
Date: Thu, 20 Aug 2020 08:08:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 20/08/2020 07:53, Stefan Metzmacher wrote:
> Am 20.08.20 um 08:30 schrieb Rowland penny via samba-technical:
>> On 19/08/2020 23:10, Andrew Bartlett wrote:
>>> On Wed, 2020-08-19 at 22:13 +0100, Rowland penny via samba-technical
>>> wrote:
>>>>        -k KERBEROS, --kerberos=KERBEROS
>>>>                            Use Kerberos
>>>>
>>>> If you check the code, 'KERBEROS' is actually 'yes', 'auto' or 'no'
>>>>
>>>> What is 'auto' in this context ? surely using kerberos is binary,
>>>> you
>>>> either want to use it, or you don't, 'yes' or 'no', so what does
>>>> 'auto'
>>>> actually mean and do ?
>>>>
>>>> Do we really need 'auto', can we not decide what the parameter
>>>> defaults
>>>> (for instance) should be and remove 'auto' ?
>>> In this context, the current code behaviour is to try and obtain a
>>> kerberos ticket, but to fall back to NTLM as 'good enough protection'
>>> if this fails, for example if no KDC can be reached, or this is an IP
>>> address, or if the server does not offer Kerberos as an authentication
>>> type.
>>>
>>> The idea (when this was written) was to at least try Kerberos, rather
>>> than continuing to default to NTLM only.  (And on the flip side, to
>>> continue to work in the many - at the time - networks where AD was
>>> functioning only with NTLM).
>>>
>>> Andrew Bartlett
>>>
>> Why not just set the default to 'yes' and if this fails, fall back to NTLM, this is what 'auto' seems to mean. To me, 'auto' is confusing and to top it off, it doesn't seem
>> to be documented anywhere.
> yes means no fallback to NTLM,
That makes sense
>
> Should we use "disabled", "if_available", "required"
> instead of "no", "auto", "yes"?
>
> metze

Why not just use 'if_available' instead of 'auto', it makes more sense. 
'auto' is short for 'automatic', but 'automatic' what ?

'no' == Never use kerberos

'yes' == Only use kerberos

'if_available' == Try kerberos, but fall back to NTLM if kerberos is not 
available

Rowland



