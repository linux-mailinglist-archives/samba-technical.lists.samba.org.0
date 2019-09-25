Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62923BE688
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 22:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=jnoc4hV6cKIgi0a204BxDTdZdUSS6g9LiIhu032FYFI=; b=c3PHDHwDs48ijlTwvjrEHMASoI
	ush8nt/XqdUmm0uSyud46+Oo6oGDgyODv2UvBMCDDeC3/FRdts6oH8kd1hP5oO2qpfzQDJaOwOzON
	a5PvrcNE0VUEaSddyw7XGfRUP2fGRsdxpLd8uvxIQdKHOaLglUhhaut1g3An0g3fVtLJr/YtlBSJA
	kE5rJESnRtHEDs0ARZ/j/0IV1okudPbmvQHrr+INUrQ9WElKa8vjVul2xndJDmORQr0/UlN8bWpNA
	E5FOQLVZnMZ+hAlvRKojc9lMQcP6n7xzr+ZgM/iyaWhTTmXqEUNbEmnEIl9XVZtcAFpSvf18t16ot
	+qAp8Qrw==;
Received: from localhost ([::1]:19430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDE13-008dbU-VK; Wed, 25 Sep 2019 20:36:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11946) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDE0x-008dbG-WB
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 20:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=jnoc4hV6cKIgi0a204BxDTdZdUSS6g9LiIhu032FYFI=; b=cXNYWHQZqSnoe3kFzQWwm0v5AZ
 ApQ31UNS9cwuddk5hu9B19ROE/YcJMuh18EYw5/B+7BB0lQ2PRs1bLjOtMFC2iQJQYpOB/2qCiVmM
 Z5v75hIhcg6Qi+xGNH1H+QBbEMIlqfr3H7R9rITQ8dmdQm4mVWDHN8Nr0cnQ9jbsY+3c=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDE0u-0004su-D2; Wed, 25 Sep 2019 20:35:52 +0000
Subject: Re: Writing a Windows Explorer plugin that uses a Vendor Specific
 FSCTL to access extra metadata about files from Samba
To: Richard Sharpe <realrichardsharpe@gmail.com>
References: <CACyXjPwcp54B_LCJ_2gnXHZ63OvkTkb6MM+CX2GRXteRi7wyCA@mail.gmail.com>
 <3da181cd-74ac-09ca-d75d-f23adb159ec5@samba.org>
 <CACyXjPyqhvZnKaDai=zGJ6zfhEKPtS1fte8468Mm7EX0czNQ2w@mail.gmail.com>
Message-ID: <51e27ab1-7432-35f3-2ec7-d5d57074ef60@samba.org>
Date: Wed, 25 Sep 2019 13:35:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CACyXjPyqhvZnKaDai=zGJ6zfhEKPtS1fte8468Mm7EX0czNQ2w@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/25/19 12:15 PM, Richard Sharpe wrote:
> On Wed, Sep 25, 2019 at 12:03 PM Ralph Boehme <slow@samba.org> wrote:
>>
>> On 9/25/19 11:53 AM, Richard Sharpe via samba-technical wrote:
>>> Hi folks,
>>>
>>> Over the last few weeks, as a part-time activity, I have been writing
>>> a Windows Explorer plugin that uses a Vendor Specific FSCTL to
>>> communicate with a Samba VFS module to retrieve some of the plethora
>>> of extra metadata we have in our file system.
>>>
>>> It also allows us to set some of that metadata as well.
>>>
>>> Since knowing that something can be done is often the most important
>>> step in doing that thing, I thought I would mention it.
>>>
>>> I hope to find the time to provide a tutorial on this subject as well,
>>> probably on the Samba Wiki.
>>
>> yes, please share as much as you can, ideally the source code, but some
>> tutorial on the wiki would also be nice. :)
> 
> My Windows UI skills suck, so the resulting UI is not great, but it
> does everything that is needed.
> 
> I plan on documenting the calls to be made, the library I used, code
> snippets on both the Windows side and Samba VFS module side as well as
> hints on the actual workflow.

cool, thanks a lot! :)

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

