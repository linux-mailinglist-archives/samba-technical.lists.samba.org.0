Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C3B29284
	for <lists+samba-technical@lfdr.de>; Sun, 17 Aug 2025 11:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OI4yJdSASRHDaXzs0fqnSdNo/8g/kJLlvZ5t0H3MptY=; b=JIY/fvwKslcI2jj+NSsICcRAY9
	/IxV9YmNQLbLHFG+2nNAFozJ3T50+l8bHdViCkVhbAoqUXXr+iKiqd0LjqcqJgx9B4Nj4JxViW39K
	R3uNWorr+SckZbSN+BujfB4jfu0yPE90yRfPqsENcd3fi4w4y3QQNr04jMrek9N4MLjXpL4VcrnQR
	NU9tpkjhVm7bfvu1uVzMDB4wWIJcDFnl3q3jTnetEIAeD2rncHw9N97WE055E8dBZI0wFRHr/31TY
	hQYYEvaNPKCgZKznNYeQLruhcQmynYqP+xEPbKStrstXcN7vGwnPwo5cJuXd0zXLSpXQ8GnKtuM0X
	awax223g==;
Received: from ip6-localhost ([::1]:45564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1unZxJ-00FB83-RJ; Sun, 17 Aug 2025 09:45:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1unZxF-00FB7v-Hv
 for samba-technical@lists.samba.org; Sun, 17 Aug 2025 09:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=OI4yJdSASRHDaXzs0fqnSdNo/8g/kJLlvZ5t0H3MptY=; b=nydQK3/pT2L0WvvHlWcIyMLeX2
 BW8oHniUT3OXbbW4b9nZmX16ioFslGIxeCZItCXnAqEE4s9Gtld1K1CwaeqKuaZZvnB4hgJ2DPpF4
 HdwCy8rqsKWoFSIUyhz188yJj0f/BE+MiBR/k/g9r1kwnUeFnkZzebxsLkaROn4QmBJ8wENcefJlo
 QAm8Fw0goAhWOYhAElYPVKmIxi4iFO7bpIhSTe8CAlZ+FIFzcpV9fXrts65tBk3hCYiB2ekkrjFdV
 JTG82YacO2mFBDhyVpvqgozuSfzgjUm+IuOLJSTX3Mi4vzgkb4a1m/Y0A4mXE7l+Ac2luMalvwzRa
 kckB8HwY2tT1Ub7IEyi2VYiN1n4wdl341xqGp5en6Sxvf/dKpwwCc5fCg1CMIATpn3jO+OuBlIfPT
 MQ3qKKLFYom5dvQuYeMx4gTtu1xMMfDOXnZhUsWKKd/F5cQT9TjSRLXj6JZ+G7JAmsEY5BP/GQIFP
 SVRZElSX7CHYTRV17Hf0rFvD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1unZxE-003GXO-0Q; Sun, 17 Aug 2025 09:45:32 +0000
Message-ID: <c582ccee-9425-4f4e-a04a-c86e9992e917@samba.org>
Date: Sun, 17 Aug 2025 11:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.16 563/627] smb: client: let send_done() cleanup before
 calling smbd_disconnect_rdma_connection()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250812173419.303046420@linuxfoundation.org>
 <20250812173453.306156678@linuxfoundation.org>
 <527dc1db-762e-4aa0-82a2-f147a76f8133@samba.org>
 <2025081325-movable-popcorn-4eb8@gregkh>
 <6acc8228-da51-4528-87c4-4cb2c96d3e8a@samba.org>
 <2025081301-carpool-gully-cbfc@gregkh>
Content-Language: en-US
In-Reply-To: <2025081301-carpool-gully-cbfc@gregkh>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, patches@lists.linux.dev,
 stable@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 Steve French <smfrench@gmail.com>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Greg,

>>>> Am 12.08.25 um 19:34 schrieb Greg Kroah-Hartman:
>>>>> 6.16-stable review patch.  If anyone has any objections, please let me know.
>>>>>
>>>>> ------------------
>>>>>
>>>>> From: Stefan Metzmacher <metze@samba.org>
>>>>>
>>>>> [ Upstream commit 5349ae5e05fa37409fd48a1eb483b199c32c889b ]
>>>>
>>>> This needs this patch
>>>> https://lore.kernel.org/linux-cifs/20250812164506.29170-1-metze@samba.org/T/#u
>>>> as follow up fix that is not yet upstream.
>>>>
>>>> The same applies to all other branches (6.15, 6.12, 6.6, ...)
>>>
>>> Thanks, now queued up.
>>
>> Even if it's not upstream yet?
>> I thought the policy is that upstream is required first...
>>
>> It's only here
>> https://git.samba.org/?p=sfrench/cifs-2.6.git;a=shortlog;h=refs/heads/for-next
>> as
>> https://git.samba.org/?p=sfrench/cifs-2.6.git;a=commitdiff;h=8b2b8a6a5827848250c0caf075b23256bab4ac88
>>
>> But that commit hash can change on rebase.
> 
> Ah, I thought since this was in linux-next it would not rebase.  Having
> public trees that rebase is dangerous...
> 
> Anyway, I'll go drop both of these now, please let us know when you want
> these added back.

It landed as 8c48e1c7520321cc87ff651e96093e2f412785fb, so
5349ae5e05fa37409fd48a1eb483b199c32c889b can be backported
with 8c48e1c7520321cc87ff651e96093e2f412785fb being the fixup.

Thanks!
metze


