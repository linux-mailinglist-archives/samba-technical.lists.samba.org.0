Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6A2991A9D
	for <lists+samba-technical@lfdr.de>; Sat,  5 Oct 2024 22:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=wVzDdN5Z7OcoeNqeUSnflKTOF7ZiYV9hEqk8inqht1Q=; b=wDPOMu/JIBrYHypRPfpNg3CmAA
	oL0L23whHqM85lslELxhGcwXlIcyP61JVGua56d57/dN6zlOybmHWt0Mc1qyrdLPzS2xZbGY/Vtqz
	Z/IbEaGLmNKnqVlqzrcXoIuebRu8ie8N7DqA1np10vn9UU0BUR1P0tKL57aq/WFZ9B0PJn27AhmMc
	3VxrcG57Hj1y+hI4F69YEsUucT/HLMZgG73qFsZNZXuF4rWZPLUaS7+qiGPH3DGFpKQtTvKhELJKQ
	b18pDaF95Tjzr5PKPPIIw90SlNow2zu+UaJHn66wJPo3UfG1plJ+6a4p86L/T6FD4OXN04pGerR2Z
	MD07ZA1A==;
Received: from ip6-localhost ([::1]:40520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sxBFX-0039Ly-1N; Sat, 05 Oct 2024 20:19:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42815) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sxBFT-0039Lr-NP
 for samba-technical@lists.samba.org; Sat, 05 Oct 2024 20:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728159568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wVzDdN5Z7OcoeNqeUSnflKTOF7ZiYV9hEqk8inqht1Q=;
 b=L3SwhmH6A3JbS46alu3L8rX2Ubt23/8Gid5zgNtieuiu+AiWjGNcmXFSZfVu/ppGYUuEX7
 jWN49J9IhhfS0bJFY2Plc14nCgc3AhAMsFoZthaPKsS737eSb/Zj2MWAz6OlcLGowx9wqc
 9OXra98EYtxFbT8qfP/IeIX+4Ye+jtE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728159568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wVzDdN5Z7OcoeNqeUSnflKTOF7ZiYV9hEqk8inqht1Q=;
 b=L3SwhmH6A3JbS46alu3L8rX2Ubt23/8Gid5zgNtieuiu+AiWjGNcmXFSZfVu/ppGYUuEX7
 jWN49J9IhhfS0bJFY2Plc14nCgc3AhAMsFoZthaPKsS737eSb/Zj2MWAz6OlcLGowx9wqc
 9OXra98EYtxFbT8qfP/IeIX+4Ye+jtE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-NDcjYh1vO8mWhfdSGL7PFA-1; Sat,
 05 Oct 2024 16:19:23 -0400
X-MC-Unique: NDcjYh1vO8mWhfdSGL7PFA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 550C4197904D; Sat,  5 Oct 2024 20:19:16 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.145])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AE1A41955F30; Sat,  5 Oct 2024 20:19:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20241004103051.43862-1-advaitdhamorikar@gmail.com>
References: <20241004103051.43862-1-advaitdhamorikar@gmail.com>
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Subject: Re: [PATCH] Fix logically dead code
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3912622.1728159551.1@warthog.procyon.org.uk>
Date: Sat, 05 Oct 2024 21:19:11 +0100
Message-ID: <3912623.1728159551@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 Enzo Matsumiya <ematsumiya@suse.de>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 Bharath SM <bharathsm@microsoft.com>, Tom Talpey <tom@talpey.com>,
 skhan@linuxfoundation.org, anupnewsmail@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Can you tag your subject with some sort of subsystem ID so that we know what
it affects?  Something like "cifs:" or "smb:" in this case.

Thanks,
David


