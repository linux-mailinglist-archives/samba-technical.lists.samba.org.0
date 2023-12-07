Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D0E808F16
	for <lists+samba-technical@lfdr.de>; Thu,  7 Dec 2023 18:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=IocSxJJV+aeVvbf5dVtiipJ1I/lExGhWur9qd5IRbhM=; b=Lr8QQ1uCPQQWxphNkgl3iS1AZr
	IE1jy/2tWaLjyBLnacuh3XU7sXKMHinsFBQJ9D4EE+lLNcQm1eG97VgqVjXToJaJL+/1t8pKCc0BN
	/zek4jrfS47SsyfbUZgDUN8RA32rMMJNU7CvA/7EXq7jTglC7UJyoJj6Lw7yu7rLKMLrUe8ig6PJT
	sCAUs/Pvi3JX2visWL7eKT5i4tIh8rnRKa6WiB5DPuub3tTRv9639JFDloHqUFmN9rRaU11lHywW6
	eaTkDETgk+Nllx3A1dIBv74mwILiq6UjQWNIebZvGBhsvONXBY9tof0kxljVqR1grTXus8Fkw64Qa
	Kq7LSArg==;
Received: from ip6-localhost ([::1]:25542 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBIXq-0050o3-Fy; Thu, 07 Dec 2023 17:52:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53277) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1rBIXk-0050nt-Sl
 for samba-technical@lists.samba.org; Thu, 07 Dec 2023 17:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701971529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IocSxJJV+aeVvbf5dVtiipJ1I/lExGhWur9qd5IRbhM=;
 b=hAAum2bdMgiEhby4/UW08laHCI6tvFwPdDjLM2fF9ra9uLF1MxTR4hRyh/Ez6/U9TF7n1t
 rVvdk1S1chOG+2YvOX/Fs1QXn8Oj7ZYroNthJ3uhfjV7+mD1gs5Tr6L7/3J2fNoEC90kUi
 dqeUQ471sHn2+ZGY8epH87pkOdxQoSU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701971529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IocSxJJV+aeVvbf5dVtiipJ1I/lExGhWur9qd5IRbhM=;
 b=hAAum2bdMgiEhby4/UW08laHCI6tvFwPdDjLM2fF9ra9uLF1MxTR4hRyh/Ez6/U9TF7n1t
 rVvdk1S1chOG+2YvOX/Fs1QXn8Oj7ZYroNthJ3uhfjV7+mD1gs5Tr6L7/3J2fNoEC90kUi
 dqeUQ471sHn2+ZGY8epH87pkOdxQoSU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-FlwmlI5vNmODlFIOVUiARA-1; Thu, 07 Dec 2023 12:50:53 -0500
X-MC-Unique: FlwmlI5vNmODlFIOVUiARA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B96A185A780;
 Thu,  7 Dec 2023 17:50:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318351121312;
 Thu,  7 Dec 2023 17:50:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <ZXIDgvZ8/iBhYXwy@jeremy-HP-Z840-Workstation>
References: <ZXIDgvZ8/iBhYXwy@jeremy-HP-Z840-Workstation>
 <700923.1701964726@warthog.procyon.org.uk>
To: Jeremy Allison <jra@samba.org>
Subject: Re: Can fallocate() ops be emulated better using SMB request
 compounding?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1215460.1701971450.1@warthog.procyon.org.uk>
Date: Thu, 07 Dec 2023 17:50:50 +0000
Message-ID: <1215461.1701971450@warthog.procyon.org.uk>
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
Cc: Stefan Metzmacher <metze@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, jlayton@kernel.org, dhowells@redhat.com,
 Steve French <smfrench@gmail.com>, Tom Talpey <tom@talpey.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Jeremy Allison <jra@samba.org> wrote:

> >Further, are the two ops then essentially done atomically?
> 
> No. They are processed (at least in Samba) as two separate
> requests and can be raced by local or other remote access.

So just compounding them would leave us in the same situation we are in now -
which would be fine.

What do you think about the idea of having the server see a specifically
arranged compounded pair and turn them into an op that can't otherwise be
represented in the protocol?

Or is it better to try and get the protocol extended?

David


