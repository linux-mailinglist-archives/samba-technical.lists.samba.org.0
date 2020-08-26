Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDAA252AD9
	for <lists+samba-technical@lfdr.de>; Wed, 26 Aug 2020 11:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=AXn/IaRq8ICldGNoYAG9jovmNkTFkUq4cuiJ28RhPBY=; b=erFT/wCTN5iEGOzqbf7H2GsnuP
	zKqttfwNUebQECVhid4DvZA4iayY7efTa91X9FbVMgmMAD8Mr1+FMcr4IAPMGFC1RK/TQJ1MqMKUq
	I2rHBCtowoS+HtMVM94aFCwapUVVfmoAJd61E+TY/O2b/GPS/BaOrqVlPpAsosTErJl6p8FjEItjE
	z5nNxJDatFnAIS0Lo7ubg5MEQ1iwvHyBdllqdH8MOcJbzgDz+7yTExjhiGxf2Hkyi9NT4dqyn2Geh
	sueVmflBFf4eHXOjL0uBPBJ58OelOaoVCXkDNzhk4QZUY4LLxOkxziID8N3DLRY8zAZGdSsfS2bDY
	NiyOYh4Q==;
Received: from localhost ([::1]:35788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kAs9i-000dCw-Ob; Wed, 26 Aug 2020 09:55:46 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44762
 helo=us-smtp-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kAs9d-000dCc-Rc
 for samba-technical@lists.samba.org; Wed, 26 Aug 2020 09:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598435731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXn/IaRq8ICldGNoYAG9jovmNkTFkUq4cuiJ28RhPBY=;
 b=achj2LdEhcN1IuEsla8ah/1pxhrLOedRJd6C0aF6gZO6AquZt4qvFPFB+x9uiPWpAUCJ/n
 s1JVbRbYalTL65qaOLKutLIAEUak/N5wJ/iW/sYTfzMGliH6JOuimGUjIN9glUfSC8h43r
 YcgFfEkIM9TmDv0KUBepFQCHiMeWUvY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598435731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXn/IaRq8ICldGNoYAG9jovmNkTFkUq4cuiJ28RhPBY=;
 b=achj2LdEhcN1IuEsla8ah/1pxhrLOedRJd6C0aF6gZO6AquZt4qvFPFB+x9uiPWpAUCJ/n
 s1JVbRbYalTL65qaOLKutLIAEUak/N5wJ/iW/sYTfzMGliH6JOuimGUjIN9glUfSC8h43r
 YcgFfEkIM9TmDv0KUBepFQCHiMeWUvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-gtn-jD58POWPrt3ijFhdVw-1; Wed, 26 Aug 2020 05:54:10 -0400
X-MC-Unique: gtn-jD58POWPrt3ijFhdVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEBAA189E602;
 Wed, 26 Aug 2020 09:54:09 +0000 (UTC)
Received: from pbrezina.my (unknown [10.40.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7EA160D34;
 Wed, 26 Aug 2020 09:54:08 +0000 (UTC)
Subject: Re: tevent: fd events do not work correctly for UDP socket?
To: Stefan Metzmacher <metze@samba.org>, Jeremy Allison <jra@samba.org>
References: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
 <20200818163118.GA8897@jeremy-acer>
 <84f904bf-0a67-4595-2ab0-de4fa021a7a5@redhat.com>
 <ab30a78a-c442-d5a4-614c-3be0c32e680c@samba.org>
Message-ID: <4acc5a8d-97b0-87ce-15ca-545456478b3b@redhat.com>
Date: Wed, 26 Aug 2020 11:54:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ab30a78a-c442-d5a4-614c-3be0c32e680c@samba.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbrezina@redhat.com
X-Mimecast-Spam-Score: 0.002
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

On 8/19/20 9:24 PM, Stefan Metzmacher wrote:
> Hi Pavel,
> 
>>> Do strace ./client to see why this is:
>>>
>>> The key is here:
>>>
>>> write(1, "File descriptor is readable!\n", 29File descriptor is readable!
>>> ) = 29
>>> read(4, 0x7fffeee02750, 254)            = -1 ECONNREFUSED (Connection refused)
>>>
>>> Your connect call succeeds, as it's setting up the local
>>> binding to the remote address, but as it hasn't sent any
>>> data yet the client hasn't noticed there's no one listening.
>>>
>>> Once you do the:
>>>
>>>        const char *msg = "I AM CONNECTED\n";
>>>        write(fd, msg, strlen(msg));
>>>
>>> call then the kernel tries to send the data, notices
>>> there's nothing listening and so the read fd becomes
>>> ready via EPOLL - it needs to return the error
>>> ECONNREFUSED (we select for EPOLLIN|EPOLLERR|EPOLLHUP).
>>>
>>> So when you call the read() in the tevent handler,
>>> that's when you'd pick up the errno = ECONNREFUSED
>>> error.
>>
>> I see. If I understand it correctly epoll returns EPOLLERR and the code hits this [1] line?
>>
>>> I don't think this is tevent specific behavior.
>>
>> If the above is true then tevent should provide way for the handler to check for errors or don't call a read handler on an error so read does not get called.
>>
>> My use case is that I'm trying to implement a CLDAP ping over UDP in SSSD and when a Domain Controller is unreachable the read handler is fired, then ldap tries to receive
>> a reply and blocks until network timeout is reached which is undesirable.
>>
>> [1] https://github.com/samba-team/samba/blob/master/lib/tevent/tevent_epoll.c#L707
> 
> You need to mark the socket non-blocking in order to avoid any blocking.
> 
> I have some patches to add TEVENT_FD_ERROR, but they are not upstream as there wasn't a strict need for.
> In the beginning select was the main backend of tevent, there was no POLLERR,POLLHUP.
> So errors are reported with TEVENT_FD_READ, as a read/recv is typically required to get the error.

Thank you for all the hints. It turned out to be a bug in libldap [1] 
which calls recvfrom twice in a row for UDP calls. The first call will 
consume the error (ECONNREFUSED) and the other call will then block 
because there's nothing to receive.

[1] https://bugs.openldap.org/show_bug.cgi?id=9328


