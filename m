Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA4BEBBF
	for <lists+samba-technical@lfdr.de>; Thu, 26 Sep 2019 07:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ADhWNVfRsr9Lq91jiukYNOZglYAG4HzrkOHCy+MOQ7A=; b=fK6iel2XLZb8zrx5l7kzu5FmR8
	47/gq57P7KJpHrUHUS7I+yVg2EIYUzsliFa4s3xzSbEPUgp8II7LA2/w6Xwr6yF/MssPsGvsQPQwq
	0hcwcT5j9bCgIgPniWyZsIh4t5MrKmYuXEJAA8COh3xW4P/wBVg9hPyz6VFOVT1kfl3DgOC7IGhNX
	vygeOtNxNNAvjUdhyWpaXxaq4Tm2TcMydK8yiYVy5FdpEbTZQigsBSxtnRXUvY6bjDUxlN8Zms/CX
	DAlwYNWDprFuc+6JFNkwJ9oyTM2KKb6Ox7Zh4wINwJKtas1artU3yTFyQNLkpoVCicYX3pOGsLbVU
	fheCn7wA==;
Received: from localhost ([::1]:41306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDMlP-008jeS-BJ; Thu, 26 Sep 2019 05:56:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDMlL-008jeL-8m
 for samba-technical@lists.samba.org; Thu, 26 Sep 2019 05:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=ADhWNVfRsr9Lq91jiukYNOZglYAG4HzrkOHCy+MOQ7A=; b=Ty2seq7rBEXi821C17wK46CSf2
 ZnNrGWGj/sisTPd+TE7EK9dHl2QGPLAFGPe8eDoj3vh8giYlhuUbsulz0lQN9EpUEdREiXgEAy+hD
 aQyYu0Sx3hcCWpVZXz1r/XIW317OnSRdXjG5ZOqAQWRuBqM3G6U4b+cHLN/WNdpirpW0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDMlK-0001lf-E2; Thu, 26 Sep 2019 05:56:22 +0000
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
To: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
 <a361812a-cc20-40a3-1499-75e381ef1ef2@samba.org>
 <78fb0221-2127-09cd-a0cf-47a2d3aca2e7@samba.org>
Message-ID: <3676e8c1-cada-1203-9774-5621db0488f2@samba.org>
Date: Thu, 26 Sep 2019 08:56:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <78fb0221-2127-09cd-a0cf-47a2d3aca2e7@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cool, Thanks!
Uri.

On 9/26/19 8:48 AM, Stefan Metzmacher via samba-technical wrote:
> Hi Uri,
> 
>> Can you elaborate on that sentence, and what is the use case for
>> generating passwd for a group? Is it related to a file being owned by a
>> group SID (administrators)?
> 
> Yes. And also to support sid history, because the unix token can only
> have one uid. When I user is moved to a different domain his primary
> user sid changes, but the old sid is still in the token.
> And it means we have to change the mapping for that sid from a uid
> to a gid.
> 
> Another thing is that we don't need to ask a domain controller
> to find out if the sid belongs to a user or group, it's just
> sid and we just map it to a uid and gid with the same number.
> Which allows kerberos authentication without needing a domain controller.
> 
>> I'm not sure I ever understood this ID_TYPE_BOTH thing - I seem to
>> remember that my understanding has been that it simplifies the code -
>> that some rid backends don't know and don't care if a SID is a group or
>> a user, but they sure can convert it to a unix ID, hence the "both", but
>> that explanation doesn't mandate ability to generate passwd for a group,
>> so hearing that this is actually what ID_TYPE_BOTH is all about was
>> surprising to me.
> 
> When you do a ls -l the number uid or gid should be converted.
> Or you can use chown with the name.
> 
> 
> 


