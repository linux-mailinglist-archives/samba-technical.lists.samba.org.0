Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4730B8F702
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 10:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FHsbLuPbl+OPKZmeNwltEu9zKkfj5XTxxQBzWyZjn+8=; b=z0rYSe83BNTd9t/2UFUSAvK1FE
	JYwt+TpB+SekOFSpcH8Y50fdDaGh8QUR7xW5FyxWAwljKgusI1ZW1pVzK/2fPOJIp8c8QNga5Or4b
	zIcuhkpfydryVwhCDiD1eoeNgGZBTFq7cgCO5GulMF0gaPVGswlzva/VypXUM/2+4YQelcdX0O5RP
	8YOPTRGjTprMADqgEktiI5YFA67N/b9FzS5s9PwSoyt1Vkmq763ahxPunDRP0/LnAaK2gVZK8f773
	Zosr8OHXnkYdc4zlLMDUPWlqFjrSfwGdtQhDY4HAxTkpwmxXCkD3jC3tU6J9+mIcG14f/PqS87yT6
	KHlroUfQ==;
Received: from ip6-localhost ([::1]:51286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0bfd-004Wbc-0c; Mon, 22 Sep 2025 08:13:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37475) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0bfY-004WbV-T8
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 08:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758528785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHsbLuPbl+OPKZmeNwltEu9zKkfj5XTxxQBzWyZjn+8=;
 b=IZfYpMSarhjQEOyLwlkxs++O3kIRKi58VGgBAYqGpvdTXrBuFfLfZhsp34hS+eQYo85zS2
 uwi70DEfpUA1AQmsksAztf/URtfYt3qorQZy7I8674nfMiOI8U3+xH0KXglVha3X5OqZ6q
 8IGQB9C/YrWu/nX0+JittkOn3FOpdiU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758528785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHsbLuPbl+OPKZmeNwltEu9zKkfj5XTxxQBzWyZjn+8=;
 b=IZfYpMSarhjQEOyLwlkxs++O3kIRKi58VGgBAYqGpvdTXrBuFfLfZhsp34hS+eQYo85zS2
 uwi70DEfpUA1AQmsksAztf/URtfYt3qorQZy7I8674nfMiOI8U3+xH0KXglVha3X5OqZ6q
 8IGQB9C/YrWu/nX0+JittkOn3FOpdiU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-Xs8xtzHvPueJkMpc_KrO3w-1; Mon,
 22 Sep 2025 04:13:01 -0400
X-MC-Unique: Xs8xtzHvPueJkMpc_KrO3w-1
X-Mimecast-MFC-AGG-ID: Xs8xtzHvPueJkMpc_KrO3w_1758528780
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A66DD180059A; Mon, 22 Sep 2025 08:13:00 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 864CA19560BB; Mon, 22 Sep 2025 08:12:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <98570.1758528576@warthog.procyon.org.uk>
References: <98570.1758528576@warthog.procyon.org.uk>
 <80395.1758522267@warthog.procyon.org.uk>
 <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
 <12788.1758471560@warthog.procyon.org.uk>
To: Jeremy Allison <jra@samba.org>
Subject: Re: How to cause a multipart SMB1 Trans2 PDU to occur
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 09:12:58 +0100
Message-ID: <101171.1758528778@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _B7PZjRU6K4A9sSTfTPJ4iuT1sqHRqBPgPPRx7H9QvY_1758528780
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <101170.1758528778.1@warthog.procyon.org.uk>
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
Cc: dhowells@redhat.com, Steve French <sfrench@samba.org>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Also wireshark doesn't handle the split buffers.

David


