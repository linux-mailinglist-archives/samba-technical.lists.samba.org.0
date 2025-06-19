Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFDCAE0FA1
	for <lists+samba-technical@lfdr.de>; Fri, 20 Jun 2025 00:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FHIszSV3tMAr1tXnsr+bBkILf3jRaqNdmflJuCFEihw=; b=l5UkeXpkgJ6JAR5SyOMVsYRBav
	2pKKpUOi2huOweFAvuCgHiwGwawNDZcXP57ZOtzf5mJc9QKiazcRx+yDGWHnZonpLTJn4Q4fGfd0b
	lySUQS6VuQRAiPxa/iDKtGvWYhdvuW7LWnArZmHbVIQbSrbPOldI+09P4cY8JGN/hUmBS/+NfkWJf
	3rwI2zMceY1et1N+GiBfXzYFny4C/CvsZGj+jRRWFIJT6o06cNFgUSjBb53BFHpPr48tD7aE/lmt1
	2oGXhn8qvjUosDewv0JvmEuyhneq3mxjSQ/EB9Mc5+udvxmmoPIX1W+CQb31kP90nyPdlED+0JieY
	ahA0dDWA==;
Received: from ip6-localhost ([::1]:63086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uSNnU-007TW1-Fj; Thu, 19 Jun 2025 22:31:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34845) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uSNnP-007TVu-G6
 for samba-technical@lists.samba.org; Thu, 19 Jun 2025 22:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750372304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHIszSV3tMAr1tXnsr+bBkILf3jRaqNdmflJuCFEihw=;
 b=MVcsEWsx+1lu4mOP/8yTNW6IV1+vI1XxUbu2lvcmOwzqBgGFJ/bD+6QiRnhr1uRKLulvEN
 QzjSbzpyogJqs/rUWOMaAsSyNjbkzpIihLN1NkGBKaYpizABLHlM8sl7kyLSGe+tqYPhiv
 FYngga9kG2370d0PuO5KGNzYOtamlPw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750372304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHIszSV3tMAr1tXnsr+bBkILf3jRaqNdmflJuCFEihw=;
 b=MVcsEWsx+1lu4mOP/8yTNW6IV1+vI1XxUbu2lvcmOwzqBgGFJ/bD+6QiRnhr1uRKLulvEN
 QzjSbzpyogJqs/rUWOMaAsSyNjbkzpIihLN1NkGBKaYpizABLHlM8sl7kyLSGe+tqYPhiv
 FYngga9kG2370d0PuO5KGNzYOtamlPw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-N1J1aw97N-uBtjSDyW1tcA-1; Thu,
 19 Jun 2025 18:31:38 -0400
X-MC-Unique: N1J1aw97N-uBtjSDyW1tcA-1
X-Mimecast-MFC-AGG-ID: N1J1aw97N-uBtjSDyW1tcA_1750372297
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A4633180028D; Thu, 19 Jun 2025 22:31:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9E09D195609D; Thu, 19 Jun 2025 22:31:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <869961.1750344431@warthog.procyon.org.uk>
References: <869961.1750344431@warthog.procyon.org.uk>
To: Jeremy Allison <jra@samba.org>, Steve French <sfrench@samba.org>,
 samba-technical@lists.samba.org
Subject: Re: Seeing lots of coredumps from samba when using upstream cifs
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <882335.1750372293.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Jun 2025 23:31:33 +0100
Message-ID: <882336.1750372293@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
Cc: dhowells@redhat.com, linux-cifs@vger.kernel.org, paalcant@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

David Howells <dhowells@redhat.com> wrote:

> Hi Jeremy, Steve,
> =

> I've been trying to investigate all the reconnection issues cifs is seei=
ng in
> the currently upstream kernel from running the generic/013 xfstest again=
st it,
> and I've realised Samba is coredumping a lot (attached is one example, a=
t
> lease several others look similar).
> =

> The version of the Fedora Samba RPM I'm using is: samba-4.21.4-1.fc41.x8=
6_64

The problem seems to be fixed in samba-4.22.2-1.fc42.x86_64.

David


