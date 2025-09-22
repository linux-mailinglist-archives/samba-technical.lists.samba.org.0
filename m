Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B15BB8F69C
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 10:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lM5CJh198twvfiQIPBm1rFeFaRTIlcIdRzZbwYjk7po=; b=UEbdFR/1vv3blpjzwB5wDBZeXr
	SpaFSPwuEokefV6Ifwz6VIBP/J2XOhDeE4CDuIUGfNJA5gLivJG+oe4TGWkVd5DqWHqzB/moBpkn3
	34dtuswzDQdjZcoVy+IaZgc5qz1lvZq69jPAvAiRdANRgam3wqbU9LYS5f6dU/FL2akl1Teq5QYKL
	CMbALG1hcdCj2OKxUq26q7CyS0i0nqPVWVLPevGJKssxndRsjcSab0Sa1u0nwtdFCRqaNKw6c4c7w
	bOlwM9fpBYNNuLI43OPjDE/ntCN3FfmnOwRZrv4KyceGk7CCneizzzomAW9fQxES9MDBm8a4ahd0L
	j/W1cGnQ==;
Received: from ip6-localhost ([::1]:59122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0bcM-004WWB-To; Mon, 22 Sep 2025 08:09:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47135) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0bcH-004WW4-LE
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 08:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758528582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lM5CJh198twvfiQIPBm1rFeFaRTIlcIdRzZbwYjk7po=;
 b=EL7uWLmK2R2uQHc2hBxki2vmrEzQ0nf+wC1Yin1WCZGUCf6efdR/lh2kgSMgmG5aS4jOXg
 s/qTccW968a7vTyFPetQ62x62Etnxe2pEi4ODAtw6lN8PTcsujq09MNfyq4k5l2E6j8o7P
 D5SNAENvXA98CAv5aloZ7YSnIQtceFE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758528582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lM5CJh198twvfiQIPBm1rFeFaRTIlcIdRzZbwYjk7po=;
 b=EL7uWLmK2R2uQHc2hBxki2vmrEzQ0nf+wC1Yin1WCZGUCf6efdR/lh2kgSMgmG5aS4jOXg
 s/qTccW968a7vTyFPetQ62x62Etnxe2pEi4ODAtw6lN8PTcsujq09MNfyq4k5l2E6j8o7P
 D5SNAENvXA98CAv5aloZ7YSnIQtceFE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-vtIzoA5zP7COJHCSE-5Bsw-1; Mon,
 22 Sep 2025 04:09:40 -0400
X-MC-Unique: vtIzoA5zP7COJHCSE-5Bsw-1
X-Mimecast-MFC-AGG-ID: vtIzoA5zP7COJHCSE-5Bsw_1758528579
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0350918002C0; Mon, 22 Sep 2025 08:09:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AEC12180057C; Mon, 22 Sep 2025 08:09:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <80395.1758522267@warthog.procyon.org.uk>
References: <80395.1758522267@warthog.procyon.org.uk>
 <aNCOOS9GArQyf6Kb@jeremy-HP-Z840-Workstation>
 <12788.1758471560@warthog.procyon.org.uk>
To: Jeremy Allison <jra@samba.org>
Subject: Re: How to cause a multipart SMB1 Trans2 PDU to occur
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 09:09:36 +0100
Message-ID: <98570.1758528576@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yKx3V4AGQKO5tWF87EMPaTv2sj0esxkmxBYCf9CLnuo_1758528579
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="=-=-="
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

--=-=-=
Content-Type: text/plain


Okay, it can be done by forcing the negotiated buffer size to 4096 in cifs:

--- a/fs/smb/client/sess.c
+++ b/fs/smb/client/sess.c
@@ -636,7 +636,7 @@ static __u32 cifs_ssetup_hdr(struct cifs_ses *ses,
 	/* Note that header is initialized to zero in header_assemble */
 	pSMB->req.AndXCommand = 0xFF;
 	pSMB->req.MaxBufferSize = cpu_to_le16(min_t(u32,
-					CIFSMaxBufSize + MAX_CIFS_HDR_SIZE - 4,
+				        4096,//CIFSMaxBufSize + MAX_CIFS_HDR_SIZE - 4,
 					USHRT_MAX));
 	pSMB->req.MaxMpxCount = cpu_to_le16(server->maxReq);
 	pSMB->req.VcNumber = cpu_to_le16(1);

and then attempting to read a big extended attribute (~16000 bytes in this
case).  As I guessed would happen, you get some signature verification errors:

CIFS: VFS: \\carina SMB signature verification returned error = -13
CIFS: VFS: \\carina SMB signature verification returned error = -13

Attached is a pcap file for reference.

David


--=-=-=
Content-Type: application/gzip
Content-Disposition: attachment; filename=pcap.gz
Content-Transfer-Encoding: base64

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
xr8AaLWt2HiqAAA=
--=-=-=--


