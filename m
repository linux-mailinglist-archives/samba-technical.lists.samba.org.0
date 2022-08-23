Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 626C859E4FD
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 16:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=34PbuF0eVwU1fZKmyxntLGj0oriQwCLeUvgJJbU6faI=; b=Foho0D1lcQk/3ytJZGQm5vuwqb
	9kCgYLNXpZAQdjxLowBwraoEHX6SXIvyTMEQ+p7GyifIanGTsjCgJ5RJt8tXtVuPvb254Im2+iPNM
	qnlU/Nvo2b2e1ocEAW3Y3kh4G28inYtO/cZC/iA4lHe4yEiFxRo/7xKjgqdC9jqiDAqBzG4GnKs58
	kzNnhKzwJL8Ojvmo6hbnMkZbNMAgqHOjyyoB8MSuZxBHIJCTDhYqHRqWs7M6JBP1IDp0OlBZDGPTB
	K/aQ0tvPPlG14KOfzGh3xbo9nggb/wCobwMFm0WkSsR35tqU4EpEfgV8oyAaMoBhqAnUdSTxsIBNT
	IR86LQjg==;
Received: from ip6-localhost ([::1]:25476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQUgO-0022gr-8P; Tue, 23 Aug 2022 14:15:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60990) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oQUgJ-0022gf-1U
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 14:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661264099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34PbuF0eVwU1fZKmyxntLGj0oriQwCLeUvgJJbU6faI=;
 b=gPDHTqxComfuxYHBM3hqAdRbNvAeCGf6NLqKiGQluW0tuGiDVM07HlC1b030JbiWFSbZHy
 PpD2rNsmWMJQh1kf/grYGWCFwsOsB4YIpO0Kw1Rcge4K8F5YkC2PR9lykmRGlGnSWoof0d
 iDD1Qc67o9TlNRNRS6y6UyUeposKgSI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661264100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34PbuF0eVwU1fZKmyxntLGj0oriQwCLeUvgJJbU6faI=;
 b=BQUkm7VUo/OkwFrPXypOB5AjLeflDP/lTD5tditKXGqtrzK/shfM3vHwz+wRwP5iCm5uxC
 uZJo05PTfvV3tr5gyscw/danqAGzllYqmfa2ndqN5dm7tcGqYIRLOKTiehQktsE20Se6Lz
 v22imlPblBo8iN5pYKUuGDSZYKvkxXo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-Q7bLziqjNHmD9kYI60vzyg-1; Tue, 23 Aug 2022 10:14:56 -0400
X-MC-Unique: Q7bLziqjNHmD9kYI60vzyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 229909682A2;
 Tue, 23 Aug 2022 14:14:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 013C81415138;
 Tue, 23 Aug 2022 14:14:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <YwTfPRDq04/DGTVT@casper.infradead.org>
References: <YwTfPRDq04/DGTVT@casper.infradead.org>
 <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
 <166126006184.548536.12909933168251738646.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 3/5] smb3: fix temporary data corruption in collapse range
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <714207.1661264094.1@warthog.procyon.org.uk>
Date: Tue, 23 Aug 2022 15:14:54 +0100
Message-ID: <714208.1661264094@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
From: David Howells via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Howells <dhowells@redhat.com>
Cc: sfrench@samba.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, lsahlber@redhat.com, dhowells@redhat.com,
 dchinner@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Matthew Wilcox <willy@infradead.org> wrote:

>         truncate_pagecache_range(inode, start, end);
> 
> ... and presumably, you'd also want the error check?

truncate_pagecache_range() is void.

David


