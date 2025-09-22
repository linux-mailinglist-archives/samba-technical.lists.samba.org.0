Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B300B8F21C
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 08:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dyTTNK0U3ZWn3HqycUmoK78tKxwf6Ld5T6IUgAVu0M8=; b=wigMwF5rsHFVgjT7MG4FKEt33Y
	im+9/8ufEkxjw/Q8Akh8nZHNM0Dmr5GbqcuWkDgSfTS6WtrWUT+1m46mPeEm878DQ/Fbl7R1Uily8
	678jgnc6gRYUG40/i0bC9OKsJXflRpbwk/RLjN4uXnVyGZ0moe3uLValL7X6rDgxuzOwNUyF5Jmc5
	0s9F7/AZt1i6OFeoXlxIfqrfzjpxO8P/SXEeGUMV0efbI3Lr5b+PEkBkcRsXF/2Kacwbe7Uk1kOWy
	yhgWJ9XeIXBdqFUkMUURfrMBZbVNqBbYPPj3aLuz7D2PbVda34PeGRmX5aFXavBiLBeu+z85UMxfP
	ep1CnLkQ==;
Received: from ip6-localhost ([::1]:61968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Zyc-004VxC-My; Mon, 22 Sep 2025 06:24:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27083) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0ZyX-004Vx5-QW
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 06:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758522274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dyTTNK0U3ZWn3HqycUmoK78tKxwf6Ld5T6IUgAVu0M8=;
 b=QaTGqdSGLjG0nQhKzzrJwzXEw1kLXcc0K3zzctVYb7UXoMDfrveacfAhkjslninaHQRg4y
 29nYMV4rK3atv/mEMoJ6nqPZyRpndOt/C05VBKK0FfdDqPy85e10GXJUYG2Ofr5OUCEjkn
 4jDjm/7kW46PbB4Oy2Yxz+f3MFldTzo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758522274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dyTTNK0U3ZWn3HqycUmoK78tKxwf6Ld5T6IUgAVu0M8=;
 b=QaTGqdSGLjG0nQhKzzrJwzXEw1kLXcc0K3zzctVYb7UXoMDfrveacfAhkjslninaHQRg4y
 29nYMV4rK3atv/mEMoJ6nqPZyRpndOt/C05VBKK0FfdDqPy85e10GXJUYG2Ofr5OUCEjkn
 4jDjm/7kW46PbB4Oy2Yxz+f3MFldTzo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-576-SVvmCu5XMLOh1iLoVAsdaQ-1; Mon,
 22 Sep 2025 02:24:31 -0400
X-MC-Unique: SVvmCu5XMLOh1iLoVAsdaQ-1
X-Mimecast-MFC-AGG-ID: SVvmCu5XMLOh1iLoVAsdaQ_1758522270
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 233A3180057A; Mon, 22 Sep 2025 06:24:30 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 964313000198; Mon, 22 Sep 2025 06:24:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
References: <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
 <12788.1758471560@warthog.procyon.org.uk>
To: Jeremy Allison <jra@samba.org>
Subject: Re: How to cause a multipart SMB1 Trans2 PDU to occur
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 07:24:27 +0100
Message-ID: <80395.1758522267@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8WwEg4N58nIoe3XwNPvK9LOP3zWhNDzMP3W3aOZbBpQ_1758522270
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <80394.1758522267.1@warthog.procyon.org.uk>
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

Jeremy Allison <jra@samba.org> wrote:

> Samba client code smb1cli_trans_format() will do this.
> 
> You can get to this via:
> 
> cli_trans_send() called by many functions inside source3/libsmb/clifile.c.
> 
> You might have to tweak the sent state->param or state->data sizes
> to cause it to generate the multipart SMB1trans2s call, but it's capable of
> doing so.

That's the client side, though, isn't it?  I was hoping to get the server to
respond with a multipart Trans2 response.

David


