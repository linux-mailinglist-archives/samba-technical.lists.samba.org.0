Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A426E6E4651
	for <lists+samba-technical@lfdr.de>; Mon, 17 Apr 2023 13:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=0hhk89nXKduhjebWjCvRNGFEEKDWBMfnwJoIzUlAQNc=; b=WwQStNyuLknbe1e5nUr7dSM8V2
	2MH9iYtKMQIlC+HvwN005IZZIsjuYBFAbL7Xe5EO6FNS6LlCJuwRJQS1ecm/SG/lChF1iTnJzOENR
	LQYzczb4vu/w3ZWXpYUcQ35fr1R9u/0GJWmxG9+IfusY+M8LYBZXGmUHhWzBbWNPDDK2CNLe7GKNg
	qGK2/88Gi9oCiQBds5YL/MLpL7pTVxs9A0Jh+uvSqz8voZwDjV90eAyO5qx7VDosJqpwY5Ig9rYqR
	tdbQZiWMyMO5z1D/I61AEVOqcVniM2IwSbEEPC1wbt4LHjFxDxgcr3f+81WIaqB/nS7CYrsmzIAHF
	dxqTxDyQ==;
Received: from ip6-localhost ([::1]:61664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poMxu-002HRZ-H8; Mon, 17 Apr 2023 11:24:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34469) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1poMxo-002HRQ-73
 for samba-technical@lists.samba.org; Mon, 17 Apr 2023 11:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681730641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0hhk89nXKduhjebWjCvRNGFEEKDWBMfnwJoIzUlAQNc=;
 b=JN2BY1AwuqVGRWyTjucUHtfwx7XfxU5bxMwvdzoXTjNjVkNhh7phZzoJd02BjXZbIslb+4
 8IimM5UOfpk4d8JsnE/FPJHaXi0VvjatCfGvmetDLq0nWOgHQrrhZTLQlV/kjAhBIQA8bB
 I/p7fNNLhMq2OYHWx+yRsH3UDNq5CoI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681730641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0hhk89nXKduhjebWjCvRNGFEEKDWBMfnwJoIzUlAQNc=;
 b=JN2BY1AwuqVGRWyTjucUHtfwx7XfxU5bxMwvdzoXTjNjVkNhh7phZzoJd02BjXZbIslb+4
 8IimM5UOfpk4d8JsnE/FPJHaXi0VvjatCfGvmetDLq0nWOgHQrrhZTLQlV/kjAhBIQA8bB
 I/p7fNNLhMq2OYHWx+yRsH3UDNq5CoI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-T8g_eFPGOm6I36GidWr21w-1; Mon, 17 Apr 2023 07:08:02 -0400
X-MC-Unique: T8g_eFPGOm6I36GidWr21w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA2AF101A550;
 Mon, 17 Apr 2023 11:08:01 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A2347CD0;
 Mon, 17 Apr 2023 11:08:01 +0000 (UTC)
To: Andreas Schneider <asn@samba.org>
Subject: Re: talloc vs malloc speed
References: <3161922.5fSG56mABF@magrathea>
 <873552p47g.fsf@oldenburg.str.redhat.com>
 <4829322.31r3eYUQgx@magrathea>
Date: Mon, 17 Apr 2023 13:07:59 +0200
In-Reply-To: <4829322.31r3eYUQgx@magrathea> (Andreas Schneider's message of
 "Mon, 17 Apr 2023 12:34:47 +0200")
Message-ID: <87o7nmhils.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
From: Florian Weimer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Florian Weimer <fweimer@redhat.com>
Cc: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

* Andreas Schneider:

> Yes, we have support for destructor callbacks. Can you point me to the 
> attributes which might help talloc?

I think of those listed here

  <https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html>

alloc_align, alloc_size, malloc, nothrow, returns_nonnull are relevant,
but not all them might be appropriate due to the way talloc works.

These attributes are mostly about improving diagnostics, I think, not so
much for performance.

>> If talloc is layered on top of system malloc, using its own allocator
>> geared to its particular metadata requirements could reduce memory
>> overhead and make certain things go faster, but it's also a lot of work.
>
> talloc is basically a bunch of pointer arithmetic around malloc()/free() call.
>
> It has desctructors and also keeps track of the hierarchy. So you can free a 
> an allocated pointer with all its children.
>
> Interesting that those few pointer calculations make it so much slower.

That's indeed surprising (especially if talloc doesn't take locks around
allocations and frees).  Maybe the working set size exceeds the CPU
cache size due to the metadata size increase?

Thanks,
Florian


