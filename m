Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5F6E50B4
	for <lists+samba-technical@lfdr.de>; Mon, 17 Apr 2023 21:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YphxJtggicAaQwARV3CKpfU6s/UDGeMIh8lSehl6le4=; b=kiuaf7w7WpolVjYuUV02S+Y2pk
	lHGHi/heKLVjkgPUlOxTacR+PHA4sg+og01EuwY1PzERP5ZWsXmcHYdHqTbazAvE5GIIwg9B84NuH
	Xkc9Ynb7R1mxDsZQMoGDuO0xLU/HRjqz8GglsIkLH1llyMGs12dMDXxSfl/AhFql8jMoaJSh4fwVW
	OIwrWud/5YML7QbqXRozQncglxkldko9ZqqQ4zii1zBpEHJWDVwiuPiyNDGSAif0hkQoIOE3uQUn2
	vQs4LxqarUDwjmk71B8Pm6g5ni++f3NyJ0Rh8d4wAzEzsUVAQlTrukBdSIFuyWLO1HPM5NygZ+6zZ
	amEY6arw==;
Received: from ip6-localhost ([::1]:61944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poUK9-002N8I-0W; Mon, 17 Apr 2023 19:15:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1poUK4-002N89-Iq
 for samba-technical@lists.samba.org; Mon, 17 Apr 2023 19:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681758929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YphxJtggicAaQwARV3CKpfU6s/UDGeMIh8lSehl6le4=;
 b=Vy0acGochNxMHmuXDxmj1DPSQHa9I/lwS4+joDGqZ2LKyg6vvo1fo3jkQ+CcfxPyh9pPHv
 SwLkjm3zMFXcmRIoJkluZszvtvomY64m9Jf7i4EReGtGmEUNWanDLXYsS59wwRH9Tf/Ph9
 zfOREOQ5pyklB7WlG8Lb33lNYq0FqxQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681758929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YphxJtggicAaQwARV3CKpfU6s/UDGeMIh8lSehl6le4=;
 b=Vy0acGochNxMHmuXDxmj1DPSQHa9I/lwS4+joDGqZ2LKyg6vvo1fo3jkQ+CcfxPyh9pPHv
 SwLkjm3zMFXcmRIoJkluZszvtvomY64m9Jf7i4EReGtGmEUNWanDLXYsS59wwRH9Tf/Ph9
 zfOREOQ5pyklB7WlG8Lb33lNYq0FqxQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-_Z4htW9uPkm_L1B3N26etA-1; Mon, 17 Apr 2023 15:15:26 -0400
X-MC-Unique: _Z4htW9uPkm_L1B3N26etA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA26085A5A3;
 Mon, 17 Apr 2023 19:15:25 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1FEF1415304;
 Mon, 17 Apr 2023 19:15:24 +0000 (UTC)
To: Andreas Schneider <asn@samba.org>
Subject: Re: talloc vs malloc speed
References: <3161922.5fSG56mABF@magrathea> <4829322.31r3eYUQgx@magrathea>
 <87o7nmhils.fsf@oldenburg.str.redhat.com>
 <5829842.MhkbZ0Pkbq@magrathea>
Date: Mon, 17 Apr 2023 21:15:23 +0200
In-Reply-To: <5829842.MhkbZ0Pkbq@magrathea> (Andreas Schneider's message of
 "Mon, 17 Apr 2023 20:18:04 +0200")
Message-ID: <871qkigw1g.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

* Andreas Schneider:

> On Monday, 17 April 2023 13:07:59 CEST Florian Weimer via samba-technical 
> wrote:
>> * Andreas Schneider:
>> > Yes, we have support for destructor callbacks. Can you point me to the
>> > attributes which might help talloc?
>> 
>> I think of those listed here
>> 
>>   <https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html>
>> 
>> alloc_align, alloc_size, malloc, nothrow, returns_nonnull are relevant,
>> but not all them might be appropriate due to the way talloc works.
>
> I've started to look into them, thanks!
>
> The returns_nonnull did recognizable improvements to talloc pool().

The question is if it's true, it's only appropriate for xmalloc-style
interfaces.  How does talloc deal with OOM errors?

> Using alloc_size leads to a lot of reports. As soon we access the talloc 
> header it detects out of bounds access :-)

Yeah, especially with recent GCC and Clang.

> The malloc attribute can be set to a few functions, that helps. I use
> the attribute with the deallocator to avoid issue on free with
> destructors.

I *think* that should be safe, but I'm not entirely sure.  Maybe ask on
the GCC list?

> The documentation for nothrow is a bit short. What is an exception in C?

Same as in C++ on GNU/Linux, but you can't define your own exception
types.  It's used for pthread_cancel, among other things.  The advantage
is that there's no function pointer (equivalent) on the stack, unlike
with setjmp/longjmp-based pthread_cleanup_push.pthread_cleanup_pop.

Thanks,
Florian


