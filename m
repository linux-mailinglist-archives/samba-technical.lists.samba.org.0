Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B9473BEE4
	for <lists+samba-technical@lfdr.de>; Fri, 23 Jun 2023 21:33:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=RoAZT2vLIHAhrrF1ngOcVg1SVpQGHNp8Uq6JwbMWW/w=; b=5DG0HEvzEhb/1MkuJGzLC5NPXi
	2Is9Ynsd0a81z23NfWT5Z48X+56k1EBVU9Ors0ewW+I58Nli0iaoUNbfSnndXlmoQfBbE7R4UrLJx
	LVz9pR5ON6A5gjZlwt+sqZFzg48u+z25nnC5BDmsSs7QSUAR/C4uotJ2f1dmqvRVVv9eh0kn/xORF
	Pq4FTUcZRZ910quTjoAHSdAfW3rrguZ7Q7jO+/8yoNWjrASw2SZT/OMqHYFSXmQB05txlvZReqLgr
	mNCDrzx1EpMV2VYeBs2Eys+XbXGyW9xkt/pI8wDYzl/T69ge5cW4KWGQdG7msba0OThcfmIkN1Xbq
	ZnbXEuOA==;
Received: from ip6-localhost ([::1]:48480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qCmWu-004Eq3-Q7; Fri, 23 Jun 2023 19:33:12 +0000
Received: from postal3.et.byu.edu ([128.187.48.33]:34386) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qCmWm-004Epu-Ah
 for samba-technical@lists.samba.org; Fri, 23 Jun 2023 19:33:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by postal3.et.byu.edu (Postfix) with ESMTP id 52A736E0CC
 for <samba-technical@lists.samba.org>; Fri, 23 Jun 2023 13:13:32 -0600 (MDT)
Received: from postal3.et.byu.edu ([127.0.0.1])
 by localhost (postal3.et.byu.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ni8J80DE4WSC for <samba-technical@lists.samba.org>;
 Fri, 23 Jun 2023 13:13:32 -0600 (MDT)
Received: from [10.35.115.21] (congo.et.byu.edu [10.35.115.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by postal3.et.byu.edu (Postfix) with ESMTPSA id 1ABD06E0BF
 for <samba-technical@lists.samba.org>; Fri, 23 Jun 2023 13:13:32 -0600 (MDT)
Message-ID: <5d39490c-120a-0609-b575-4639c98cfc4f@et.byu.edu>
Date: Fri, 23 Jun 2023 13:13:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: filesystems mounted within an SMB share and
 REPARSE_TAG_MOUNT_POINT
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <CAB5c7xqGsk9sVE-VH7=Q_A3eCntO-0BDDs1+f_+gQbtxfLU2wQ@mail.gmail.com>
 <Y/+iwsLNkXEzLzu8@jeremy-acer> <a594f91e-6dc9-79ca-8e88-32531668aa18@byu.edu>
 <Y//40Oza+O5cjKNL@jeremy-acer>
In-Reply-To: <Y//40Oza+O5cjKNL@jeremy-acer>
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
From: Carson Buttars via samba-technical <samba-technical@lists.samba.org>
Reply-To: Carson Buttars <carson@et.byu.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We just submitted a merge request with the code. It would be great to 
hear what you or anyone else thinks about it!

Thanks,

Carson Buttars

On 3/1/23 18:16, Jeremy Allison wrote:
> On Wed, Mar 01, 2023 at 05:51:54PM -0700, Daniel Fussell via 
> samba-technical wrote:
>>
>> I've got a new student employee forward-porting our patch from late 
>> 2018/early 2019 for mountpoint detection and setting 
>> REPARSE_TAG_MOUNT_POINT.
>>
>> Our first porting attempt didn't seem to work, I'm guessing because 
>> of the rewite to use *at() and different code paths. We'd love to 
>> work with you on this.
>
> Well the first thing to do would be to make the
> code available somewhere we can get at to look
> at it. Github or Gitlab would be a good start !
>
> Thanks,
>
> Jeremy.
>
>

