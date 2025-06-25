Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5D5AE8F69
	for <lists+samba-technical@lfdr.de>; Wed, 25 Jun 2025 22:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qBwag9gY//+sYzvvjqRvddZnoX/x2SeT9w+Hu1KXyic=; b=AG/HsZ18wojri8QFZPkF4ZhPl9
	dtGGQJd4MjJ3JqAVTlz5KzkRWmWvxugZcQSQXbTr7w2Mtx8d+e8K9cL5/Racjj7eYvOL78kDcMr9K
	O3L9jEExZEiJWTNxGWFCl54yoKXup4GPlUP7/O0Gz2WmfzLXoNblN+JPOBBAlB0U5ux3k95XK9XQh
	5lE0sRho1bNV/VWPw5hrewkQUUGTOEDq7vkleVQGHxe0kkAC8+8jf0X53xq+XzyIWefDwVBphsCA+
	ZGQWSpUcQvg7psSpvvbgIJJn0Muf8NKSJg+j2Fay6saqlSein9ZgNUEGxPASjHUAiX6lR4kRhpFsc
	bSPb4SHw==;
Received: from ip6-localhost ([::1]:60594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uUWgF-007tJw-Ij; Wed, 25 Jun 2025 20:25:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48091) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uUM0s-007pqO-Tn
 for samba-technical@lists.samba.org; Wed, 25 Jun 2025 09:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750842107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBwag9gY//+sYzvvjqRvddZnoX/x2SeT9w+Hu1KXyic=;
 b=Ui4Tn631VdFX7zJo4V+rdHA5eKwjDZPw/+wD/g93g92CuzIeiPWnq8Y2IxHDQ+t9ZYK+IP
 jHOU8jPuDauddTQZ9O+EiM6T9f+o4YK6yRKyRuevv6Sf7kcR7Xri6Yxp1LcD76uLreDYpX
 dh/44dRuMRx3yZfCxexi38teJRGcohs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750842107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBwag9gY//+sYzvvjqRvddZnoX/x2SeT9w+Hu1KXyic=;
 b=Ui4Tn631VdFX7zJo4V+rdHA5eKwjDZPw/+wD/g93g92CuzIeiPWnq8Y2IxHDQ+t9ZYK+IP
 jHOU8jPuDauddTQZ9O+EiM6T9f+o4YK6yRKyRuevv6Sf7kcR7Xri6Yxp1LcD76uLreDYpX
 dh/44dRuMRx3yZfCxexi38teJRGcohs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-BBYgFwb4MEeM1WinOA2_0Q-1; Wed,
 25 Jun 2025 05:01:44 -0400
X-MC-Unique: BBYgFwb4MEeM1WinOA2_0Q-1
X-Mimecast-MFC-AGG-ID: BBYgFwb4MEeM1WinOA2_0Q_1750842101
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 648DE1808984; Wed, 25 Jun 2025 09:01:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.81])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 737AD180045B; Wed, 25 Jun 2025 09:01:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20250625081638.944583-1-metze@samba.org>
References: <20250625081638.944583-1-metze@samba.org>
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: [PATCH v2] smb: client: let smbd_post_send_iter() respect the
 peers max_send_size and transmit all data
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1288832.1750842098.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Jun 2025 10:01:38 +0100
Message-ID: <1288833.1750842098@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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
Cc: stable+noautosel@kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, dhowells@redhat.com,
 Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Stefan Metzmacher <metze@samba.org> wrote:

> We should not send smbdirect_data_transfer messages larger than
> the negotiated max_send_size, typically 1364 bytes, which means
> 24 bytes of the smbdirect_data_transfer header + 1340 payload bytes.
> =

> This happened when doing an SMB2 write with more than 1340 bytes
> (which is done inline as it's below rdma_readwrite_threshold).
> =

> It means the peer resets the connection.
> =

> When testing between cifs.ko and ksmbd.ko something like this
> is logged:
> =

> client:
> =

>     CIFS: VFS: RDMA transport re-established
>     siw: got TERMINATE. layer 1, type 2, code 2
>     siw: got TERMINATE. layer 1, type 2, code 2
>     siw: got TERMINATE. layer 1, type 2, code 2
>     siw: got TERMINATE. layer 1, type 2, code 2
>     siw: got TERMINATE. layer 1, type 2, code 2
>     siw: got TERMINATE. layer 1, type 2, code 2
>     siw: got TERMINATE. layer 1, type 2, code 2
>     siw: got TERMINATE. layer 1, type 2, code 2
>     siw: got TERMINATE. layer 1, type 2, code 2
>     CIFS: VFS: \\carina Send error in SessSetup =3D -11
>     smb2_reconnect: 12 callbacks suppressed
>     CIFS: VFS: reconnect tcon failed rc =3D -11
>     CIFS: VFS: reconnect tcon failed rc =3D -11
>     CIFS: VFS: reconnect tcon failed rc =3D -11
>     CIFS: VFS: SMB: Zero rsize calculated, using minimum value 65536
> =

> and:
> =

>     CIFS: VFS: RDMA transport re-established
>     siw: got TERMINATE. layer 1, type 2, code 2
>     CIFS: VFS: smbd_recv:1894 disconnected
>     siw: got TERMINATE. layer 1, type 2, code 2
> =

> The ksmbd dmesg is showing things like:
> =

>     smb_direct: Recv error. status=3D'local length error (1)' opcode=3D1=
28
>     smb_direct: disconnected
>     smb_direct: Recv error. status=3D'local length error (1)' opcode=3D1=
28
>     ksmbd: smb_direct: disconnected
>     ksmbd: sock_read failed: -107
> =

> As smbd_post_send_iter() limits the transmitted number of bytes
> we need loop over it in order to transmit the whole iter.
> =

> Cc: Steve French <sfrench@samba.org>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: <stable+noautosel@kernel.org> # sp->max_send_size should be info->ma=
x_send_size in backports
> Fixes: 3d78fe73fa12 ("cifs: Build the RDMA SGE list directly from an ite=
rator")
> Signed-off-by: Stefan Metzmacher <metze@samba.org>

Reviewed-by: David Howells <dhowells@redhat.com>
Tested-by: David Howells <dhowells@redhat.com>


