Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260124A4F7
	for <lists+samba-technical@lfdr.de>; Wed, 19 Aug 2020 19:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=h+DnQemBJIqMDQUFL4GRD8PCmYCbyE5qFlpG0/++/FI=; b=6J/+19+PzrbTx5AXhJJ6m08uGa
	9xl4hkyEFMgTrYWKL+Ecqx+AmZp+RxSBcPuQciAzcQXBZbRmPZAVh4uW0CMnZzEOJWsnO+BaoaHlt
	JTUu10ykgKvjnLcmYPoyOSA9UcF6J2ow545vBbivzH2mBxHzBL2ODYN/Ghv/53i0Rw40jUEspO04L
	xzuFE5NkGirvHWpwm0Mgc9siItjysYGTgp/muDb6Lkq5gmA8aUTJVwG5gdOEH/eRYdBbZUOeULHQK
	ArTMD3+r+Iile9gKTZRyqgGF2ZF8bqGdqPB0gIxsEpqCYcDBxPDdv5Y3eRb8jRrVlWjyO8qst1BmU
	1WWAbM5Q==;
Received: from localhost ([::1]:30676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8RwI-00EIhH-Vx; Wed, 19 Aug 2020 17:31:55 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46469
 helo=us-smtp-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k8RwC-00EIh9-1j
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 17:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597858298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+DnQemBJIqMDQUFL4GRD8PCmYCbyE5qFlpG0/++/FI=;
 b=MQ4yCubDktATeRyAgikoN2mwNV+TmuL2hStdT2EF7Aox83Qges517NlVCStaJEvPsWY5Pu
 BnWY1PKwlkE7jR5Yhun9c/+/NW7rhZa8TcCHHcc/++Tbn7+zKIZ1Ma5io1uc99Wge8pBEW
 p7EReMFbXjWMA6e/tIRyPU4Uisj1b1g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597858299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+DnQemBJIqMDQUFL4GRD8PCmYCbyE5qFlpG0/++/FI=;
 b=L6UZKM/WleLe3WK6Gd3gcJMEY8gNYXfMyiozYGe8JEkWPGYBuJ7TOWUArYlS7qPY9RHTJU
 u1yU+2R7LB9d2m/WI+06kCULiMeQPtsRnJB7r7HO1u2/2yt/zfC4TolZF8m0AWaNrB7eTt
 U3qL0PbcOH3VtQoDV0bYFRnflTltNGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-W5EI7cs9MOuGfJyrFO9Uzg-1; Wed, 19 Aug 2020 13:15:15 -0400
X-MC-Unique: W5EI7cs9MOuGfJyrFO9Uzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3EEC64081;
 Wed, 19 Aug 2020 17:15:14 +0000 (UTC)
Received: from pbrezina.my (unknown [10.40.192.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2836F5F9C0;
 Wed, 19 Aug 2020 17:15:13 +0000 (UTC)
Subject: Re: tevent: fd events do not work correctly for UDP socket?
To: Jeremy Allison <jra@samba.org>
References: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
 <20200818163118.GA8897@jeremy-acer>
Message-ID: <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>
Date: Wed, 19 Aug 2020 19:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200818163118.GA8897@jeremy-acer>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbrezina@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Warn: EHLO/HELO not verified: Remote host 205.139.110.120
 (us-smtp-delivery-1.mimecast.com) incorrectly presented itself as
 us-smtp-1.mimecast.com
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
From: =?utf-8?q?Pavel_B=C5=99ezina_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_B=c5=99ezina?= <pbrezina@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 8/18/20 6:31 PM, Jeremy Allison wrote:
> On Tue, Aug 18, 2020 at 01:46:09PM +0200, Pavel Březina via samba-technical wrote:
>> When I connect to a port over UDP and nobody listens on the port tevent
>> fires immediately read fd event even though there is no data available.
>>
>> Simple reproducer is attached. Just run 'make && ./client' and see that
>> read_handler is executed immediately. When there is a process listening (nc
>> -ul 3333) the handler is fired only when data is available.
>>
>> This probably boils down to epoll_wait but not being an epoll export, I'd
>> like to ask if there is something that can be done about it or if it is an
>> expected behavior.
> 
> Do strace ./client to see why this is:
> 
> The key is here:
> 
> write(1, "File descriptor is readable!\n", 29File descriptor is readable!
> ) = 29
> read(4, 0x7fffeee02750, 254)            = -1 ECONNREFUSED (Connection refused)
> 
> Your connect call succeeds, as it's setting up the local
> binding to the remote address, but as it hasn't sent any
> data yet the client hasn't noticed there's no one listening.
> 
> Once you do the:
> 
>       const char *msg = "I AM CONNECTED\n";
>       write(fd, msg, strlen(msg));
> 
> call then the kernel tries to send the data, notices
> there's nothing listening and so the read fd becomes
> ready via EPOLL - it needs to return the error
> ECONNREFUSED (we select for EPOLLIN|EPOLLERR|EPOLLHUP).
> 
> So when you call the read() in the tevent handler,
> that's when you'd pick up the errno = ECONNREFUSED
> error.

I see. If I understand it correctly epoll returns EPOLLERR and the code 
hits this [1] line?

> I don't think this is tevent specific behavior.

If the above is true then tevent should provide way for the handler to 
check for errors or don't call a read handler on an error so read does 
not get called.

My use case is that I'm trying to implement a CLDAP ping over UDP in 
SSSD and when a Domain Controller is unreachable the read handler is 
fired, then ldap tries to receive a reply and blocks until network 
timeout is reached which is undesirable.

[1] 
https://github.com/samba-team/samba/blob/master/lib/tevent/tevent_epoll.c#L707


