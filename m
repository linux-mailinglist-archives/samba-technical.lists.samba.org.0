Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D741808CCC
	for <lists+samba-technical@lfdr.de>; Thu,  7 Dec 2023 16:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Rf4tLfo9pF6yxazJHapLb8GMJYYM77NLkk22oYwFpQA=; b=d+QZ+DoQ/IdRXzbCZdJSrsMrRL
	DiRt7BrFAxAQoCE8CC35QNlxE+qGG3BWszI73S1iKmpH8N9lBjdUsaAP+3rnYEzBXYIFqp/1YZCVr
	cxcj1+QTLk9x3yZpBT2u54bpxT3bCmMumYIb2jerTKcOiHeipjsauAHnibmutXPvmg2eh38GPiBXf
	bfXzv8H/2L64X9xuMcQALqeXUj90L5auDWizRTBoZ7fVPLR5LDSsSaH8llvdwkuK8udmXM2v6931c
	rFxb4wARwdpAeJ3A+geEGmMLXSdjKHF4U4O/cn37g2bItYNt1trGo7NHmIFnzgVwlwBsHyeIZf0JM
	UoJpkmhg==;
Received: from ip6-localhost ([::1]:54868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBGmE-00502U-Ot; Thu, 07 Dec 2023 15:59:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44144) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1rBGm9-00502L-RC
 for samba-technical@lists.samba.org; Thu, 07 Dec 2023 15:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701964733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Rf4tLfo9pF6yxazJHapLb8GMJYYM77NLkk22oYwFpQA=;
 b=MSapM15jKDMereBgR69Ew2Jmz/uXAKPIoAeYLY/VnakMpWMcgqi8MKI8Yv2oG6jQk6NBuz
 v/SU9r9fOTor2MtMTBtmiq85dpN6MFja9knG0gYdKXhnhLqg9h8r5Ea3tsCSsDb18yovP/
 Ehfc1dxDCkgznZ2gbxiH/VhdaqFTWBg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701964734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Rf4tLfo9pF6yxazJHapLb8GMJYYM77NLkk22oYwFpQA=;
 b=iB7iTkNj6xiCqtB49jINHPOI1Vp5gPPLq4ctdzK3lTS/v6w5nL3TvBPywshCR2U45AFNu2
 e0pSIq8LWYP5rSMg25EUC4Rl2QmdYC36Gr06A9HRroLVA3L510ZzDKSj9406jw6IZoMPDa
 QxGLfIBTL3tnxt3YE29IYa33KjxPkZE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-b5LHgerXOWuiXKtScoUuSw-1; Thu, 07 Dec 2023 10:58:49 -0500
X-MC-Unique: b5LHgerXOWuiXKtScoUuSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83A8C85A58B;
 Thu,  7 Dec 2023 15:58:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26F022166AE2;
 Thu,  7 Dec 2023 15:58:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
To: Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, jra@samba.org
Subject: Can fallocate() ops be emulated better using SMB request compounding?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <700922.1701964726.1@warthog.procyon.org.uk>
Date: Thu, 07 Dec 2023 15:58:46 +0000
Message-ID: <700923.1701964726@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: Tom Talpey <tom@talpey.com>, Stefan Metzmacher <metze@samba.org>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 jlayton@kernel.org, dhowells@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve, Namjae, Jeremy,

At the moment certain fallocate() operations aren't very well implemented in
the cifs filesystem on Linux, either because the protocol doesn't fully
support them or because the ops being used don't also set the EOF marker at
the same time and a separate RPC must be made to do that.

For instance:

 - FALLOC_FL_ZERO_RANGE does some zeroing and then sets the EOF as two
   distinctly separate operations.  The code prevents you from doing this op
   under some circumstances as it doesn't have an oplock and doesn't want to
   race with a third party (note that smb3_punch_hole() doesn't have this
   check).

 - FALLOC_FL_COLLAPSE_RANGE uses COPYCHUNK to move the file down and then sets
   the EOF as two separate operations as there is no protocol op for this.
   However, the copy will likely fail if the ranges overlap and it's
   non-atomic with respect to a third party.

 - FALLOC_FL_INSERT_RANGE has the same issues as FALLOC_FL_COLLAPSE_RANGE.

Question: Would it be possible to do all of these better by using compounding
with SMB2_FLAGS_RELATED_OPERATIONS?  In particular, if two components of a
compound are marked related, does the second get skipped if the first fails?
Further, are the two ops then essentially done atomically?

If this is the case, then for FALLOC_FL_ZERO_RANGE, just compounding the
SET_ZERO_DATA with the SET-EOF will reduce or eliminate the race window.

For FALLOC_FL_COLLAPSE/INSERT_RANGE, we could compound the COPYCHUNK and
SET-EOF.  As long as the SET-EOF won't happen if the COPYCHUNK fails, this
will reduce the race.

However, for COLLAPSE/INSERT, we can go further: recognise the { COPYCHUNK,
SET-EOF } compound on the server and see if the file positions, chunk length
EOF and future EOF are consistent with a collapse/insert request and, if so,
convert the pair of them to a single fallocate() call and try that; if that
fails, fall back to copy_file_range() and ftruncate().


As an alternative, at least for removing the 3rd-party races, is it possible
to make sure we have an appropriate oplock around the two components in each
case?  It would mean potentially more trips to the server, but would remove
the window, I think.

David


