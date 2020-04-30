Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE09B1BF54F
	for <lists+samba-technical@lfdr.de>; Thu, 30 Apr 2020 12:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=15hmXPO6LISCorESd3vg9e8SjNj6xchlmsI50B6gMPw=; b=25VI4u/gSq3o8lYvjbc+y09d6W
	JKRhu1Ft55/8IWimIuD/zOypVxr2n+2FUeLWy5ucG7CfUEK/IAMgs04lKhHoqRv/aNFAk7XtZ+1wk
	TSa2YbmDe81h1A74WW/cKI5qG7d/ROngjBBu7y5FK02toNdfI4u86YyciYSJCKf5yROPqswC2a5Ii
	o4ep7U3GKONK9O2Qa6UvafDRKP0AGyjOF0j7TaveCTJwiem6AYj3Eom0hhQXYbHl19QMYwR6xZBE9
	xySKDRrID+CGTTfuu5F9wIUrrc4YLdwbvU2RMFei5iKnlJppWCEPKVvEOkr8MC6suI61O7BMACMML
	ELhmwyhg==;
Received: from localhost ([::1]:30056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jU6Mc-000AIU-CY; Thu, 30 Apr 2020 10:24:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49982) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jU6MV-000AIN-Bc
 for samba-technical@lists.samba.org; Thu, 30 Apr 2020 10:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=15hmXPO6LISCorESd3vg9e8SjNj6xchlmsI50B6gMPw=; b=JnnR/yUY4UN1mJA9Dx89KRVP4m
 ywzbOCqnWXT8jYGpPj8RVSwY942/haEPom9BZfSB5sD4mpycleJ9y1IUYGlYQCvpvbU7XmsAXqeKq
 79iMkq532CmJkY2//WA3C/AgS1oc9/5uP1FClgjiyi8nV99uBx4GoTIqtoUrQ1a3s6hjXxkjB/ZZU
 8N63wGgYblj3ZaIUKKjnEXQTRaBb3LqyVdD3zI9TjuNQn8Zr4+4wyQ0t0SS4gi4h2aXzd9c8loq9r
 Gr3vd2PYIhce25+BexiphcEHz4QWjEqQTpIVKht03NxJ8W32WrQrdWBWcoL2Q/8EVeK4GPyAk3bWO
 dtB1MJd+uQAbfDwE5Pe9t0OTMc8Nr03HJS5yQDu9LnQPDLqht7Ss4Lm+mW27PFxgENuQz63ffAOui
 4/sv3SwDkojyP2AKiWrne1I5kEWjDVk9DXRrgtkaGshtBXaudgDHss13bu9vlyptDikk260iAdaOE
 Z7mZMhdeJYtAznVOLvk+mio7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jU6MU-0007HK-LR
 for samba-technical@lists.samba.org; Thu, 30 Apr 2020 10:24:10 +0000
Subject: Re: [PATCH] Remove 'samba-tool user add'
References: <20170324092636.316bd8fd@devstation.samdom.example.com>
 <1490566775.13579.257.camel@samba.org>
 <20170327082840.6a00bc45@devstation.samdom.example.com>
 <20170329130458.GB7532@sernet.de>
 <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
To: samba-technical@lists.samba.org
Message-ID: <0852b07d-1820-c037-8438-231138bd07bd@samba.org>
Date: Thu, 30 Apr 2020 11:24:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
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

On 30/04/2020 11:07, Björn Baumbach wrote:
>>> Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
>>> wrote:
>>>> Can someone remind me why it was deprecated?
> On 3/29/17 3:04 PM, Volker Lendecke via samba-technical wrote:
>> Also, shouldn't we align this with the group commands? There we have a
>> "samba-tool group add", but no "samba-tool group create".
> Hi!
>
> I would like to continue this proposal and like to read your ideas to
> resolve this.
>
> I've recently opened a merge request with a set of patches which rename
> the "samba-tool group add" command to "samba-tool group create" and
> deprecated the add:
> https://gitlab.com/samba-team/samba/-/merge_requests/1304
>
> I planned to fix all other "add" subcommands, but I've noticed that most
> of the subcommands like computer, contact, ou, ... use "create" already.
>
> In addition to the "group add" command there are two further "add"s
> left, but they make really sense, in my opinion. It's "spn add" to add a
> SPN to an account (while the command description says "add - *Create* a
> new spn") and "dns add" to add a DNS record.
>
> I think the "add" command is generally more comfortable and seems to be
> more natural, even for adding new users or groups to the AD.
>
> It seems that several people wonder why the "user add" command has been
> renamed to "user create". Unfortunately the commit message does not
> provide this information:
>
> commit b26a4f6232219746fd8ed1b107476f3c23c6908e
> Author: Theresa Halloran <thallora@linux.vnet.ibm.com>
> Date:   Sun Oct 23 15:23:28 2011 -0700
>
>      s4: samba-tool subcommand rename - change samba-tool user add to
> samba-tool user create
>
>      Signed-off-by: Theresa Halloran <thallora@linux.vnet.ibm.com>
>      Signed-off-by: Jelmer Vernooij <jelmer@samba.org>
>
>
> What do you think about:
> 1.) Just replace the "group add" with "group create" (and keep "dns add"
>      and "spn add"), like in my merge request.
> 2.) Have both, "add" and "create", for all subcommands.
> 3.) Roll-back: Remove the "user add" deprecation warning, add the "add"
>      command to all other categories and deprecate all "create" commands.
>
> Please let me know :-)
>
> Best regards,
> Björn
>
The problem with '1' is that there  will undoubtedly be scripts out 
there that use 'group add', so you will have to deprecate 'group add' 
then remove it at a later date and just look at how long it has taken to 
remove 'user add'.

'2' will just lead to confusion.

'3' will mean deprecating 'user create' and this will just lead to 
confusion.

I would just remove 'user add'.

Rowland


