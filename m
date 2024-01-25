Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FDF83C615
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jan 2024 16:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oAZlY5FFShoqY2jzLb0BK5KQwuTtjmp0YybmXSZUEAw=; b=FuNwAa7yl91caMLx8W8ED6s81S
	ikjAdfB08XG64knYeC+soUQh6AGoDf0k+ohjHWtLfwtBLPRJZtbiqIVYQRckG16jlPtAaMkW983Rn
	DuzaMQrOfqESsXCP3nt2rjfGbSMxavSbergetLiW81d4UxS4yfHb6P0fgPY8Y9xHe3d2/Ub5tuq2k
	+BzgAi3GrlgMR5yc94ZWW3QEmu3W2++c9XcEpKC2jvbZuwcbyYwevBoZnGnMzFucGPuslgD7zERhg
	me54MNK7EiEK2tuj2IJN80Q7T7Ar1AL3RKDKYVZ4FkyCXrNfdkJQml7ID3WWGmUZCNJELq1KAjXvH
	064POOHQ==;
Received: from ip6-localhost ([::1]:60554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rT1K9-004Rft-Vs; Thu, 25 Jan 2024 15:07:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52901) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rT1K5-004Rfl-3K
 for samba-technical@lists.samba.org; Thu, 25 Jan 2024 15:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706195234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oAZlY5FFShoqY2jzLb0BK5KQwuTtjmp0YybmXSZUEAw=;
 b=jUPBUMoy+Z4t8eZysbScZ9jG4f2Rtr6+fHs//B+CHk/i7b8n6FCwz0XEWvLpLqbiLeANzH
 K0qWIp3gZgSi2moN8i6dyBbSnK5GXVSie6cwn9rp+V9w2/MJYsDPNm5Q9gMeU/T3lM9pE/
 kwAdJSKXV3z207rEJL46rc1pvN++Uxk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706195234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oAZlY5FFShoqY2jzLb0BK5KQwuTtjmp0YybmXSZUEAw=;
 b=jUPBUMoy+Z4t8eZysbScZ9jG4f2Rtr6+fHs//B+CHk/i7b8n6FCwz0XEWvLpLqbiLeANzH
 K0qWIp3gZgSi2moN8i6dyBbSnK5GXVSie6cwn9rp+V9w2/MJYsDPNm5Q9gMeU/T3lM9pE/
 kwAdJSKXV3z207rEJL46rc1pvN++Uxk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-216-c9iSLK8_Pc6WcUKnO_R9ng-1; Thu,
 25 Jan 2024 10:07:07 -0500
X-MC-Unique: c9iSLK8_Pc6WcUKnO_R9ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9553381AE4A;
 Thu, 25 Jan 2024 15:07:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE6F1121306;
 Thu, 25 Jan 2024 15:07:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <B01D6639-6F09-4542-A1CE-5023D059B84F@redhat.com>
References: <B01D6639-6F09-4542-A1CE-5023D059B84F@redhat.com>
 <520668.1706191347@warthog.procyon.org.uk>
To: Benjamin Coddington <bcodding@redhat.com>
Subject: Re: Roadmap for netfslib and local caching (cachefiles)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <524117.1706195224.1@warthog.procyon.org.uk>
Date: Thu, 25 Jan 2024 15:07:04 +0000
Message-ID: <524118.1706195224@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: linux-cifs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Eric Sandeen <esandeen@redhat.com>, samba-technical@lists.samba.org,
 v9fs@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
 linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, linux-afs@lists.infradead.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Benjamin Coddington <bcodding@redhat.com> wrote:

> > NFS.  NFS at the very least needs to be altered to give up the use of
> > PG_private_2.
> 
> Forgive what may be a naive question, but where is NFS using PG_private_2?

aka PG_fscache.

See nfs_fscache_release_folio() for example where it uses folio_test_fscache()
and folio_wait_fscache().

David


