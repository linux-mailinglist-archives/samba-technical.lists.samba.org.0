Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75095D31F
	for <lists+samba-technical@lfdr.de>; Fri, 23 Aug 2024 18:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=a7OM/W0EJtp2+JAIBDghW4ypLqo6G3RHtMu+hNZuDVs=; b=Mk9j8HeP5HYmDKTdbsuLv2VEUs
	7f8YZmsJ08y/OPIJuRofI4e8N5aVPNljSiX9qgr9kAnf0U4cc9YNUl5yUBeUrJ7TXFV+tGeEx0jDt
	9Z+q24Ai8iDMs29dAbyP5kzSCVqEXy6zhRx43LdL3nd0rJJiteIn83o5TqhpUIKXpag/oDJO1O3y8
	ZdAyNzfAqPuTL7dXlPGDCwwUfzdb+oQ4eZeUsW7lrGXENYzCV9mIbLHy9M4Jz8YQqxKUtINcosVru
	Tot54cGSXC9LrUztD4V9Bv1zz6H4o5UWl8aD4cYZNEGQ37U0k+zlswNIkSdpC44SR9KtF7mk7dhHi
	OHdUjhtg==;
Received: from ip6-localhost ([::1]:29396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1shX2C-005LdO-Eg; Fri, 23 Aug 2024 16:21:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42993) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1shX28-005LdH-8G
 for samba-technical@lists.samba.org; Fri, 23 Aug 2024 16:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724430060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7OM/W0EJtp2+JAIBDghW4ypLqo6G3RHtMu+hNZuDVs=;
 b=hpwVSInmIMAYW55TMZfd7FCLBrsJSdQr1dRgOllCvX/Wci7ZYy6/4oQ6mL59tbzjZAjc8t
 dFWqSjljw7FPUijAuvsvHJGV4/gMaNDfe7WkU0v/d7XoM6CBTAJENtDo1K9hi0OXYsBjd5
 Z8GMdP/HDmyPyteEGTCzVpX+7CT79AM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724430061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7OM/W0EJtp2+JAIBDghW4ypLqo6G3RHtMu+hNZuDVs=;
 b=eK1TZvDsqiFMsLmXlHPLzIWwFKPhS7ntTIaLkPncb9lY3ZK9lBw/RAtnVGAphjnTLHI10u
 wKNiT/et1PuhGio1GuG0UebkpaI2YHzxr58AcXRSHxyRskN7PVrMy5g68/Uc6aMI9/MokR
 dzvj61EH+ib7GWdYPv19lE/rKjvBWug=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-iuW8mKDwMJKn3vMTBBxWRA-1; Fri,
 23 Aug 2024 12:19:14 -0400
X-MC-Unique: iuW8mKDwMJKn3vMTBBxWRA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DDF911955BED; Fri, 23 Aug 2024 16:19:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.30])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6ACE019560AA; Fri, 23 Aug 2024 16:19:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20240823161209.434705-1-dhowells@redhat.com>
References: <20240823161209.434705-1-dhowells@redhat.com>
To: Steve French <sfrench@samba.org>, Jeremy Allison <jra@samba.org>,
 samba-technical@lists.samba.org
Subject: Samba llseek bug
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <434991.1724429946.1@warthog.procyon.org.uk>
Date: Fri, 23 Aug 2024 17:19:06 +0100
Message-ID: <434992.1724429946@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, dhowells@redhat.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-afs@lists.infradead.org, Christian Brauner <christian@brauner.io>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Note that whilst testing my cifs fixes with the generic/075 and generic/112
xfstests, the tests occasionally hit a bug in Samba whereby llseek() fails
because there are too many extents in the server file for the server to
report.  I've noted this before:

	https://lore.kernel.org/linux-cifs/349671.1716335639@warthog.procyon.org.uk/

is there a fix for this I can try?

David


