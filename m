Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A368CCC35
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2024 08:21:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MFCH5FHHlTKbviZWd8Klg1mfh/OtMCPKAMqc25553Vs=; b=FBDDbEPvngL2FlpKWuBObQDWcu
	5IyiY19YguC0UIxf2bJ/57sGzql5r7dtF7ELzPWG1DDyM0yFdp3Ikgv0pMUt4mhOKnr2ZS0C0hEIH
	pj6CRNVggSOzELVk8n4fYOdbax968KNDJemO17vr0sQiWJARYsSjmnXM6OjV01PQNnjNj3mKzu6MD
	V3ENjxx7YGADmORrwVvr7kAtqjqkWUejSr386ijumj8X91DZyPEPLRjmKIk3Cw1ZcsdGSAkP1h5++
	FuB2ZhmEREsFWKEo21VU2urxdbg0X3r3XZmgZSnXOTgTh16FJ20rv2VbHBFIjh4MDYmOqArmjvoN7
	rthdyXVA==;
Received: from ip6-localhost ([::1]:53188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sA1pH-009hgC-Hi; Thu, 23 May 2024 06:21:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25565) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sA1pB-009hg4-Uz
 for samba-technical@lists.samba.org; Thu, 23 May 2024 06:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716445267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MFCH5FHHlTKbviZWd8Klg1mfh/OtMCPKAMqc25553Vs=;
 b=CAZKmH5nJ8fCq941y181lUWPJEyTHL4uiwyI42WCRV8a5R5y9MgJM8gGPRXvdvEI1FNTKr
 z2CWGrinc0yzCI5ehXsm/kS3uQYmtkeh17eEMcWlOnoe5GfWluv8hwPUgQK2SwKMHnAP5R
 rkad+sPqcz1/+3IEiG05DKPLFkH1nkc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716445267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MFCH5FHHlTKbviZWd8Klg1mfh/OtMCPKAMqc25553Vs=;
 b=CAZKmH5nJ8fCq941y181lUWPJEyTHL4uiwyI42WCRV8a5R5y9MgJM8gGPRXvdvEI1FNTKr
 z2CWGrinc0yzCI5ehXsm/kS3uQYmtkeh17eEMcWlOnoe5GfWluv8hwPUgQK2SwKMHnAP5R
 rkad+sPqcz1/+3IEiG05DKPLFkH1nkc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-493-biU3tiwgMGiB4UiYOxk82A-1; Thu,
 23 May 2024 02:21:03 -0400
X-MC-Unique: biU3tiwgMGiB4UiYOxk82A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59F003C000A8;
 Thu, 23 May 2024 06:21:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 751A0C15BED;
 Thu, 23 May 2024 06:21:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
References: <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <20240522185305.69e04dab@echidna> <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk> <20240523145420.5bf49110@echidna>
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <476488.1716445261.1@warthog.procyon.org.uk>
Date: Thu, 23 May 2024 07:21:01 +0100
Message-ID: <476489.1716445261@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
 linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 dhowells@redhat.com, David Disseldorp <ddiss@samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

ronnie sahlberg <ronniesahlberg@gmail.com> wrote:

> On Thu, 23 May 2024 at 14:54, David Disseldorp <ddiss@samba.org> wrote:
> It might be best to just ignore tests that fail in this area. And just
> accept that some things, at best, is a best-effort approximation.
> (as long as dataloss does not happen, of course. That is never acceptable)
> At the end of the day it is a lot of guesswork and trying to fit a
> square peg (unpredictable ntfs behavior) into a round hole (linux vfs
> api).

The problem is that it essentially renders SEEK_DATA/SEEK_HOLE unusable for
applications on cifs.  If there's more than one extent above the starting
position, they'll fail with EIO.  The only way to do it is to provide for a
sufficiently large buffer to accommodate however many extents that there are
(and there could be millions, in theory) in order to get just the first one.

David


