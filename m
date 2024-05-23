Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5314D8CCC58
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2024 08:37:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xMLnNxFTnCaK5JR2bSI2SHt3ZvEw03w9pPGa7xZnUmo=; b=R85k34VgB9CnwSeDvXCW+Lzefv
	8pvE+XBEctXoRhqc7TxpjKL2Lm5zXaa1fOuuc/qbbNb5NmMgV4kpcyhzB1IJMiMClIv798hrkMvPL
	mmoOCNyIIwnzoMlTR67KBzhwRYxhehLS0tq3hnuwyTmp94Gizy4uqN4I4QXAgxwjeUW5ROsvrNqfj
	x0kcFSW4fRjmtnW8mSkkJ2qxK5hC2z2g2zg+y8KwAz/uA4m4GxGMG5q/wgWq0d/2trcLr/gMCe8jd
	0UuR8hLpPeLoc9+TTxGk6lkIVox0zZEtoalAJO11462BZa/pZgX4iS4m4sosrERdZbDmn5oi8hwB6
	vWEfPR2A==;
Received: from ip6-localhost ([::1]:48144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sA24k-009hyF-Bj; Thu, 23 May 2024 06:37:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56621) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sA24P-009hy8-6v
 for samba-technical@lists.samba.org; Thu, 23 May 2024 06:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716446213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMLnNxFTnCaK5JR2bSI2SHt3ZvEw03w9pPGa7xZnUmo=;
 b=YzdgGtzWxU+WWG4TwsfPjlX4ZnQcd9NWCx1H0dt7GeV2lOigA0jjCoZlpi1niQ05sanf4N
 GoLn/2rmN5Uf63rtw5LB1wyDVJBMTi2LW8mRaoqMZWuo5SxacPmGuHhKVXAtTlV1pGVJ5f
 NzbxKTgCj6uxRzvOPwrQeiNnLmbDep8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716446214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMLnNxFTnCaK5JR2bSI2SHt3ZvEw03w9pPGa7xZnUmo=;
 b=XrrSLo+A1wx3a5jDEVafxUiUV8Au48HcViFXS30/dg1qyuwwYqUHMxcKOVHhOFR8fuEeDG
 5U/J8Qax6KFACBm5JEJpe96J6NHorjZkMXcYixMtKKLc40RJQHpaZL5Q6Z4FhOtml5U0d8
 nTW1Tcbc07jS1K5ECYXUU7TaecdptXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Qh2tz4yBPKikznTeAPwIyA-1; Thu, 23 May 2024 02:36:50 -0400
X-MC-Unique: Qh2tz4yBPKikznTeAPwIyA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B582585A58C;
 Thu, 23 May 2024 06:36:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D13C440004D;
 Thu, 23 May 2024 06:36:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
References: <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna> <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk> <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <477166.1716446208.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 May 2024 07:36:48 +0100
Message-ID: <477167.1716446208@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

> > The problem is that it essentially renders SEEK_DATA/SEEK_HOLE unusabl=
e for
> > applications on cifs.  If there's more than one extent above the start=
ing
> > position, they'll fail with EIO.  The only way to do it is to provide =
for a
> > sufficiently large buffer to accommodate however many extents that the=
re are
> > (and there could be millions, in theory) in order to get just the firs=
t one.
> =

> Wait, I didn't read all the text in the initial posts correctly.
> Do you mean if you ask for "max x bytes of response, enough for n
> entries" then if there
> are > n entries on the server you get nothing back?
> =

> I am pretty sure Windows will return as many entries as fits in the
> reponse out-data-size
> nad some error code.
> But you are saying that instead of returning a truncated out-blob that
> samba will return nothing?

It returns a STATUS_BUFFER_TOO_SMALL error if there's more than one extent
record to return.

David


