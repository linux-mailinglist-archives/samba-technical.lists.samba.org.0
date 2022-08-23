Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 337FF59E504
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 16:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cNul7dRswnU49jAHhKW2/LuUqpnr2B4b53UC3aSpkn8=; b=yU6zaEYsrE8N7FuyHaSnBy5Qbe
	NHdqGrRl0yvzQnbmgz/D2cVzqsPxFSsqRIOH/m/vhGny4PqpuZLojfQdZL5Yyu1Iu5vIXHh77pO8z
	roNaoYConMWGvecwKOFKtYHlZhpU1KalH7CfD7wa3doBwnqZ9n5gcHp2QW8xfN+1JUGlwDDe8V4Dx
	eSZDW8RiDAXK0/2vpeCsoHrPI2SxiEyYturMZz/Mib1hq5GAZcanINSG/3Tusgo0yDwNbJvy5ag0H
	0mWtSCciZb600rqFFrA0VyApSmqBmvseePoezB3erxbPfeAw+VxA+ey7u5Rxo+816vVnvKtdNxr8c
	7zJZkp7g==;
Received: from ip6-localhost ([::1]:52848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQUjA-0022ya-6J; Tue, 23 Aug 2022 14:18:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44957) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oQUj5-0022yR-7f
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 14:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661264271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNul7dRswnU49jAHhKW2/LuUqpnr2B4b53UC3aSpkn8=;
 b=S9FItnj8zntttGaTMoit7bdXO9pOXBmP27cGPnYLGrZ1rAT3nvPYfI7Zf7YN4mXrmshHxD
 bFmaB+APXJ1LCt3wZORVPvg141JVZdajOdQdkF42jZSDqFb/QyHd8YPYlp88RXuZWUTv6B
 TzckitMK9oN/iVnUIReEh63jhCMvqtc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661264271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNul7dRswnU49jAHhKW2/LuUqpnr2B4b53UC3aSpkn8=;
 b=S9FItnj8zntttGaTMoit7bdXO9pOXBmP27cGPnYLGrZ1rAT3nvPYfI7Zf7YN4mXrmshHxD
 bFmaB+APXJ1LCt3wZORVPvg141JVZdajOdQdkF42jZSDqFb/QyHd8YPYlp88RXuZWUTv6B
 TzckitMK9oN/iVnUIReEh63jhCMvqtc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-AyojJJ-mM6OE64Wv4v40zg-1; Tue, 23 Aug 2022 10:17:48 -0400
X-MC-Unique: AyojJJ-mM6OE64Wv4v40zg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73327893155;
 Tue, 23 Aug 2022 14:17:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5185EC15BB3;
 Tue, 23 Aug 2022 14:17:26 +0000 (UTC)
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
Content-ID: <719242.1661264245.1@warthog.procyon.org.uk>
Date: Tue, 23 Aug 2022 15:17:25 +0100
Message-ID: <719244.1661264245@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

> >  	filemap_write_and_wait(inode->i_mapping);
> > +	truncate_pagecache_range(inode, off, old_eof);
> 
> It's a bit odd to writeback the entire file but then truncate only part
> of it.  XFS does the same part:

Actually, filemap_write_and_wait() should check for error, yes.

Is there something that combines these that we should use?
invalidate_inode_pages2_range() for example.

David


