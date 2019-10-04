Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C8CB8E6
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 13:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QdeWu0iCPFF9kdfpcLsmwLigEGSfIifMIARTrGcb7G4=; b=0jbIOZMJAS2CqRgPKakfoCFAaD
	B16T1f2FKoci5APkq1wp1P5J9/EGjMpZiZHqwuFNkL8eEtRVAKWVEQ0NcSEzjRMiA+u0B2grN0ViV
	+VeGayQeo71NV/m22thdNY9yjIxbx63tRBrw5qqhn8xn9GXfOowZWJoTQ31DRy2IohLg/DZSb7BdR
	083it4RLHQhVOI05UngDIUlaFtffH8QOqJKRRq6Fm5zQEgsUtDckSOPHO3qat9jIVnz+lXUZJ7Wqm
	tfYh29nK0TKnysJM5B0y/f/Nc6LrQujAJQbVPiHE06HF6lgyytr/79SEXGtZzvNbNaEggKKb0DLno
	BBa4/u1Q==;
Received: from localhost ([::1]:54468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGLRp-0015ud-GN; Fri, 04 Oct 2019 11:08:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46444) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGLRk-0015uS-SW
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 11:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=QdeWu0iCPFF9kdfpcLsmwLigEGSfIifMIARTrGcb7G4=; b=c74upb/2XT9AjLb/0KwT2AIYyM
 xNJ6RL220I50F8YJqI2IPxxN0OtAc5TckL0AJA0OBYhpqXEx2CyCD0Xjp8qdezJOrUnv9itbsu6u+
 6CLg3EeZTGtuuiUY4tbPdO/NMwA2Xf9tV4dwqv5juUv9RUOOjSust2E15vn4zAbyyrm4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGLRj-0007YA-K9; Fri, 04 Oct 2019 11:08:27 +0000
Subject: Re: About adding a new 'winbind:allow domains' parameter
To: Andreas Schneider <asn@samba.org>, Samuel Cabrero <scabrero@samba.org>
References: <20191002154202.upjxr3pqii47wt3a@aneto>
 <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
 <20191003163758.xsetow666fudtkxc@aneto> <5313918.ZBD0rEVcan@magrathea>
Message-ID: <7c88bab4-a1e9-e9d6-e720-083d23b4b326@samba.org>
Date: Fri, 4 Oct 2019 07:08:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <5313918.ZBD0rEVcan@magrathea>
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
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org,
 Samuel Cabrero <scabrero@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/4/19 5:50 AM, Andreas Schneider via samba-technical wrote:
> On Thursday, 3 October 2019 18:37:58 CEST Samuel Cabrero wrote:
>> On Wed, Oct 02, 2019 at 05:57:52PM +0200, Stefan Metzmacher via samba-
> technical wrote:
>>> What is the reason have just a manual specified subset of the trusted
>>> domains?
>>>
>>> I'd actually like to get rid of all this hacks and just trust our dc.
>>
>> Because some users are currently using the documented parameter
>> 'winbind:ignore domains', and when new domains are added to AD they have
>> to be added to this setting too. It is just a usability improvement.
>>
>> But let me ask, why the 'ignore domains' option exists in first place?
>> The documentation says it "can avoid the overhead of resources from
>> attempting to login to DCs that should not be communicated with" but
>> from your reply I am not sure if this is still a valid assertion.
> 
> In the past we tried to communicate with the DC direclty. We had a child 
> running for each domain member. The assumptions we had date back to NT4 style 
> domain controllers. In the meantime we know we can only talk to our primary 
> trust to authenticate users and the DC will route the request for us.
Actually, even with the NT domain controllers, this was technically the
wrong thing to do.  It just happens to work if you have two-way trusts.
 So really this was before we had protocol information and were
investigating it ourselves.

Hooray for documentation!

Jim


