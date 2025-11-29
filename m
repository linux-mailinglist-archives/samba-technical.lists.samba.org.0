Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1AEC93BB8
	for <lists+samba-technical@lfdr.de>; Sat, 29 Nov 2025 10:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RIi/14T8XUyOcSVlPw5D1Kj4PscW6cnWkFBT9Ob+zOw=; b=bB8XPaJ39LF2x76wRFuegYbFby
	gMkwnKjCTAElKpw2uZGxOWSOLSunH8vNbgeno7q9L4h+JcAVAJ5xvonaNB+q2rVCLnv7KIUD/KpB2
	vWcQE6s3kAVvFHEfYRmBkZDlPQcUG1751qPlBRLmPqwg1aqLfpZRNqH241x05Ssja5dwhnb/V/a6b
	PexnzIWXA/pmxdZnweZiyPBsTSboPVye/OkHn6RFXIl2zYSQevkC+olwT36EZoAYEzAta/f25pQy2
	FOwHLLp0FJflTqVsad2Bj7ygSSvBm0J+Jqy08iWll+de30FUEvamcZEYvezuaEvEnJbVXWIuj3Ps1
	7Ky7GtaA==;
Received: from ip6-localhost ([::1]:28762 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vPHfk-00DZz6-4J; Sat, 29 Nov 2025 09:55:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25]:53238) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vPHfb-00DZyz-Jo
 for samba-technical@lists.samba.org; Sat, 29 Nov 2025 09:55:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 79AC260132
 for <samba-technical@lists.samba.org>; Sat, 29 Nov 2025 09:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258D8C116B1
 for <samba-technical@lists.samba.org>; Sat, 29 Nov 2025 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764410098;
 bh=93PgR+uiqEaP+YXfNmKB0fsgHhTm0n0MmP3ttqBY0O0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X6VpKAdJNMnlWhsD+ItqKDGTtH4z0VanXWTUZUdN+OR2yLmhYmEllmJVn1zByAzqR
 6Mj0YOocWYzw68Tq7K3G1T64YYYUxErDSO4hhrBzoqRwAFPdIFOONjQp/ak8Gto9Uj
 ZNHhbmzYe9Rz/ehEUEBOi/OsQhU/wpcfVWt9SbDgnkImR6jLFM3Qb9GIqoJJ5fe/25
 R5aq/WFE2kSh6mRU5w4YefnkKrYbsq6WcZcvwv6PZXQDfeluwxZ8eQfN5rinchtGcy
 RgOP031uQCvZBOQXH6pT2Z6Zpc7zkMNNBvefD+lTZksXpeQGL78g7dXvo/KM6MEGQ8
 V7WiCeMKMC39g==
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-640a3317b89so4005380a12.0
 for <samba-technical@lists.samba.org>; Sat, 29 Nov 2025 01:54:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXF34W7rxZ5HKiAZyAf4v2G40ZXWZh4fMXhXSCfJ4XTqhF1NH2UiDLMvLmu3FNmP7f2LeN8YzG1cji0tVw9+ns=@lists.samba.org
X-Gm-Message-State: AOJu0YyjzPxVTdyN0LXQh66EZbgNEkU/cZz3027435LmvlrmQP2VJ5rs
 4yDxRv11YyVCQo5CFmHv2e+0Vs3avx59eC0vjRnfb0jQAT0nuE7NhrZ7/kvEcnyf7sRjsh7iXuL
 8vVeZiTaH5fJrACC7JE7uO41wHqwQ6Eg=
X-Google-Smtp-Source: AGHT+IFUnQ4fPN9hnHsqfI/hb2fw50b9LdPmnrdZ+bXTSO9hsrxtENOCuIBQbfGjjjcPXZRpgNf4hRFIoFtVPgLcEeA=
X-Received: by 2002:a05:6402:50cf:b0:641:3960:511 with SMTP id
 4fb4d7f45d1cf-645eb23f98emr18198866a12.7.1764410096744; Sat, 29 Nov 2025
 01:54:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764091285.git.metze@samba.org>
In-Reply-To: <cover.1764091285.git.metze@samba.org>
Date: Sat, 29 Nov 2025 18:54:44 +0900
X-Gmail-Original-Message-ID: <CAKYAXd97Vf1j6GmS04qeZJuZQVzuR7Z6vxwM9+FHeJCsPz8JqA@mail.gmail.com>
X-Gm-Features: AWmQ_bkwFy_QeftFmJprWUpdu0zjm9hZTqpRyi-y5Uc-uo5bvMKV61arMy_pbEw
Message-ID: <CAKYAXd97Vf1j6GmS04qeZJuZQVzuR7Z6vxwM9+FHeJCsPz8JqA@mail.gmail.com>
Subject: Re: [PATCH v4 000/145] smb: smbdirect/client/server: moving to common
 functions and smbdirect.ko
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Paulo Alcantara <pc@manguebit.org>, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This patchset completely breaks ksmbd rdma. Even simple file copying
on Windows clients and cifs.ko doesn't work with the following error
messages.

with Windows client :
[  307.323201] ksmbd: smb_direct:
smbdirect_socket_schedule_cleanup(-ESHUTDOWN) called from
smbdirect_socket_shutdown in line=683 status=LISTENING
[  307.572330] ksmbd: running
[  473.984576] ksmbd: smb_direct: status=DISCONNECTED
first_error=-ECONNRESET => -ENOTCONN
[  473.984595] ksmbd: sock_read failed: -107
[  473.984708] ksmbd: smb_direct: status=DISCONNECTED
first_error=-ECONNRESET => -ENOTCONN
[  473.984726] ksmbd: sock_read failed: -107
[  480.044722] ksmbd: smb_direct: status=DISCONNECTED
first_error=-ECONNRESET => -ENOTCONN
[  480.044742] ksmbd: sock_read failed: -107
[  480.045290] ksmbd: smb_direct: status=DISCONNECTED
first_error=-ECONNRESET => -ENOTCONN
[  480.045307] ksmbd: sock_read failed: -107
[  480.045650] ksmbd: smb_direct: status=DISCONNECTED
first_error=-ECONNRESET => -ENOTCONN
[  480.045667] ksmbd: sock_read failed: -107
[  485.115961] ksmbd: smb_direct: status=DISCONNECTED
first_error=-ECONNRESET => -ENOTCONN
[  485.115980] ksmbd: sock_read failed: -107

with cifs.ko :
[  191.319885] CIFS: Attempting to mount //192.168.0.200/homes2
[  191.322664] CIFS: VFS: smbdirect_connect_rdma_event_handler:251
RDMA_CONNECT_RUNNING (first_error=0, expected=established) =>
event=rejected status=8 => ret=-ECONNREFUSED
[  191.322671] CIFS: VFS: smbdirect_connect_rdma_event_handler:260
smbdirect_socket_schedule_cleanup(-ECONNREFUSED) called from
smbdirect_connect_rdma_event_handler in line=260
status=RDMA_CONNECT_RUNNING
[  191.322681] CIFS: VFS: smbdirect_connection_wait_for_connected:784
connection failed -ECONNREFUSED device: rocep1s0f0 local:
192.168.0.200:50941 remote: 192.168.0.200:5445
[  191.322685] CIFS: VFS: smbdirect_connect_sync:834 wait for
smbdirect_connect(192.168.0.200:5445) failed -ECONNREFUSED
[  191.322688] CIFS: VFS: _smbd_get_connection:291
smbdirect_connect_sync(192.168.0.200:5445) failed with -111
-ECONNREFUSED
[  191.339145] CIFS: VFS: RDMA transport established

