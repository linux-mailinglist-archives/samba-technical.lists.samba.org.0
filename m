Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E301B53998
	for <lists+samba-technical@lfdr.de>; Thu, 11 Sep 2025 18:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=srxHJhhiDdL6phJrQcSzmrUkW9hOG/BKDUogbzi+Hmw=; b=qvwYDJJGswjJwQNpHSqL1VPSLu
	BMNmnH3mYCZfDGt4lEPm7AM1hkkaVbR1GwFNTOCNQI5bAvKp8DEo7Wa8lClEWsiT5PpiDWA4Aho7g
	eoern8rKdL8D6HOCwMWXVGcH7uY8rMW2gpNbBIt92WRfPSwydaGev7F4QZOZvUA+g1NsDf3HUdBwj
	DZA92bf/UATw/OfTSJKv7+5OSLqYq+OF3XNfNGIG3xxx2ZyHMZW5JgSw3EhyZg8kKPeoltjzONfPF
	IMLm4+JqilLy35FuXFuEUPQUStGxaw3G/ZPrexI39+dlIdUIvAKoyl8GMaIMalsiVmmyzQe2Ndun5
	g4wUOz1g==;
Received: from ip6-localhost ([::1]:29994 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwkTD-003ZNC-PD; Thu, 11 Sep 2025 16:48:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42227) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwkT9-003ZN5-4R
 for samba-technical@lists.samba.org; Thu, 11 Sep 2025 16:48:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757609299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srxHJhhiDdL6phJrQcSzmrUkW9hOG/BKDUogbzi+Hmw=;
 b=fs8g5LjzqrKJ7kr6vf6gPxl3UkA6cqMTlR2t4hO+dXkV5HyvFv7ygbTYRbwdFzlmqss4we
 yZsiruUrDK+TLl1SWTMwtXWFGrs3MrH0VClgNnbRWqS8t9m4N6ftkUcQ+ehp4LIscfOgyY
 XNq935eGGQv8hK6vUzOflJ90RZA9koA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757609299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srxHJhhiDdL6phJrQcSzmrUkW9hOG/BKDUogbzi+Hmw=;
 b=fs8g5LjzqrKJ7kr6vf6gPxl3UkA6cqMTlR2t4hO+dXkV5HyvFv7ygbTYRbwdFzlmqss4we
 yZsiruUrDK+TLl1SWTMwtXWFGrs3MrH0VClgNnbRWqS8t9m4N6ftkUcQ+ehp4LIscfOgyY
 XNq935eGGQv8hK6vUzOflJ90RZA9koA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-371-VZAKZYXcNOGnZ5IeFPJMnw-1; Thu,
 11 Sep 2025 12:32:04 -0400
X-MC-Unique: VZAKZYXcNOGnZ5IeFPJMnw-1
X-Mimecast-MFC-AGG-ID: VZAKZYXcNOGnZ5IeFPJMnw_1757608322
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D1EC61944F03; Thu, 11 Sep 2025 16:32:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.6])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D99611800576; Thu, 11 Sep 2025 16:31:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <2025091109-happiness-cussed-d869@gregkh>
References: <2025091109-happiness-cussed-d869@gregkh>
 <20250911030120.1076413-1-yangerkun@huawei.com>
 <2780505c-b531-7731-3c3d-910a22bf0802@huawei.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] cifs: fix pagecache leak when do writepages
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1955890.1757608316.1@warthog.procyon.org.uk>
Date: Thu, 11 Sep 2025 17:31:56 +0100
Message-ID: <1955891.1757608316@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
Cc: pc@manguebit.com, sfrench@samba.org, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, ematsumiya@suse.de,
 yangerkun <yangerkun@huawei.com>, samba-technical@lists.samba.org,
 yangerkun@huaweicloud.com, lsahlber@redhat.com, dhowells@redhat.com,
 tom@talpey.com, nspmangalore@gmail.com, stable@kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Greg KH <gregkh@linuxfoundation.org> wrote:

> Yes, please include the info as to why this is not a backport from
> upstream, and why it can only go into this one specific tree and get the
> developers involved to agree with this.

Backporting the massive amount of changes to netfslib, fscache, cifs, afs, 9p,
ceph and nfs would kind of diminish the notion that this is a stable
kernel;-).

David


