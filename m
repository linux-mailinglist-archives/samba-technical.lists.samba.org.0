Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E54226E2BA0
	for <lists+samba-technical@lfdr.de>; Fri, 14 Apr 2023 23:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1+qRQYdbLpo2MoNmp5brxRqtl35OpeD3j4wMhdsk6W8=; b=Ne63kHzhgSkEQmagyXSTV52i/9
	K4wyD6jMzB21MSqxpPlHQwWUQz4aQKz9prs7LUbTqrKQNe+N6YVN3mRnlKUpzTnueAGBlSEUPMCwS
	8695z/H/GyP/yog6uGrVwl7J8VzpXnIObjKh4Oz6yatl6+CSyZ1KctFQcrHNSQ79lAP+nTx/0YQba
	Sp+mhK1mn/VQjiYPHMGIFZVVPRPXME1CUPqtDZxizvmRu+aX2YDA9dRh8w83AIuI/hMigJ35AGlEs
	ttsnI7hWK1a7Cbt0QWsNZrXdVYnR9XWmzx0Dr46gSFzr0uLdTQBP23djo3Zlf4WQAWGL8jq7jPqWi
	agfBksQQ==;
Received: from ip6-localhost ([::1]:64848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pnQoS-001zXF-S9; Fri, 14 Apr 2023 21:18:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39443) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pnQoO-001zX6-1W
 for samba-technical@lists.samba.org; Fri, 14 Apr 2023 21:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681507104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+qRQYdbLpo2MoNmp5brxRqtl35OpeD3j4wMhdsk6W8=;
 b=Rn6qyVVecDRxrKg0OtQBwODXrYPX3H6gMhENtgNo4MfzfngG5WKYFbguuE0KdRgFBGqUMZ
 FY3leKJRdwu1cKc6vUHth8RRRw8HVu5IbXpmfIzH1u5quGhfxS4jTfdkoHjwrzbNAnLs7t
 fhCOhz3S8ivHiCUJzoewW1DT0zd4Tfg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681507104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+qRQYdbLpo2MoNmp5brxRqtl35OpeD3j4wMhdsk6W8=;
 b=Rn6qyVVecDRxrKg0OtQBwODXrYPX3H6gMhENtgNo4MfzfngG5WKYFbguuE0KdRgFBGqUMZ
 FY3leKJRdwu1cKc6vUHth8RRRw8HVu5IbXpmfIzH1u5quGhfxS4jTfdkoHjwrzbNAnLs7t
 fhCOhz3S8ivHiCUJzoewW1DT0zd4Tfg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-CThifQ9NMEahP4tX-JPctg-1; Fri, 14 Apr 2023 17:02:46 -0400
X-MC-Unique: CThifQ9NMEahP4tX-JPctg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A069D185A790;
 Fri, 14 Apr 2023 21:02:46 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 155A8C16028;
 Fri, 14 Apr 2023 21:02:45 +0000 (UTC)
To: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Subject: Re: talloc vs malloc speed
References: <3161922.5fSG56mABF@magrathea>
Date: Fri, 14 Apr 2023 23:02:43 +0200
In-Reply-To: <3161922.5fSG56mABF@magrathea> (Andreas Schneider via
 samba-technical's message of "Fri, 14 Apr 2023 20:11:46 +0200")
Message-ID: <873552p47g.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

* Andreas Schneider via samba-technical:

> I wonder if it would be possible to give the optimizer more hints. Maybe 
> Florian has some ideas :-)

You need to check that with optimization, the compiler does not elide
malloc/free calls completely.  That might give malloc an unfair
advantage.  GCC knows that malloc/free have no observable side effect,
so if it can see the whole program, it sometimes can turn heap
allocations into stack allocations.  GCC also knows that memory returned
by malloc cannot alias anything, and that writes to the object before
free can be eliminated.  The latter might be meaningful for
microbenchmarks.

Some of these behaviors can be enabled through function attributes,
however I'm not sure how much of that would be correct for talloc.  If I
recall correctly, it has destructor callbacks, which means that
arbitrary code can run on free, and that rules out dead store
elimination.

If talloc is layered on top of system malloc, using its own allocator
geared to its particular metadata requirements could reduce memory
overhead and make certain things go faster, but it's also a lot of work.

Thanks,
Florian


