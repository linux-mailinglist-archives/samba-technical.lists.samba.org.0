Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F57995C0FD
	for <lists+samba-technical@lfdr.de>; Fri, 23 Aug 2024 00:43:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=YoHc0DrXDUx2XRqsKC2VlLahjN/YyNxJ34WemSxbwPs=; b=msE0bmEQQxxzqh30a4Vuuq+aI7
	KNxM4lHNMs6P7lHpU5dPEHdtUrUaoRfJ2v0KdsQygu1BorHfBQVpA8p2vyToPLWIaRTAu9O/GQXI6
	Sg7V1DJol19aft9RGJZWKrEGwG2jSrJ8lNbJsH4+uR4iPgDoAGZJlcNJNXsZZH7Qwn01WPwFA3lG+
	HMjEJAdjc5kYmO+JdheyXx5glVsUtAL8E+lSdeQMHB21qKop+Ruus9BGQDNlvLUv/Z7gtjYggmVs+
	MyqGgjlRTWfOb9STuXB+c1RjvH8QSz8Ql+H4uz4hhqB48FCZNQOdd81fkcZhmQ8qRRTw/VEN3UrPB
	HBnWbYbQ==;
Received: from ip6-localhost ([::1]:64072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1shGVm-005I1j-7c; Thu, 22 Aug 2024 22:42:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47513) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1shGVg-005I1c-Az
 for samba-technical@lists.samba.org; Thu, 22 Aug 2024 22:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724366544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoHc0DrXDUx2XRqsKC2VlLahjN/YyNxJ34WemSxbwPs=;
 b=IvOHSIDlgSbenaf+BEFQJ3ABuJNnbpvFcxNtQNNc6jQEdFAaZnXX9+Lrq/uCpP4gsI3LDM
 CINgxa5fbn3dGW2PO8WtDGSjo78m0ozK/62bkrssohY+8UrBqFQFvPEbb1lwnv3LhlkL70
 jWC9nUjnfnoH4/wOTiKW9LYg5Ah95Rk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724366544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoHc0DrXDUx2XRqsKC2VlLahjN/YyNxJ34WemSxbwPs=;
 b=IvOHSIDlgSbenaf+BEFQJ3ABuJNnbpvFcxNtQNNc6jQEdFAaZnXX9+Lrq/uCpP4gsI3LDM
 CINgxa5fbn3dGW2PO8WtDGSjo78m0ozK/62bkrssohY+8UrBqFQFvPEbb1lwnv3LhlkL70
 jWC9nUjnfnoH4/wOTiKW9LYg5Ah95Rk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-693-TJpQT-S_M0CCfP_wVZAPXA-1; Thu,
 22 Aug 2024 18:26:06 -0400
X-MC-Unique: TJpQT-S_M0CCfP_wVZAPXA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9C4591955F45; Thu, 22 Aug 2024 22:26:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.30])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1A089300019C; Thu, 22 Aug 2024 22:26:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
References: <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
 <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna> <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk> <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
 <477167.1716446208@warthog.procyon.org.uk>
 <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
 <af49124840aa5960107772673f807f88@manguebit.com>
To: Jeremy Allison <jra@samba.org>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <319946.1724365560.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Aug 2024 23:26:00 +0100
Message-ID: <319947.1724365560@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 dhowells@redhat.com, Steve French <sfrench@samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy,

> Bug is in fsctl_qar():
> =

>         ndr_ret =3D ndr_push_struct_blob(out_output, mem_ctx, &qar_rsp,
>                 (ndr_push_flags_fn_t)ndr_push_fsctl_query_alloced_ranges=
_rsp);
>         if (ndr_ret !=3D NDR_ERR_SUCCESS) {
>                 DEBUG(0, ("failed to marshall QAR rsp\n"));
>                 return NT_STATUS_INVALID_PARAMETER;
>         }
> =

>         if (out_output->length > in_max_output) {
>                 DEBUG(2, ("QAR output len %lu exceeds max %lu\n",
>                           (unsigned long)out_output->length,
>                           (unsigned long)in_max_output));
>                 data_blob_free(out_output);
>                 return NT_STATUS_BUFFER_TOO_SMALL;
>         }
> =

> I'm guessing in this case we need to just truncate out_output->length
> to in_max_output and return STATUS_BUFFER_OVERFLOW.

Do you perchance have a fix for this?  I'm seeing it cause failures in
xfstests when running against cifs connected to samba.

Thanks,
David


