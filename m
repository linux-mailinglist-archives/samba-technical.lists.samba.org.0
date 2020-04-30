Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 970061BF608
	for <lists+samba-technical@lfdr.de>; Thu, 30 Apr 2020 13:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=kmsX1anarQ9Nx14/l4r/e2gt7L8mzRAGR4bK3JHvcIY=; b=jK6Tn/jTIsWL6SF83Koa0kyKg1
	9b0AV6KcuiXQiNYADgV7TtGQPRecoBLJ8ld90VcL66JRU7i8o57SJ6DJ3BJhM8PF86NivCwywPJGm
	htARGQb5edpigT6JKZQzvPlDMli2ij4MuT4uZetAqVn4EKfzG3UpcAAznqDlSd2aI70n5vaNERa1a
	CgPPwxiJvdeoym5kfBZ+5am5aq6FN00jl6mSztjySb0DJvw3GAC7UIGqyF3hm+QUm63iO1a2O0355
	clFCVD1VjlTM/H5IxLqBeEo08lTLO9ClvXdV0xEe94UMg161OPPqcFM/hljy+2UZBatPXM+rINxUs
	rfSOJEiA==;
Received: from localhost ([::1]:41754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jU6wg-000Bsz-TX; Thu, 30 Apr 2020 11:01:35 +0000
Received: from ictmail.ictprovision.com ([35.178.134.240]:35870) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jU6wX-000Bss-Pp
 for samba-technical@lists.samba.org; Thu, 30 Apr 2020 11:01:30 +0000
Subject: Re: [PATCH] Remove 'samba-tool user add'
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dewberryfields.co.uk; 
 s=2019; t=1588243428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmsX1anarQ9Nx14/l4r/e2gt7L8mzRAGR4bK3JHvcIY=;
 b=QqQR9AJ29bd6RTQEl3TKqyOCyqo6+eoL+CRJR6TeAhdmgfntlpXcIoMCkZttoSQ1jLNoIX
 aAwvZShfxGAwdTnWIAAaWyJc6tgub6aQZ+Sbdasf/mAQffQ948JgelSCYU0TjA/o72uB/O
 A9DFnBiJZSX2w+48z2X2475d5ZmMoPk=
To: samba-technical@lists.samba.org
References: <20170324092636.316bd8fd@devstation.samdom.example.com>
 <1490566775.13579.257.camel@samba.org>
 <20170327082840.6a00bc45@devstation.samdom.example.com>
 <20170329130458.GB7532@sernet.de>
 <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
 <0852b07d-1820-c037-8438-231138bd07bd@samba.org>
Message-ID: <7f632287-710f-0ebd-ce69-83874808e259@dewberryfields.co.uk>
Date: Thu, 30 Apr 2020 11:43:42 +0100
MIME-Version: 1.0
In-Reply-To: <0852b07d-1820-c037-8438-231138bd07bd@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dewberryfields.co.uk; s=2019; t=1588243428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmsX1anarQ9Nx14/l4r/e2gt7L8mzRAGR4bK3JHvcIY=;
 b=dZswBOhbAuXaAbe39cm502zaz00WxTz7Mm9uq4evJCGOfUzpjlrGxLgj9YYFs7055AticD
 E6R9rmjuFTLaPbp8sGdzRVrLg2xLRYa7SDOH7mRzefUMRCnw8Mzo9YDrt0qPNn1CVOGhLu
 PUdJ+26kwBMf3z/ogDa2PaZ9ozDhumo=
ARC-Seal: i=1; s=2019; d=dewberryfields.co.uk; t=1588243428; a=rsa-sha256;
 cv=none;
 b=ehuFZ7bD4ROejMaXuIpIBdxthQcA8OAHUQb7Utd1EBfeG0PhoDPhrAFGmYswDpjjkf7EsL
 5HBTYBZerWt7zWrtDUF9XiDHSVq7uilSaIhlGy/hSIWHmaerEOclf65cTQWhL6Vu5Evio5
 ghKwteoUqNYpdVPJyca9dQTORo1Y4So=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=mike@dewberryfields.co.uk
 smtp.mailfrom=mike@dewberryfields.co.uk
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=mike@dewberryfields.co.uk
 smtp.mailfrom=mike@dewberryfields.co.uk
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
From: Michael Howard via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Howard <mike@dewberryfields.co.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 30/04/2020 11:24, Rowland penny via samba-technical wrote:
> On 30/04/2020 11:07, Björn Baumbach wrote:
>>>> Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
>>>> wrote:
>>>>> Can someone remind me why it was deprecated?
>> On 3/29/17 3:04 PM, Volker Lendecke via samba-technical wrote:
>>> Also, shouldn't we align this with the group commands? There we have a
>>> "samba-tool group add", but no "samba-tool group create".
>> Hi!
>>
>> I would like to continue this proposal and like to read your ideas to
>> resolve this.
>>
>> I've recently opened a merge request with a set of patches which rename
>> the "samba-tool group add" command to "samba-tool group create" and
>> deprecated the add:
>> https://gitlab.com/samba-team/samba/-/merge_requests/1304
>>
>> I planned to fix all other "add" subcommands, but I've noticed that most
>> of the subcommands like computer, contact, ou, ... use "create" already.
>>
>> In addition to the "group add" command there are two further "add"s
>> left, but they make really sense, in my opinion. It's "spn add" to add a
>> SPN to an account (while the command description says "add - *Create* a
>> new spn") and "dns add" to add a DNS record.
>>
>> I think the "add" command is generally more comfortable and seems to be
>> more natural, even for adding new users or groups to the AD.
>>
>> It seems that several people wonder why the "user add" command has been
>> renamed to "user create". Unfortunately the commit message does not
>> provide this information:
>>
>> commit b26a4f6232219746fd8ed1b107476f3c23c6908e
>> Author: Theresa Halloran <thallora@linux.vnet.ibm.com>
>> Date:   Sun Oct 23 15:23:28 2011 -0700
>>
>>      s4: samba-tool subcommand rename - change samba-tool user add to
>> samba-tool user create
>>
>>      Signed-off-by: Theresa Halloran <thallora@linux.vnet.ibm.com>
>>      Signed-off-by: Jelmer Vernooij <jelmer@samba.org>
>>
>>
>> What do you think about:
>> 1.) Just replace the "group add" with "group create" (and keep "dns add"
>>      and "spn add"), like in my merge request.
>> 2.) Have both, "add" and "create", for all subcommands.
>> 3.) Roll-back: Remove the "user add" deprecation warning, add the "add"
>>      command to all other categories and deprecate all "create" 
>> commands.
>>
>> Please let me know :-)
>>
>> Best regards,
>> Björn
>>
> The problem with '1' is that there  will undoubtedly be scripts out 
> there that use 'group add', so you will have to deprecate 'group add' 
> then remove it at a later date and just look at how long it has taken 
> to remove 'user add'.
>
> '2' will just lead to confusion.
>
> '3' will mean deprecating 'user create' and this will just lead to 
> confusion.
>
> I would just remove 'user add'.
I'm not involved in any samba development but from a user perpective, 
especially on unix like systems, 'add' is much more intuitive than 'create'.

I would keep both but that may involve more overhead than developers like.

I don't see why either 2 or 3 would lead to confusion, unless a lot of 
four year olds will be getting samba for Christmas.

-- 
Michael Howard


