Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2133BC1D0
	for <lists+samba-technical@lfdr.de>; Tue, 24 Sep 2019 08:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=XiCuHNI1g5qn+KPlGov8evKHS4grikdmAbIUZGvTHVk=; b=w2Fmd9N/qvZKnk82n2I5+lTqRD
	UszwhY1vFTh7Md7p06SN03X9pORX9zRrFHtLPnlKfCW9oDym7r2kk79AA3P/6ZHDVR7o4kJSbU1h5
	Esb+h38mPT8C1/MrdsQCSRqzaDhehFRpH4CGuclEoVaAGuYdwZGx9h6XEETw+p5cku0Lz/760Yona
	uhpVdWilQ4gw5SQMLfNmxUxLomskhdFoAzgmASO+mjHMVv+qNFk0AlY8rJXnOYVNctXFp96efvsUy
	/j4fDp97niFvOPgXFl63Ltvi8KiPNgBlbtx6RLmb6WFKANTaOa+iPkpi2imz47Qq7M5gWg3KkPhAF
	8NqBeaqw==;
Received: from localhost ([::1]:28532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCePB-0088cA-DK; Tue, 24 Sep 2019 06:34:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCeOy-0088c1-0T
 for samba-technical@lists.samba.org; Tue, 24 Sep 2019 06:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=XiCuHNI1g5qn+KPlGov8evKHS4grikdmAbIUZGvTHVk=; b=iGMJPTq+jWgNwNCxVWlkisobdI
 lGTNyZDyiVnXYUuE+Dyxnr9WOApTY8MZQjRS4h73zfRFeWGAw0xS0ILYrdzKvrhagTOO0ToWZHyCM
 uP58DYrM2/UICk86qNfBw8qw1tMxhVq5dWXnbKj6EEYiZuTEI44msPMmYApnE5h8UxAE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCeOw-00042k-5M
 for samba-technical@lists.samba.org; Tue, 24 Sep 2019 06:34:18 +0000
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
To: samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
Message-ID: <21a27887-ef4f-2c51-f511-e682f1548a22@samba.org>
Date: Tue, 24 Sep 2019 07:34:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
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

On 23/09/2019 22:45, Stefan Metzmacher wrote:
> Hi Rowland,
>
>> On 23/09/2019 20:39, Christof Schmitt via samba-technical wrote:
>>> The behavior of winbindd changed in regards to whether a group with
>>> ID_TYPE_BOTH returns a fake user structure. This surfaced during a test
>>> of creating files from a SMB client and then checking the ownership
>>> directly on the file system.
>>>
>>> make testenv SELFTEST_TESTENV=ad_member_idmap_rid
>>> is an environment that provides ID_TYPE_BOTH for testing.
>> Surely if that is a testenv, then it should be removed or modified, a
>> Unix domain member using idmap_rid will not work in that way, using
>> 'getent passwd' against a group returns nothing.
> No, it did with 4.5 and that's how it's supposed to be.
> That's exactly what ID_TYPE_BOTH is all about.
>
> metze
>
Well, it doesn't do that on an actual Unix domain member using the 
winbind rid backend, but then, from my understanding, idmap.ldb is only 
read on a DC, or am I missing something ?

Rowland


